import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../integrations/auth.dart';
import '../../utils/auth_status_enum.dart';
part 'root_store.g.dart';

class RootStore = _RootStoreBase with _$RootStore;

abstract class _RootStoreBase with Store {
  _RootStoreBase() {
    setUser(FirebaseAuth.instance.currentUser);
  }
  final storage = FlutterSecureStorage();

  @observable
  int value = 0;
  @observable
  int selectedTrunk = 0;
  // @computed
  PageStorageBucket? bucketGlobal;
  @observable
  AuthStatus status = AuthStatus.loading;
  @observable
  User? user;
  @observable
  String email = '';
  @observable
  String password = '';
  @observable
  String? accessToken;
  @action
  setBucket(PageStorageBucket bck) => bucketGlobal = bck;
  @action
  setSelectedTrunk(int value) => selectedTrunk = value;
  @action
  setUser(User? value) {
    user = value;
    print(user);
    user == null ? selectedTrunk = 0 : selectedTrunk = 1;
  }

  Future<void> signout() async {
    try {
      await storage.delete(key: 'firebase_token');
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print("Erro ao deslogar $e");
    }
  }

  @action
  Future<void> login(context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = FirebaseAuth.instance.currentUser;
      String? idToken = await user?.getIdToken();
      if (idToken != null) {
        await storage.write(key: 'firebase_token', value: idToken);
      }

      selectedTrunk = 1;
      await Modular.to.pushReplacementNamed('/');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Nenhum usuário encontrado para esse e-mail.')),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Senha incorreta.')),
        );
      }
    }
  }

  @action
  Future<void> register(context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = FirebaseAuth.instance.currentUser;
      String? idToken = await user?.getIdToken();
      if (idToken != null) {
        await storage.write(key: 'firebase_token', value: idToken);
      }
      selectedTrunk = 1;

      await Modular.to.pushReplacementNamed('/');

      print('Usuário registrado com sucesso: ${userCredential.user?.email}');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('A senha fornecida é muito fraca.');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('A senha fornecida é muito fraca.'),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        print('Já existe uma conta para esse e-mail.');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Já existe uma conta para esse e-mail.'),
          ),
        );
      }
    } catch (e) {
      print('Erro ao registrar: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erro ao registrar'),
        ),
      );
    }
  }
}
