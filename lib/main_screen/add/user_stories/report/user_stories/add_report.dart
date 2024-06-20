import 'package:biori/conection_to_backend/requests.dart';
import 'package:biori/main_screen/add/user_stories/report/dto/add_report_dto.dart';
import 'package:biori/style/constants.dart';

import '../../../../../style/model/chip_button_model.dart';

enum AddReportOutput {
  created,
  error,
  forbidden,
}

class AddReport {
  final addEventUri = '${Constants().URI}/releases/report/addReport';

  Future<AddReportOutput> run(
    String titulo,
    String descripcion,
      List<ChipButtonModel> courses, bool toTeachers) async {
    Map<String, dynamic> data = AddReportDto(
      titulo: titulo,
      descripcion: descripcion,
      scholarYear: 2024,
      courses: courses.map((e) => e.id).toList(),
      toTeachers: toTeachers,
    ).toJson();

    var response = await ApiService().postRequestWithHeader(addEventUri, data);

    if (response.statusCode == 201) {
      return AddReportOutput.created;
    } else if (response.statusCode == 403) {
      return AddReportOutput.forbidden;
    } else {
      return AddReportOutput.error;
    }
  }
}
