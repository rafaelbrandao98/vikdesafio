import 'package:desafiovik/app/core/models/invite.dart';
import 'package:desafiovik/app/modules/enterprise/enterprise_store.dart';
import 'package:desafiovik/app/modules/invites/widgets/create.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:desafiovik/app/modules/invites/invites_store.dart';
import 'package:flutter/material.dart';

import '../../core/shared/constants.dart';
import '../enterprise/widgets/detail.dart';
import 'widgets/detail.dart';

class InvitesPage extends StatefulWidget {
  final String title;
  const InvitesPage({Key? key, this.title = 'InvitesPage'}) : super(key: key);
  @override
  InvitesPageState createState() => InvitesPageState();
}

class InvitesPageState extends State<InvitesPage> {
  final InvitesStore store = Modular.get();
  final EnterpriseStore enterpriseStore = Modular.get();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    store.getInvites(enterpriseStore.uuid);
  }

  excluirEnvite(String inviteId, Invite invite) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
              "Excluir convite: ${invite.name}, da empresa: ${enterpriseStore.nome}"),
          content: const Text("Tem certeza que deseja excluir este convite?"),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                try {
                  await store.deleteInvite(inviteId, enterpriseStore.uuid);
                  Modular.to.popAndPushNamed('/invites');
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Convite excluída com sucesso!")),
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

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EditEnterprisePage(
                        companyId: enterpriseStore.uuid,
                      )),
            );
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment
              .spaceBetween, // Alinha os elementos corretamente
          children: [
            Text(
              "Convites Empresa: ${enterpriseStore.nome}",
              style: const TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
              height: screenHeight * 0.03,
            ),
            SizedBox(
              width: screenWidth * 0.4,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateInvitePage()),
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
                  "Criar convite",
                  style: TextStyle(
                      color: appColorDeafut,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            SizedBox(
              height: screenHeight,
              child: FutureBuilder<List<Invite>>(
                  future: store.getInvites(enterpriseStore.uuid),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    List<Invite> invites = snapshot.data!;

                    return ListView.builder(
                      itemCount: invites.length,
                      itemBuilder: (context, index) {
                        Invite invite = invites[index];
                        return ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: appColorDeafut, // Cor de fundo
                            child: Icon(Icons.mail,
                                color: Colors.white,
                                size: 22), // Ícone no avatar
                          ),
                          title: Text(
                            invite.email,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                invite.kind,
                                style: const TextStyle(color: Colors.black),
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
                                  excluirEnvite(invite.uuid, invite);
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.arrow_forward_outlined,
                                    color: appColorDeafut),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => InviteDetailPage(
                                        inviteId: invite.uuid,
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
                                builder: (context) => InviteDetailPage(
                                  inviteId: invite.uuid,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
