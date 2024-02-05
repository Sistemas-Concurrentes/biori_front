import 'package:biori/conection_to_backend/requests.dart';
import 'package:biori/conection_to_backend/output.dart';


class DoLogin {
  Future<Output> run(username, password) async {

    Map<String, dynamic> data = {
      "user_name": username,
      "password": password,
    };

    return await Requests.loginRequestReturnsOutput(data);

  }

}
