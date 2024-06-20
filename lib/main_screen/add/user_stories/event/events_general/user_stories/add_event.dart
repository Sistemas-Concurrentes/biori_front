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
  final addEventUri = '${Constants().URI}/releases/event/addEvent';

  Future<AddEventOutput> run(AddEventDto model) async {
    Map<String, dynamic> data = model.toJson();

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
