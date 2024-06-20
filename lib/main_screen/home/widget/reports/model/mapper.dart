import 'report_model.dart';

class ReportMapper {
  List<ReportModel> fromJson(List<dynamic> listReportJson) {
    return listReportJson
        .map((reportJson) => ReportModel.fromJson(reportJson))
        .toList();
  }
}
