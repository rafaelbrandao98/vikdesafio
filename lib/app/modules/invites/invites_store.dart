import 'package:desafiovik/app/core/models/invite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../core/integrations/invites.dart';
import '../enterprise/enterprise_store.dart';

part 'invites_store.g.dart';

class InvitesStore = _InvitesStoreBase with _$InvitesStore;

abstract class _InvitesStoreBase with Store {
  final EnterpriseStore enterpriseStore = Modular.get();

  @observable
  int value = 0;
  @observable
  String email = "";
  @observable
  String codigo = "";
  @observable
  bool active = false;
  @observable
  DateTime? createdAt;
  @observable
  DateTime? updatedAt;
  @action
  void increment() {
    value++;
  }

  @action
  createInvite(String companyId) async {
    await InviteApi().createInvite(
        {'email': email, 'name': email, 'kind': 'employee'}, companyId);
    Modular.to.pop();
  }

  @action
  Future<List<Invite>> getInvites(String companyId) async {
    return await InviteApi().getInvitesBycompanie(companyId);
  }

  @action
  Future<Invite> getInvite(String companyId, inviteId) async {
    return await InviteApi().getInvite(companyId, inviteId);
  }

  @action
  editInvite(String companyId, String inviteId) async {
    await InviteApi().editInvite({
      'uuid': inviteId,
      'name': email,
      'kind': 'employee',
      'email': email,
      'active': active,
      'companyName': enterpriseStore.nome,
    }, companyId, inviteId);
  }

  @action
  deleteInvite(String inviteId, String companyId) async {
    return await InviteApi().deleteInvite(inviteId, companyId);
  }
}
