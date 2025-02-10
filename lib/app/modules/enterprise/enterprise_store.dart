import 'dart:ffi';

import 'package:desafiovik/app/core/modules/root/root_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../core/integrations/company.dart';
import '../../core/models/company.dart';

part 'enterprise_store.g.dart';

class EnterpriseStore = _EnterpriseStoreBase with _$EnterpriseStore;

abstract class _EnterpriseStoreBase with Store {
  final RootStore rootStore = Modular.get();

  @observable
  int value = 0;
  @observable
  String uuid = "";
  @observable
  String nome = "";
  @observable
  String endereco = "";
  @observable
  String site = "";
  @observable
  bool active = false;
  @observable
  List<Company>? companies;
  @action
  void increment() {
    value++;
  }

  @action
  createCompany() async {
    await CompanyApi()
        .createCompany({'name': nome, 'endereco': endereco, 'site': site});
  }

  @action
  Future<List<Company>> getCompanies() async {
    return await CompanyApi().getCompanies();
  }

  @action
  Future<Company> getCompany(String companyId) async {
    return await CompanyApi().getCompany(companyId);
  }

  @action
  editCompany(String companyId) async {
    await CompanyApi().editCompany(companyId,
        {'name': nome, 'endereco': endereco, 'site': site, 'active': active});
  }

  @action
  deleteCompany(String companyId) async {
    return await CompanyApi().deleteCompany(companyId);
  }

  @action
  logout() async {
    return await rootStore.signout();
  }
}
