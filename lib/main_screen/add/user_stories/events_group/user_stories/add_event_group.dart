import 'package:biori/conection_to_backend/requests.dart';
import 'package:biori/style/constants.dart';

import '../dto/add_event_group_dto.dart';

enum AddEventOutput {
  created,
  error,
  forbidden,
}

class AddEventGroup {
  final addEventUri = '${Constants().URI}/releases/addEvent';

  Future<AddEventOutput> run(
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
      return AddEventOutput.created;
    } else if (response.statusCode == 403) {
      return AddEventOutput.forbidden;
    } else {
      return AddEventOutput.error;
    }
  }
}
