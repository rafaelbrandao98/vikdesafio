import 'package:desafiovik/app/core/models/invite.dart';
import 'package:desafiovik/app/core/shared/constants.dart';
import 'package:desafiovik/app/modules/invites/invites_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../enterprise/enterprise_store.dart';

class InviteDetailPage extends StatefulWidget {
  final String inviteId;

  const InviteDetailPage({Key? key, required this.inviteId}) : super(key: key);

  @override
  _InviteDetailPageState createState() => _InviteDetailPageState();
}

class _InviteDetailPageState extends State<InviteDetailPage> {
  final _formKey = GlobalKey<FormState>();

  final InvitesStore store = Modular.get();
  final EnterpriseStore enterpriseStore = Modular.get();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _codigoController = TextEditingController();
  _loadInviteData() async {
    try {
      Invite invite =
          await store.getInvite(enterpriseStore.uuid, widget.inviteId);
      _emailController.text = invite.email;
      _codigoController.text = invite.code!;
      setState(() {
        store.email = invite.email;
        store.codigo = invite.code!;
        store.active = invite.active;
        store.createdAt = invite.createdAt;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Erro ao carregar os dados do convite. ")),
      );
    }
  }

  void _salvarInvite() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      store.editInvite(enterpriseStore.uuid, widget.inviteId);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Atualizado com sucesso!")),
      );

      _formKey.currentState!.reset();
      Modular.to.pop();
    }
  }

  @override
  void initState() {
    super.initState();
    _loadInviteData();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text("Detalhes do Convite")),
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
                SwitchListTile(
                  title: const Text("Status"),
                  subtitle: Text(store!.active ? "Ativo" : "Inativo"),
                  value: store!.active,
                  onChanged: (value) {
                    setState(() {
                      store.active = value;
                    });
                  },
                  activeColor: Colors.green,
                  activeTrackColor: Colors.lightGreen,
                  secondary: Icon(store!.active
                      ? Icons.check_circle
                      : Icons.cancel), // Ícone dependendo do status
                ),
                TextFormField(
                  controller: _emailController,
                  decoration:
                      const InputDecoration(labelText: "Email do convite"),
                  onChanged: (value) => store.email = value!,
                ),
                TextFormField(
                  controller: _codigoController,
                  decoration:
                      const InputDecoration(labelText: "Código do convite"),
                  validator: (value) =>
                      value!.isEmpty ? "Insira o Código" : null,
                  onSaved: (value) => store.codigo = value!,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _salvarInvite,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: appColorDeafut,
                    minimumSize: const Size(double.infinity, 50),
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
