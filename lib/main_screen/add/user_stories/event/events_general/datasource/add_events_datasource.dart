import 'package:biori/style/model/chip_button_model.dart';

abstract class AddEventsDatasource {
  Future<List<ChipButtonModel>> getTeacherTags();
}
