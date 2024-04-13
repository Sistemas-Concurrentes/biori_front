import 'package:biori/main_screen/home/user_stories/reports/model/report_model.dart';

class ReportMapper {
  List<ReportModel> fromJson(List<dynamic> listAdvertisementsJson) {
    return listAdvertisementsJson
        .map((advertisementJson) => ReportModel(
              id: advertisementJson['id'],
              title: advertisementJson['title'],
              description: advertisementJson['description'],
              creatorName: advertisementJson['teacherName'],
              lastUpdate: DateTime.parse(advertisementJson['updatedAt']),
              teacherUserId: advertisementJson['teacherId'],
            ))
        .toList();
  }
}
