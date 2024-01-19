import 'dart:convert';
import 'package:biori/style/constants.dart';
import 'package:http/http.dart' as http;

enum Output {
  success,
  error,
}

class DoLogin {
  Future<Output> run(username, password) async {
    Output output = Output.error;

    http.Response login = await loginUser(username, password);

    if (login.statusCode == 200){
      output = Output.success;
    }

    return output;

  }


  Future<http.Response> loginUser(String username, String password) {
    return http.post(
      Uri.parse(Constants.URI),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );
  }


}
