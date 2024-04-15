import '../model/report_model.dart';

abstract class ReportsDatasource {
  Future<List<ReportModel>> getReports();
}

