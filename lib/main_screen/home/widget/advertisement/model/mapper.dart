import 'advertisement_model.dart';

class AdvertisementMapper {
  List<AdvertisementModel> fromJson(List<dynamic> listAdvertisementsJson) {
    return listAdvertisementsJson
        .map((advertisementJson) =>
            AdvertisementModel.fromJson(advertisementJson))
        .toList();
  }
}
