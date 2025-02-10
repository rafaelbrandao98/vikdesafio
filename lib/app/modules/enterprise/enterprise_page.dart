import 'package:desafiovik/app/core/shared/constants.dart';
import 'package:desafiovik/app/modules/enterprise/widgets/create.dart';
import 'package:desafiovik/app/modules/enterprise/widgets/detail.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:desafiovik/app/modules/enterprise/enterprise_store.dart';
import 'package:flutter/material.dart';

import '../../core/models/company.dart';

class EnterprisePage extends StatefulWidget {
  final String title;
  const EnterprisePage({Key? key, this.title = 'EnterprisePage'})
      : super(key: key);
  @override
  EnterprisePageState createState() => EnterprisePageState();
}

class EnterprisePageState extends State<EnterprisePage> {
  final EnterpriseStore store = Modular.get();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    store.getCompanies();
  }

  excluirEmpresa(String companyId, Company company) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Excluir empresa: ${company.name}"),
          content: const Text("Tem certeza que deseja excluir esta empresa?"),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                try {
                  await store.deleteCompany(companyId);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Empresa excluída com sucesso!")),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Erro ao excluir a empresa.")),
                  );
                }
              },
              child: const Text("Sim", style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Não"),
            ),
          ],
        );
      },
    );
  }

  logout() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Sair",
            style: TextStyle(color: appColorDeafut),
          ),
          content: const Text(
            "Tem certeza que deseja Sair?",
            style: TextStyle(color: appColorDeafut),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                try {
                  await store.logout();
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Erro ao sair.")),
                  );
                }
              },
              child: const Text("Sim", style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Não"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/img/vikLogo.png',
                width: screenWidth * 0.2,
              ),
              const Text(
                "Desafio VIK",
                style: TextStyle(
                    color: appColorDeafut,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              IconButton(
                icon: const Icon(Icons.exit_to_app,
                    color: Colors.red), // Ícone de saída
                onPressed: logout,
              )
            ],
          )),
      body: SingleChildScrollView(
        child: Observer(builder: (context) {
          return Column(
            children: [
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Container(
                height: screenHeight * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Lista de empresas",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateEnterprisePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.015,
                          horizontal: screenWidth * 0.05,
                        ),
                      ),
                      child: const Text(
                        "Criar empresa",
                        style: TextStyle(
                            color: appColorDeafut,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              SizedBox(
                height: screenHeight,
                child: FutureBuilder<List<Company>>(
                    future: store.getCompanies(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: appColorDeafut,
                          ),
                        );
                      }

                      if (snapshot.hasError) {
                        return Center(
                            child: Text(
                                'Erro ao carregar empresas: ${snapshot.error}'));
                      }

                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(
                            child: Text('Nenhuma empresa encontrada.'));
                      }
                      List<Company> companies = snapshot.data!;

                      return ListView.builder(
                        itemCount: companies.length,
                        itemBuilder: (context, index) {
                          Company company = companies[index];
                          return Card(
                            elevation: 3,
                            color: Colors.white,
                            margin: const EdgeInsets.all(8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListTile(
                              leading: const CircleAvatar(
                                backgroundColor: appColorDeafut, // Cor de fundo
                                child: Icon(Icons.business,
                                    color: Colors.white,
                                    size: 20), // Ícone no avatar
                              ),
                              title: Text(
                                company.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    company.uuid,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    company.site,
                                    style:
                                        const TextStyle(color: appColorDeafut),
                                  ),
                                ],
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                    ),
                                    onPressed: () {
                                      excluirEmpresa(company.uuid, company);
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                        Icons.arrow_forward_outlined,
                                        color: appColorDeafut),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              EditEnterprisePage(
                                            companyId: company.uuid,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditEnterprisePage(
                                            companyId: company.uuid,
                                          )),
                                );
                              },
                            ),
                          );
                        },
                      );
                    }),
              ),
            ],
          );
        }),
      ),
    );
  }
}
