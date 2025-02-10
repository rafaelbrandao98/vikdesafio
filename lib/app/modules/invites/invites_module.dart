import 'package:desafiovik/app/modules/invites/invites_page.dart';
import 'package:desafiovik/app/modules/invites/invites_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InvitesModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(InvitesStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => InvitesPage());
  }
}
