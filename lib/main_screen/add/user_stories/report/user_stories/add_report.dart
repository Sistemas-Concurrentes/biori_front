import 'package:biori/conection_to_backend/requests.dart';
import 'package:biori/main_screen/add/user_stories/report/dto/add_report_dto.dart';
import 'package:biori/style/constants.dart';

class AddReport {
  static String uri = Constants.URI;
  static String addEventUri = '$uri/releases/addReport';

  Future<dynamic> run(
    String titulo,
    String descripcion,
  ) async {
    Map<String, dynamic> data = AddReportDto(
      titulo: titulo,
      descripcion: descripcion,
    ).toJson();

    return await ApiService().postRequestWithHeader(addEventUri, data);
  }
}
