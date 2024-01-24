import 'dart:convert';

import 'package:biori/style/constants.dart';
import 'package:http/http.dart' as http;
import 'package:biori/conection_to_backend/output.dart';

class Requests{
  static String url = Constants.URI;
  static String login = "$url/login";
  static String register = "$url/register";

  static Future<http.Response> postRequestReturnsOutput(uri,data) async {
    return http.post(
        Uri.parse(uri),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );

  }

  static Future<Output> loginRequestReturnsOutput(data) async {
    http.Response response = await postRequestReturnsOutput(login, data);

    return response.statusCode == 200 ? Output.success : Output.error;

  }

  static Future<Output> registerRequestReturnsOutput(data) async {
    http.Response response = await postRequestReturnsOutput(register, data);

    return response.statusCode == 200 ? Output.success : Output.error;

  }


}