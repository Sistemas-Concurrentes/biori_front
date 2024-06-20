import 'package:biori/conection_to_backend/requests.dart';
import 'package:biori/main_screen/add/user_stories/advertisement/dto/add_advertisement_dto.dart';
import 'package:biori/style/constants.dart';

enum AddAdvertisementOutput {
  created,
  error,
  forbidden,
}

class AddAdvertisement {
  final addAdvertisementUri = '${Constants().URI}/releases/notice/addNotice';

  Future<AddAdvertisementOutput> run(AddAdvertisementDto model) async {
    Map<String, dynamic> data = model.toJson();

    var response =
        await ApiService().postRequestWithHeader(addAdvertisementUri, data);

    if (response.statusCode == 201) {
      return AddAdvertisementOutput.created;
    } else if (response.statusCode == 403) {
      return AddAdvertisementOutput.forbidden;
    } else {
      return AddAdvertisementOutput.error;
    }
  }
}
