// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invites_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InvitesStore on _InvitesStoreBase, Store {
  late final _$valueAtom =
      Atom(name: '_InvitesStoreBase.value', context: context);

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

  late final _$emailAtom =
      Atom(name: '_InvitesStoreBase.email', context: context);

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

  late final _$codigoAtom =
      Atom(name: '_InvitesStoreBase.codigo', context: context);

  @override
  String get codigo {
    _$codigoAtom.reportRead();
    return super.codigo;
  }

  @override
  set codigo(String value) {
    _$codigoAtom.reportWrite(value, super.codigo, () {
      super.codigo = value;
    });
  }

  late final _$activeAtom =
      Atom(name: '_InvitesStoreBase.active', context: context);

  @override
  bool get active {
    _$activeAtom.reportRead();
    return super.active;
  }

  @override
  set active(bool value) {
    _$activeAtom.reportWrite(value, super.active, () {
      super.active = value;
    });
  }

  late final _$createdAtAtom =
      Atom(name: '_InvitesStoreBase.createdAt', context: context);

  @override
  DateTime? get createdAt {
    _$createdAtAtom.reportRead();
    return super.createdAt;
  }

  @override
  set createdAt(DateTime? value) {
    _$createdAtAtom.reportWrite(value, super.createdAt, () {
      super.createdAt = value;
    });
  }

  late final _$updatedAtAtom =
      Atom(name: '_InvitesStoreBase.updatedAt', context: context);

  @override
  DateTime? get updatedAt {
    _$updatedAtAtom.reportRead();
    return super.updatedAt;
  }

  @override
  set updatedAt(DateTime? value) {
    _$updatedAtAtom.reportWrite(value, super.updatedAt, () {
      super.updatedAt = value;
    });
  }

  late final _$createInviteAsyncAction =
      AsyncAction('_InvitesStoreBase.createInvite', context: context);

  @override
  Future createInvite(String companyId) {
    return _$createInviteAsyncAction.run(() => super.createInvite(companyId));
  }

  late final _$getInvitesAsyncAction =
      AsyncAction('_InvitesStoreBase.getInvites', context: context);

  @override
  Future<List<Invite>> getInvites(String companyId) {
    return _$getInvitesAsyncAction.run(() => super.getInvites(companyId));
  }

  late final _$getInviteAsyncAction =
      AsyncAction('_InvitesStoreBase.getInvite', context: context);

  @override
  Future<Invite> getInvite(String companyId, dynamic inviteId) {
    return _$getInviteAsyncAction
        .run(() => super.getInvite(companyId, inviteId));
  }

  late final _$editInviteAsyncAction =
      AsyncAction('_InvitesStoreBase.editInvite', context: context);

  @override
  Future editInvite(String companyId, String inviteId) {
    return _$editInviteAsyncAction
        .run(() => super.editInvite(companyId, inviteId));
  }

  late final _$deleteInviteAsyncAction =
      AsyncAction('_InvitesStoreBase.deleteInvite', context: context);

  @override
  Future deleteInvite(String inviteId, String companyId) {
    return _$deleteInviteAsyncAction
        .run(() => super.deleteInvite(inviteId, companyId));
  }

  late final _$_InvitesStoreBaseActionController =
      ActionController(name: '_InvitesStoreBase', context: context);

  @override
  void increment() {
    final _$actionInfo = _$_InvitesStoreBaseActionController.startAction(
        name: '_InvitesStoreBase.increment');
    try {
      return super.increment();
    } finally {
      _$_InvitesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
email: ${email},
codigo: ${codigo},
active: ${active},
createdAt: ${createdAt},
updatedAt: ${updatedAt}
    ''';
  }
}
