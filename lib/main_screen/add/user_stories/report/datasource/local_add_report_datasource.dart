import 'package:biori/style/model/chip_button_model.dart';

import 'add_reports_datasource.dart';

class LocalAddReportDatasource implements AddReportDatasource {
  @override
  Future<List<ChipButtonModel>> getCourses() async {
    List<ChipButtonModel> courses = [];
    courses.add(ChipButtonModel(id: 1, name: '1º'));
    courses.add(ChipButtonModel(id: 2, name: '2º'));
    courses.add(ChipButtonModel(id: 3, name: '3º'));
    courses.add(ChipButtonModel(id: 4, name: '4º'));
    courses.add(ChipButtonModel(id: 0, name: 'Profesores'));
    await Future.delayed(const Duration(milliseconds: 1), () {});
    return courses;
  }
}
