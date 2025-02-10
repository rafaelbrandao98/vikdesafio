// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'root_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RootStore on _RootStoreBase, Store {
  late final _$valueAtom = Atom(name: '_RootStoreBase.value', context: context);

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$selectedTrunkAtom =
      Atom(name: '_RootStoreBase.selectedTrunk', context: context);

  @override
  int get selectedTrunk {
    _$selectedTrunkAtom.reportRead();
    return super.selectedTrunk;
  }

  @override
  set selectedTrunk(int value) {
    _$selectedTrunkAtom.reportWrite(value, super.selectedTrunk, () {
      super.selectedTrunk = value;
    });
  }

  late final _$statusAtom =
      Atom(name: '_RootStoreBase.status', context: context);

  @override
  AuthStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(AuthStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$userAtom = Atom(name: '_RootStoreBase.user', context: context);

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$emailAtom = Atom(name: '_RootStoreBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_RootStoreBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$accessTokenAtom =
      Atom(name: '_RootStoreBase.accessToken', context: context);

  @override
  String? get accessToken {
    _$accessTokenAtom.reportRead();
    return super.accessToken;
  }

  @override
  set accessToken(String? value) {
    _$accessTokenAtom.reportWrite(value, super.accessToken, () {
      super.accessToken = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_RootStoreBase.login', context: context);

  @override
  Future<void> login(dynamic context) {
    return _$loginAsyncAction.run(() => super.login(context));
  }

  late final _$registerAsyncAction =
      AsyncAction('_RootStoreBase.register', context: context);

  @override
  Future<void> register(dynamic context) {
    return _$registerAsyncAction.run(() => super.register(context));
  }

  late final _$_RootStoreBaseActionController =
      ActionController(name: '_RootStoreBase', context: context);

  @override
  dynamic setBucket(PageStorageBucket bck) {
    final _$actionInfo = _$_RootStoreBaseActionController.startAction(
        name: '_RootStoreBase.setBucket');
    try {
      return super.setBucket(bck);
    } finally {
      _$_RootStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedTrunk(int value) {
    final _$actionInfo = _$_RootStoreBaseActionController.startAction(
        name: '_RootStoreBase.setSelectedTrunk');
    try {
      return super.setSelectedTrunk(value);
    } finally {
      _$_RootStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUser(User? value) {
    final _$actionInfo = _$_RootStoreBaseActionController.startAction(
        name: '_RootStoreBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_RootStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
selectedTrunk: ${selectedTrunk},
status: ${status},
user: ${user},
email: ${email},
password: ${password},
accessToken: ${accessToken}
    ''';
  }
}
