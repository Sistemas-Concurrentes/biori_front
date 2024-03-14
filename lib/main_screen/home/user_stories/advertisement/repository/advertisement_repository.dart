import 'package:biori/Datasource/advertisement/advertisement_datasource.dart';

import '../model/advertisement_model.dart';

class AdvertisementRepository {
  List<AdvertisementModel> getAdvertisement() {
    AdvertisementDatasource advertisementDatasource = AdvertisementDatasource();
    return advertisementDatasource.getAdvertisementsOfUser();
  }
}
