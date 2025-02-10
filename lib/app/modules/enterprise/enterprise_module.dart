import 'package:desafiovik/app/modules/enterprise/enterprise_page.dart';
import 'package:desafiovik/app/modules/enterprise/enterprise_page.dart';
import 'package:desafiovik/app/modules/enterprise/enterprise_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EnterpriseModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(EnterpriseStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const EnterprisePage());
  }
}
