import 'package:biori/conection_to_backend/requests.dart';
import 'package:biori/main_screen/add/user_stories/advertisement/dto/add_advertisement_dto.dart';
import 'package:biori/style/constants.dart';
import 'package:biori/style/model/chip_button_model.dart';

class AddAdvertisement {
  static String uri = Constants.URI;
  static String addAdvertisementUri = '$uri/releases/addAdvertisement';

  Future<dynamic> run(
      String titulo, String descripcion, List<ChipButtonModel> tags) async {
    Map<String, dynamic> data = AddAdvertisementDto(
      titulo: titulo,
      descripcion: descripcion,
      tagsButtons: tags,
    ).toJson();

    return await ApiService().postRequestWithHeader(addAdvertisementUri, data);
  }
}
