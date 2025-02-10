import 'package:desafiovik/app/core/shared/constants.dart';
import 'package:desafiovik/app/modules/enterprise/enterprise_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreateEnterprisePage extends StatefulWidget {
  @override
  _CreateEnterprisePageState createState() => _CreateEnterprisePageState();
}

class _CreateEnterprisePageState extends State<CreateEnterprisePage> {
  final _formKey = GlobalKey<FormState>();
  final EnterpriseStore store = Modular.get();

  void _salvarEmpresa() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      store.createCompany();
      Modular.to.popAndPushNamed('/');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Empresa criada com sucesso!")),
      );

      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text("Criar Empresa")),
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
                decoration: const InputDecoration(labelText: "Nome da Empresa"),
                validator: (value) =>
                    value!.isEmpty ? "Insira o nome da empresa" : null,
                onSaved: (value) => store.nome = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Endereço"),
                validator: (value) =>
                    value!.isEmpty ? "Insira o endereço" : null,
                onSaved: (value) => store.endereco = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Site"),
                validator: (value) =>
                    value!.isEmpty ? "Insira o site da empresa" : null,
                onSaved: (value) => store.site = value!,
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              ElevatedButton(
                onPressed: _salvarEmpresa,
                child: Text(
                  "Salvar Empresa",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: appColorDeafut,
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
