import 'dart:convert';
import 'package:biori/conection_to_backend/requests.dart';
import 'package:biori/style/constants.dart';
import 'package:http/http.dart' as http;
import 'package:biori/conection_to_backend/output.dart';


class DoLogin {
  Future<Output> run(username, password) async {

    final data = {
      "username": username,
      "password": password,
    };

    return await Requests.loginRequestReturnsOutput(data);

  }

}
