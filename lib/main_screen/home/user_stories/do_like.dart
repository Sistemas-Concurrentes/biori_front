import 'package:biori/conection_to_backend/requests.dart';
import 'package:biori/style/constants.dart';

class DoLikeEvent {
  void run(int idEvent, {bool userSetLike = true}) {
    ApiService().postRequestWithHeader('${Constants().URI}/releases/event/like',
        {'idEvent': idEvent, 'userSetLike': userSetLike});
  }
}
