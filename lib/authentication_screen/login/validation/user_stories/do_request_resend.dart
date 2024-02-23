import 'package:biori/conection_to_backend/authentication_screen/requests.dart';
import 'package:biori/conection_to_backend/authentication_screen/output.dart';

class DoRequestResend {
  Future<Output> run(token) async {

    return await Requests.doRequestResendReturnsOutput(token);
  }
}
