import 'package:biori/main_screen/add/user_stories/report/datasource/api_add_report_datasource.dart';
import 'package:biori/style/model/chip_button_model.dart';

import '../datasource/local_add_report_datasource.dart';

class AddReportRepository {
  final ApiAddReportDatasource apiAddReportsDatasource =
      ApiAddReportDatasource();
  final LocalAddReportDatasource localAddReportDatasource =
      LocalAddReportDatasource();

  Future<List<ChipButtonModel>> getAllCourses() async {
    if (true) {
      return await localAddReportDatasource.getCourses();
    } else {
      final courses = await apiAddReportsDatasource.getCourses();
    }
  }
}
