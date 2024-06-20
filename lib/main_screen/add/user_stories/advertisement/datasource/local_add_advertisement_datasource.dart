import 'package:biori/style/model/chip_button_model.dart';

import 'add_advertisement_datasource.dart';

class LocalAddAdvertisementDatasource implements AddAdvertisementDatasource {
  @override
  Future<List<ChipButtonModel>> getGroups() async {
    List<ChipButtonModel> courses = [];
    courses.add(ChipButtonModel(id: 1, name: 'A1 Organografía'));
    courses.add(ChipButtonModel(id: 2, name: 'A2 Organografía'));
    courses.add(ChipButtonModel(id: 3, name: 'A3 Organografíaº'));
    courses.add(ChipButtonModel(id: 4, name: 'A4 Organografía'));
    await Future.delayed(const Duration(milliseconds: 1), () {});
    return courses;
  }
}
