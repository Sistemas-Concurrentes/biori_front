import 'package:biori/conection_to_backend/requests.dart';
import 'package:biori/conection_to_backend/output.dart';


class DoRegister {
  Future<Output> run(nombre, apellidos, username, password, fecha_nacimiento,
      telefono) async {
    String fechaNacimientoString = fecha_nacimiento.toIso8601String();
    final data = {
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