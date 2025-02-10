import 'package:desafiovik/app/core/integrations/api.dart';

import '../models/invite.dart';

class InviteApi {
  createInvite(data, companyId) async {
    try {
      final response =
          await Api.post('/api/v1/companies/$companyId/invites', body: data);
      return response.data;
    } catch (error) {
      print('error$error');

      rethrow;
    }
  }

  editInvite(data, companyId, inviteId) async {
    try {
      final response = await Api.put(
          '/api/v1/companies/$companyId/invites/$inviteId',
          body: data);
      return response.data;
    } catch (error) {
      print('error$error');

      rethrow;
    }
  }

  getInvitesBycompanie(companyId) async {
    try {
      final response = await Api.get('/api/v1/companies/$companyId/invites');
      List<dynamic> data = response.data;
      print(response.data);
      return data.map((inviteData) => Invite.fromMap(inviteData)).toList();
      // return data.map((companyData) => Company.fromMap(companyData)).toList();
    } catch (error) {
      print('error$error');

      rethrow;
    }
  }

  getInvite(companyId, inviteId) async {
    try {
      final response =
          await Api.get('/api/v1/companies/$companyId/invites/$inviteId');
      return Invite.fromMap(response.data);
      // return data.map((companyData) => Company.fromMap(companyData));
    } catch (error) {
      print('error$error');

      rethrow;
    }
  }

  deleteInvite(inviteId, companyId) async {
    try {
      final response =
          await Api.delete('/api/v1/companies/$companyId/invites/$inviteId');
    } catch (error) {
      print('error$error');

      rethrow;
    }
  }
}
