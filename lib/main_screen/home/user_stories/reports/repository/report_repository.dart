import 'package:biori/Datasource/report/report_datasource.dart';

import '../model/report_model.dart';

class ReportRepository {
  List<ReportModel> getReports() {
    return ReportDatasource().getReports();
  }

}
