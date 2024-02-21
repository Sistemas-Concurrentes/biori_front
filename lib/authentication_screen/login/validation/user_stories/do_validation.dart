import 'package:biori/authentication_screen/login/validation/dto/validation_dto.dart';
import 'package:biori/conection_to_backend/authentication_screen/requests.dart';
import 'package:biori/conection_to_backend/authentication_screen/output.dart';

class DoValidation {
  Future<Output> run(register_code, token) async {

    Map<String, dynamic> data =
      ValidationDto(register_code: register_code, token: token).toJson();

    return await Requests.validationRequestReturnsOutput(data, token);
  }
}
