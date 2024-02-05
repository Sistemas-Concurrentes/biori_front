import 'dart:convert';

import 'package:biori/style/constants.dart';
import 'package:http/http.dart' as http;
import 'package:biori/conection_to_backend/output.dart';

class Requests{
  static String url = Constants.URI;
  static String login = "$url/auth/login";
  static String register = "$url/auth/register";

  static Future<http.Response> postRequestReturnsOutput(uri,data) async {
    return await http.post(
        Uri.parse(uri),
        body: data,
      );

  }

  static Future<Output> loginRequestReturnsOutput(data) async {
    http.Response response = await postRequestReturnsOutput(login, data);

    print(response.statusCode);
    return response.statusCode == 200 ? Output.success : Output.error;

  }

  static Future<Output> registerRequestReturnsOutput(data) async {
    http.Response response = await postRequestReturnsOutput(register, data);

    print(response.statusCode);
    return response.statusCode == 200 ? Output.success : Output.error;

  }


}