import 'package:biori/conection_to_backend/requests.dart';
import 'package:biori/style/constants.dart';

enum SubscribeOutput { success, error }

class DoSubscribeEvent {
  Future<SubscribeOutput> run(int idEvent) async {
    var apiResponse = await ApiService().postRequestWithHeader(
        '${Constants.URI}/releases/event/subscribe', {'idEvent': idEvent});

    if (apiResponse.statusCode == 200) {
      return SubscribeOutput.success;
    } else {
      return SubscribeOutput.error;
    }
  }
}
