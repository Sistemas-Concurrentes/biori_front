import 'report_model.dart';

class ReportMapper {
  List<ReportModel> fromJson(List<dynamic> listAdvertisementsJson) {
    return listAdvertisementsJson
        .map((reportJson) => ReportModel.fromJson(reportJson))
        .toList();
  }
}
