import 'package:biori/main_screen/home/user_stories/reports/model/report_model.dart';

class ReportMapper {
  List<ReportModel> fromJson(List<dynamic> listAdvertisementsJson) {
    return listAdvertisementsJson
        .map((reportJson) => ReportModel.fromJson(reportJson))
        .toList();
  }
}
