import 'package:biori/authentication_screen/login/dto/login_dto.dart';
import 'package:biori/conection_to_backend/authentication_screen/requests.dart';
import 'package:biori/conection_to_backend/authentication_screen/output.dart';

class DoLogin {
  Future<Output> run(username, password) async {
    Map<String, dynamic> data =
        LoginDto(username: username, password: password).toJson();

    return await Requests.loginRequestReturnsOutput(data);
  }
}
