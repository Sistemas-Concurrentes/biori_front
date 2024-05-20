import 'dart:convert';
import 'dart:io';

import 'package:biori/authentication_screen/login/validation/dto/validation_dto_result.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:biori/style/constants.dart';
import 'package:http/http.dart' as http;
import 'package:biori/conection_to_backend/authentication_screen/output.dart';

import '../../authentication_screen/login/dto/login_dto_result.dart';

class Requests {
  final login = "${Constants().URI}/auth/login";
  final register = "${Constants().URI}/auth/register";
  final validation = "${Constants().URI}/auth/validation";
  final resend = "${Constants().URI}/auth/resend";

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

  static Future<http.Response> postRequestWithHeader(uri, token, data) async {
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

  Future<Output> loginRequestReturnsOutput(data) async {
    Output output = Output.error;

    http.Response response = await postRequest(login, data);
    if (response.statusCode == 200) {
      LoginDtoResult loginDtoResult = LoginDtoResult.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);

      await _saveToken(loginDtoResult.token);

      loginDtoResult.register_code == 0 ? output = Output.success : output = Output.userNotValidated;
    }

    return output;
  }

  Future<Output> registerRequestReturnsOutput(data) async {
    http.Response response = await postRequest(register, data);
    return _outputByStatusCode(response.statusCode);

  }

  Future<Output> validationRequestReturnsOutput(data, token) async {
    http.Response response = await postRequestWithHeader(validation, token, data);
    if (response.statusCode == 200) {
      ValidationDtoResult validationDtoResult = ValidationDtoResult.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
      await _saveToken(validationDtoResult.token);
    }

    return _outputByStatusCode(response.statusCode);
  }

  Future<Output> doRequestResendReturnsOutput(String token) async {
    http.Response response = await postRequestWithHeader(resend, token, {});
    return _outputByStatusCode(response.statusCode);
  }

  static _saveToken(token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  static Output _outputByStatusCode(int statusCode) {
    if (statusCode == 200) {
      return Output.success;
    } else if (statusCode == 409) {
      return Output.userAlreadyExists;
    } else {
      return Output.error;
    }
  }


}
