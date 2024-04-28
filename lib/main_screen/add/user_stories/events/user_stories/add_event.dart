import 'package:biori/conection_to_backend/requests.dart';
import 'package:biori/style/constants.dart';
import 'package:biori/style/model/chip_button_model.dart';

import '../dto/add_event_dto.dart';

class AddEvent {
  static String uri = Constants.URI;
  static String addEventUri = '$uri/releases/addEvent';

  Future<dynamic> run(
      String titulo,
      String descripcion,
      String categoria,
      String localizacion,
      List<String?> fechas,
      List<ChipButtonModel> tags) async {
    Map<String, dynamic> data = AddEventDto(
      titulo: titulo,
      descripcion: descripcion,
      categoria: categoria,
      localizacion: localizacion,
      fechas: fechas,
      tagsButtons: tags,
    ).toJson();

    return await ApiService().postRequestWithHeader(addEventUri, data);
  }
}
