import 'dart:convert';
import 'package:biori/style/constants.dart';
import 'package:http/http.dart' as http;

enum Output {
  success,
  error,
}

class DoRegister {
  Future<Output> run(nombre, apellidos, username, password, fecha_nacimiento,
      telefono) async {
    Output output = Output.error;

    http.Response login = await registerUser(nombre, apellidos, username,
        password, fecha_nacimiento, telefono);

    if (login.statusCode == 200){
      output = Output.success;
    }

    return output;

  }


  Future<http.Response> registerUser(String nombre, String apellidos,
      String username, String password, DateTime fecha_nacimiento,
      String telefono) {
    String fecha_nacimiento_string = fecha_nacimiento.toIso8601String();

    final data = {
      "nombre": nombre,
      "apellidos": apellidos,
      "username": username,
      "password": password,
      "fecha_nacimiento": fecha_nacimiento_string,
      "telefono": telefono
    };


    return http.post(
      Uri.parse(Constants.URI),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
  }


}
