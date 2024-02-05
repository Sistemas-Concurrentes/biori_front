import 'package:biori/conection_to_backend/requests.dart';
import 'package:biori/conection_to_backend/output.dart';


class DoRegister {
  Future<Output> run(nombre, apellidos, username, password, fechaNacimiento,
      telefono) async {
    String fechaNacimientoString = fechaNacimiento.toIso8601String();
    Map<String, dynamic>data = {
      "nombre": nombre,
      "apellidos": apellidos,
      "username": username,
      "password": password,
      "fecha_nacimiento": fechaNacimientoString,
      "telefono": telefono
    };

    return await Requests.registerRequestReturnsOutput(data);
  }

}