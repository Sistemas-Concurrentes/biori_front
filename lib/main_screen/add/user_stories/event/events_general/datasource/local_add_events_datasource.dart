import 'package:biori/style/model/chip_button_model.dart';

import 'add_events_datasource.dart';

class LocalAddEventDatasource implements AddEventsDatasource {
  @override
  Future<List<ChipButtonModel>> getTeacherTags() async {
    List<ChipButtonModel> courses = [];
    courses.add(ChipButtonModel(id: 1, name: 'Zoología'));
    courses.add(ChipButtonModel(id: 2, name: 'Biología Celular'));
    courses.add(ChipButtonModel(id: 3, name: 'Bioquímica'));
    courses.add(ChipButtonModel(id: 4, name: 'Internacional'));
    courses.add(ChipButtonModel(id: 5, name: 'Complementario/ECTS'));
    await Future.delayed(const Duration(milliseconds: 1), () {});
    return courses;
  }
}
