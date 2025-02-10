import 'package:desafiovik/app/core/shared/constants.dart';
import 'package:desafiovik/app/modules/invites/invites_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../enterprise/enterprise_store.dart';

class CreateInvitePage extends StatefulWidget {
  @override
  _CreateInvitePageState createState() => _CreateInvitePageState();
}

class _CreateInvitePageState extends State<CreateInvitePage> {
  final _formKey = GlobalKey<FormState>();
  final InvitesStore store = Modular.get();
  final EnterpriseStore enterpriseStore = Modular.get();

  void _salvarEmpresa() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      store.createInvite(enterpriseStore.uuid);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Convite criado com sucesso!")),
      );

      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("Criar convite")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CircleAvatar(
                radius: screenHeight * 0.1,
                backgroundColor: Colors.white,
                child: Image.asset(
                  'assets/img/vikLogo.png',
                  width: screenWidth * 0.3,
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Email"),
                validator: (value) => value!.isEmpty ? "Email" : null,
                onSaved: (value) => store.email = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Código"),
                validator: (value) => value!.isEmpty ? "Código" : null,
                onSaved: (value) => store.codigo = value!,
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              ElevatedButton(
                onPressed: _salvarEmpresa,
                style: ElevatedButton.styleFrom(
                  backgroundColor: appColorDeafut,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  "Salvar convite",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
