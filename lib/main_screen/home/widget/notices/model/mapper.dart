import 'notices_model.dart';

class NoticesMapper {
  List<NoticesModel> fromJson(List<dynamic> listAdvertisementsJson) {
    return listAdvertisementsJson
        .map((advertisementJson) => NoticesModel.fromJson(advertisementJson))
        .toList();
  }
}
