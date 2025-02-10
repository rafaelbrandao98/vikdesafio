import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';

class Api {
  static String? apiUrl = dotenv.env['API_BASE_URL'];
  static String? apiToken = dotenv.env['API_TOKEN'];

  static Future<Response> get(String url,
      {Map<String, String>? headers}) async {
    Dio dio = Dio();

    final response = await dio.get(apiUrl! + url,
        options: Options(headers: {
          'Authorization': 'Bearer $apiToken',
          ...?headers,
        }));
    await _handleResponse(response);
    return response;
  }

  static Future<Response> post(String url,
      {Map<String, String>? headers,
      dynamic body,
      Map<String, dynamic>? queryParameters}) async {
    Dio dio = Dio();

    final response = await dio.post(apiUrl! + url,
        data: body,
        queryParameters: queryParameters,
        options: Options(headers: {
          'Authorization': 'Bearer $apiToken',
          ...?headers,
        }));
    await _handleResponse(response);
    return response;
  }

  static Future<Response> put(String url,
      {Map<String, String>? headers, dynamic body}) async {
    Dio dio = Dio();

    final response = await dio.put(apiUrl! + url,
        data: body,
        options: Options(
          headers: {
            'Authorization': 'Bearer $apiToken',
            ...?headers,
          },
        ));
    await _handleResponse(response);
    return response;
  }

  static Future delete(String url, {Map<String, String>? headers}) async {
    Dio dio = Dio();

    final response = await dio.delete(apiUrl! + url,
        options: Options(headers: {
          'Authorization': 'Bearer $apiToken',
          ...?headers,
        }));
    await _handleResponse(response);
  }

  static Future<Map<String, String>> _addTokenToHeaders(
      Map<String, String>? headers) async {
    return {
      'Authorization': 'Bearer $apiToken',
      ...?headers,
    };
  }

  static Future<void> _handleResponse(Response response) async {
    if (response.statusCode == 401) {}
  }
}
