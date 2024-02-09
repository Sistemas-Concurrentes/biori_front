import 'dart:io';

import 'package:biori/style/constants.dart';
import 'package:http/http.dart' as http;
import 'package:biori/conection_to_backend/authentication_screen/output.dart';

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
    http.Response response = await postRequest(login, data);

    return response.statusCode == 200 ? Output.success : Output.error;
  }

  static Future<Output> registerRequestReturnsOutput(data) async {
    http.Response response = await postRequest(register, data);

    return response.statusCode == 200 ? Output.success : Output.error;
  }
}
