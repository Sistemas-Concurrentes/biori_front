import 'dart:convert';
import 'dart:io';
import 'package:biori/style/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  Future<http.Response> getRequestWithHeader(uri, token) async {
    try {
      return await http.get(
        Uri.parse(uri),
        headers: <String, String>{
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

  Future<http.Response> postRequestWithHeader(String uri, data) async {
    String token = await _getToken();
    try {
      return await http.post(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': "Bearer $token",
        },
        body: jsonEncode(data),
      );
    } catch (e) {
      return http.Response('Conection failed', HttpStatus.internalServerError);
    }
  }


  static _saveToken(token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(Constants().TOKEN, token);
  }

  static _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(Constants().TOKEN);
  }
}
