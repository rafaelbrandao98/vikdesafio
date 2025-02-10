import 'package:desafiovik/app/core/modules/root/root_store.dart';
import 'package:desafiovik/app/modules/enterprise/enterprise_store.dart';
import 'package:desafiovik/app/modules/invites/invites_module.dart';
import 'package:desafiovik/app/modules/invites/invites_store.dart';
import 'package:desafiovik/app/modules/login/login_module.dart';
import 'package:desafiovik/app/modules/login/login_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/core/modules/root/root_module.dart';
import 'app/modules/register/register_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(LoginStore.new);
    i.addSingleton(RootStore.new);
    i.addSingleton(EnterpriseStore.new);
    i.addSingleton(InvitesStore.new);
  }

  @override
  void routes(r) {
    r.module(Modular.initialRoute, module: RootModule());
    r.module('/login', module: LoginModule());
    r.module('/invites', module: InvitesModule());
    r.module('/register', module: RegisterModule());
  }
}
