import 'package:desafiovik/app/core/modules/root/root_page.dart';
import 'package:desafiovik/app/core/modules/root/root_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RootModule extends Module {
  void binds(i) {
    i.addSingleton(RootStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const RootPage(), children: [
      ChildRoute('/splash', child: (context) => const RootPage()),
    ]);
  }
}
