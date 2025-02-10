import 'package:desafiovik/app/modules/register/register_page.dart';
import 'package:desafiovik/app/modules/register/register_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterModule extends Module {
  void binds(i) {
    i.addSingleton(RegisterStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => RegisterPage());
  }
}
