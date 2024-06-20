import 'package:biori/style/model/chip_button_model.dart';

abstract class AddEventGroupDatasource {
  Future<List<ChipButtonModel>> getGroups();
}
