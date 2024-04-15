import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  Future<http.Response> getRequestWithHeader(uri, token) async {
    try {
      return await http.get(
        Uri.parse(uri),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
    } catch (e) {
      return http.Response('Conection failed', HttpStatus.internalServerError);
    }
  }

  Future<http.Response> postRequest(uri, data) async {
    try {
      return await http.post(
        Uri.parse(uri),
        body: data,
      );
    } catch (e) {
      return http.Response('Conection failed', HttpStatus.internalServerError);
    }
  }

  Future<http.Response> postRequestWithHeader(uri, token, data) async {
    try {
      return await http.post(
        Uri.parse(uri),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: data,
      );
    } catch (e) {
      return http.Response('Conection failed', HttpStatus.internalServerError);
    }
  }


  static _saveToken(token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }
}
