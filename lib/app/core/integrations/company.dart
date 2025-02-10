import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desafiovik/app/core/integrations/api.dart';

import '../models/company.dart';

class CompanyApi {
  createCompany(data) async {
    try {
      final response = await Api.post('/api/v1/companies', body: data);
      return response.data;
    } catch (error) {
      print('error$error');

      rethrow;
    }
  }

  getCompanies() async {
    try {
      final response = await Api.get('/api/v1/companies');
      List<dynamic> data = response.data;
      return data.map((companyData) => Company.fromMap(companyData)).toList();
    } catch (error) {
      print('error$error');

      rethrow;
    }
  }

  getCompany(String companyId) async {
    try {
      final response = await Api.get('/api/v1/companies/$companyId');
      return Company.fromMap(response.data);
      // return data.map((companyData) => Company.fromMap(companyData));
    } catch (error) {
      print('error$error');

      rethrow;
    }
  }

  editCompany(String companyId, data) async {
    try {
      final response =
          await Api.put('/api/v1/companies/$companyId', body: data);
      print("Company===${response}");
      // return data.map((companyData) => Company.fromMap(companyData));
    } catch (error) {
      print('error$error');

      rethrow;
    }
  }

  deleteCompany(String companyId) async {
    try {
      final response = await Api.delete('/api/v1/companies/$companyId');
    } catch (error) {
      print('error$error');

      rethrow;
    }
  }
}
