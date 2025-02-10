import 'package:desafiovik/app/core/models/company.dart';
import 'package:desafiovik/app/core/shared/constants.dart';
import 'package:desafiovik/app/modules/enterprise/enterprise_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EditEnterprisePage extends StatefulWidget {
  final String companyId;

  const EditEnterprisePage({Key? key, required this.companyId})
      : super(key: key);

  @override
  _EditEnterprisePageState createState() => _EditEnterprisePageState();
}

class _EditEnterprisePageState extends State<EditEnterprisePage> {
  final _formKey = GlobalKey<FormState>();
  final EnterpriseStore store = Modular.get();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();
  final TextEditingController _siteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadCompanyData();
  }

  _loadCompanyData() async {
    try {
      Company company = await store.getCompany(widget.companyId);
      _nomeController.text = company.name;
      _enderecoController.text = company.address;
      _siteController.text = company.site;

      setState(() {
        store.nome = company.name;
        store.endereco = company.address;
        store.site = company.site;
        store.active = company.active;
        store.uuid = company.uuid;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Erro ao carregar dados da empresa.")),
      );
    }
  }

  void _salvarEmpresa() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      store.editCompany(widget.companyId);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Empresa atualizada com sucesso!")),
      );

      _formKey.currentState!.reset();
      Modular.to.popAndPushNamed("/");
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Editar Empresa"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            store.nome = "";
            store.endereco = "";
            store.site = "";
            Modular.to.popAndPushNamed('/');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Observer(builder: (context) {
          return Form(
            key: _formKey,
            child: Column(
              children: [
                CircleAvatar(
                  radius: screenHeight * 0.1,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.business,
                    size: screenWidth * 0.3,
                    color: appColorDeafut,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                ElevatedButton(
                  onPressed: () {
                    Modular.to.pushNamed("/invites");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: Size(screenWidth * 0.05, screenHeight * 0.05),
                  ),
                  child: const Text(
                    "Lista de convites",
                    style: TextStyle(color: appColorDeafut),
                  ),
                ),
                SwitchListTile(
                  title: Text("Status"),
                  subtitle: Text(store.active ? "Ativo" : "Inativo"),
                  value: store.active,
                  onChanged: (value) {
                    setState(() {
                      store.active = value;
                    });
                  },
                  activeColor: Colors.green,
                  activeTrackColor: Colors.lightGreen,
                  secondary: Icon(store.active
                      ? Icons.check_circle
                      : Icons.cancel), // Ícone dependendo do status
                ),
                TextFormField(
                  controller: _nomeController,
                  decoration:
                      const InputDecoration(labelText: "Nome da Empresa"),
                  onChanged: (value) => store.nome = value!,
                ),
                TextFormField(
                  controller: _enderecoController,
                  decoration: const InputDecoration(labelText: "Endereço"),
                  validator: (value) =>
                      value!.isEmpty ? "Insira o endereço" : null,
                  onSaved: (value) => store.endereco = value!,
                ),
                TextFormField(
                  controller: _siteController,
                  decoration: const InputDecoration(labelText: "Site"),
                  validator: (value) =>
                      value!.isEmpty ? "Insira o site da empresa" : null,
                  onSaved: (value) => store.site = value!,
                ),
                SizedBox(height: screenHeight * 0.14),
                ElevatedButton(
                  onPressed: _salvarEmpresa,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: appColorDeafut,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: const Text(
                    "Salvar Alterações",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
