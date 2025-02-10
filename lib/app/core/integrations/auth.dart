import 'api.dart';

class AuthApi {
  final Api api = Api();

  Future<Map<String, dynamic>> signIn() async {
    try {
      final response = await Api.post('/api/v1/login');
      print(response.data);
      return {
        'success': true,
        'data': response.data,
      };
    } catch (error) {
      print('error$error');

      rethrow;
    }
  }
}
