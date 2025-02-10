import 'package:desafiovik/app/core/modules/root/root_store.dart';
import 'package:desafiovik/app/modules/enterprise/enterprise_page.dart';
import 'package:desafiovik/app/modules/login/login_module.dart';
import 'package:desafiovik/app/modules/login/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RootPage extends StatefulWidget {
  final String title;
  const RootPage({Key? key, this.title = 'RootPage'}) : super(key: key);
  @override
  RootPageState createState() => RootPageState();
}

class RootPageState extends State<RootPage> {
  RootStore store = Modular.get();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      store.setBucket(PageStorageBucket());
    });
    super.initState();
  }

  List<Widget> trunkModule = [
    LoginPage(),
    const EnterprisePage()
    // LoginModule()
    // SplashModule(),
    // InitialPageModule(),
    // NavbarModule()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          // backgroundColor: ThemeConecta().backgroundColor,
          body: Observer(builder: (context) {
        return trunkModule[store.selectedTrunk];
      })),
    );
  }
}
