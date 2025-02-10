import 'package:desafiovik/app/modules/login/login_page.dart';
import 'package:desafiovik/app/modules/login/login_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  void binds(i) {
    i.addSingleton(LoginStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => LoginPage());
  }
}
