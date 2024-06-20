import 'package:biori/style/model/chip_button_model.dart';

abstract class AddAdvertisementDatasource {
  Future<List<ChipButtonModel>> getGroups();
}
