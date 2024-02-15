import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:biori/style/constants.dart';
import 'package:http/http.dart' as http;
import 'package:biori/conection_to_backend/authentication_screen/output.dart';

import '../../authentication_screen/login/dto/login_dto_result.dart';

class Requests {
  static String url = Constants.URI;
  static String login = "$url/auth/login";
  static String register = "$url/auth/register";

  static Future<http.Response> postRequest(uri, data) async {
    try {
      return await http.post(
        Uri.parse(uri),
        body: data,
      );
    } catch (e) {
      return http.Response('Conection failed', HttpStatus.internalServerError);
    }
  }

  static Future<Output> loginRequestReturnsOutput(data) async {
    Output output = Output.error;

    http.Response response = await postRequest(login, data);
    if (response.statusCode == 200) {
      LoginDtoResult loginDtoResult = LoginDtoResult.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', loginDtoResult.token);

      loginDtoResult.register_code == 0 ? output = Output.success : output = Output.userNotValidated;
    }

    return output;
  }

  static Future<Output> registerRequestReturnsOutput(data) async {
    http.Response response = await postRequest(register, data);

    return response.statusCode == 200 ? Output.success : Output.error;
  }
}
