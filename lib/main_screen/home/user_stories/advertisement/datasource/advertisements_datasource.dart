import '../model/advertisement_model.dart';

abstract class AdvertisementsDatasource {
  Future<List<AdvertisementModel>> getAdvertisementsOfUser();
}
