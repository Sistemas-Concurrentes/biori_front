import 'package:biori/main_screen/home/user_stories/reports/model/report_model.dart';
import 'report_datasource.dart';

class ApiReportsDatasource implements ReportsDatasource {
  @override
  Future<List<ReportModel>> getReports() async {
    return Future.delayed(const Duration(seconds: 1), () {
      return [];
    });
  }
}
