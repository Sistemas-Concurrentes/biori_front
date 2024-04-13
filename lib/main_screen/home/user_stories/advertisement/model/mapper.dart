import 'package:biori/main_screen/home/user_stories/advertisement/model/advertisement_model.dart';

class AdvertisementMapper {
  List<AdvertisementModel> fromJson(List<dynamic> listAdvertisementsJson) {
    return listAdvertisementsJson
        .map((advertisementJson) => AdvertisementModel(
              id: advertisementJson['id'],
              title: advertisementJson['title'],
              description: advertisementJson['description'],
              groupsInfo: fromJsonGroups(advertisementJson['groups']),
              creatorName: advertisementJson['userName'],
              lastUpdate: DateTime.parse(advertisementJson['updatedAt'].toString()),
              teacherUserId: advertisementJson['userId'],
            ))
        .toList();
  }

  Map<int, String> fromJsonGroups(List<dynamic> groups) {
    final Map<int, String> groupsInfo = {};

    for (var group in groups) {
      groupsInfo[group['id']] = group['name'];
    }
    return groupsInfo;
  }
}
