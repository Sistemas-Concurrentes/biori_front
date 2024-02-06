import 'package:biori/authentication_screen/register/dto/register_dto.dart';
import 'package:biori/conection_to_backend/authentication_screen/requests.dart';
import 'package:biori/conection_to_backend/authentication_screen/output.dart';


class DoRegister {
  Future<Output> run(nombre, apellidos, username, password, fechaNacimiento,
      telefono) async {
    Map<String, dynamic>data = RegisterDto(name: nombre, surname: apellidos, username: username, password: password,
        fechaNacimiento: fechaNacimiento, phone: telefono).toJson();

    return await Requests.registerRequestReturnsOutput(data);
  }

}