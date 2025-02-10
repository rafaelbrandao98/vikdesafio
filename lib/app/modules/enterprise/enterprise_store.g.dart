// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enterprise_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EnterpriseStore on _EnterpriseStoreBase, Store {
  late final _$valueAtom =
      Atom(name: '_EnterpriseStoreBase.value', context: context);

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

  late final _$uuidAtom =
      Atom(name: '_EnterpriseStoreBase.uuid', context: context);

  @override
  String get uuid {
    _$uuidAtom.reportRead();
    return super.uuid;
  }

  @override
  set uuid(String value) {
    _$uuidAtom.reportWrite(value, super.uuid, () {
      super.uuid = value;
    });
  }

  late final _$nomeAtom =
      Atom(name: '_EnterpriseStoreBase.nome', context: context);

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  late final _$enderecoAtom =
      Atom(name: '_EnterpriseStoreBase.endereco', context: context);

  @override
  String get endereco {
    _$enderecoAtom.reportRead();
    return super.endereco;
  }

  @override
  set endereco(String value) {
    _$enderecoAtom.reportWrite(value, super.endereco, () {
      super.endereco = value;
    });
  }

  late final _$siteAtom =
      Atom(name: '_EnterpriseStoreBase.site', context: context);

  @override
  String get site {
    _$siteAtom.reportRead();
    return super.site;
  }

  @override
  set site(String value) {
    _$siteAtom.reportWrite(value, super.site, () {
      super.site = value;
    });
  }

  late final _$activeAtom =
      Atom(name: '_EnterpriseStoreBase.active', context: context);

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

  late final _$companiesAtom =
      Atom(name: '_EnterpriseStoreBase.companies', context: context);

  @override
  List<Company>? get companies {
    _$companiesAtom.reportRead();
    return super.companies;
  }

  @override
  set companies(List<Company>? value) {
    _$companiesAtom.reportWrite(value, super.companies, () {
      super.companies = value;
    });
  }

  late final _$createCompanyAsyncAction =
      AsyncAction('_EnterpriseStoreBase.createCompany', context: context);

  @override
  Future createCompany() {
    return _$createCompanyAsyncAction.run(() => super.createCompany());
  }

  late final _$getCompaniesAsyncAction =
      AsyncAction('_EnterpriseStoreBase.getCompanies', context: context);

  @override
  Future<List<Company>> getCompanies() {
    return _$getCompaniesAsyncAction.run(() => super.getCompanies());
  }

  late final _$getCompanyAsyncAction =
      AsyncAction('_EnterpriseStoreBase.getCompany', context: context);

  @override
  Future<Company> getCompany(String companyId) {
    return _$getCompanyAsyncAction.run(() => super.getCompany(companyId));
  }

  late final _$editCompanyAsyncAction =
      AsyncAction('_EnterpriseStoreBase.editCompany', context: context);

  @override
  Future editCompany(String companyId) {
    return _$editCompanyAsyncAction.run(() => super.editCompany(companyId));
  }

  late final _$deleteCompanyAsyncAction =
      AsyncAction('_EnterpriseStoreBase.deleteCompany', context: context);

  @override
  Future deleteCompany(String companyId) {
    return _$deleteCompanyAsyncAction.run(() => super.deleteCompany(companyId));
  }

  late final _$logoutAsyncAction =
      AsyncAction('_EnterpriseStoreBase.logout', context: context);

  @override
  Future logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$_EnterpriseStoreBaseActionController =
      ActionController(name: '_EnterpriseStoreBase', context: context);

  @override
  void increment() {
    final _$actionInfo = _$_EnterpriseStoreBaseActionController.startAction(
        name: '_EnterpriseStoreBase.increment');
    try {
      return super.increment();
    } finally {
      _$_EnterpriseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
uuid: ${uuid},
nome: ${nome},
endereco: ${endereco},
site: ${site},
active: ${active},
companies: ${companies}
    ''';
  }
}
