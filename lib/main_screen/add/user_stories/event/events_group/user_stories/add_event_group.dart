import 'package:biori/conection_to_backend/requests.dart';
import 'package:biori/style/constants.dart';

import '../dto/add_event_group_dto.dart';

enum AddEventGroupOutput {
  created,
  error,
  forbidden,
}

class AddEventGroup {
  final addEventUri = '${Constants().URI}/releases/event/addEvent';

  Future<AddEventGroupOutput> run(
      String titulo,
      String descripcion,
      String categoria,
      String localizacion,
      List<String> fechas,
      List<int> groupsId,
      String? fechaFinInscripcion) async {
    Map<String, dynamic> data = AddEventGroupDto(
      titulo: titulo,
      descripcion: descripcion,
      categoria: categoria,
      localizacion: localizacion,
      fechas: fechas,
      groupsId: groupsId,
      fechaFinInscripcion: fechaFinInscripcion,
    ).toJson();

    var response = await ApiService().postRequestWithHeader(addEventUri, data);

    if (response.statusCode == 201) {
      return AddEventGroupOutput.created;
    } else if (response.statusCode == 403) {
      return AddEventGroupOutput.forbidden;
    } else {
      return AddEventGroupOutput.error;
    }
  }
}
