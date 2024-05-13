import 'package:biori/conection_to_backend/requests.dart';
import 'package:biori/style/constants.dart';
import 'package:biori/style/model/chip_button_model.dart';

import '../dto/add_event_dto.dart';

enum AddEventOutput {
  created,
  error,
  forbidden,
}

class AddEvent {
  final addEventUri = '${Constants().URI}/releases/addEvent';

  Future<AddEventOutput> run(
      String titulo,
      String descripcion,
      String categoria,
      String localizacion,
      List<String> fechas,
      List<ChipButtonModel> tags,
      String? fechaFinInscripcion) async {
    Map<String, dynamic> data = AddEventDto(
      titulo: titulo,
      descripcion: descripcion,
      categoria: categoria,
      localizacion: localizacion,
      fechas: fechas,
      tagsButtons: tags,
      fechaFinInscripcion: fechaFinInscripcion,
    ).toJson();

    var response = await ApiService().postRequestWithHeader(addEventUri, data);

    if (response.statusCode == 201) {
      return AddEventOutput.created;
    } else if (response.statusCode == 403) {
      return AddEventOutput.forbidden;
    } else {
      return AddEventOutput.error;
    }
  }
}
