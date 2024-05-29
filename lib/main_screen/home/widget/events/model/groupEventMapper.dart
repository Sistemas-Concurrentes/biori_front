import 'package:biori/main_screen/home/widget/events/model/event_group_model.dart';

class EventGroupMapper {
  List<EventGroupModel> fromJson(List<dynamic> listEventsJson) {
    return listEventsJson
        .where((eventJson) {
          try {
            EventGroupModel.fromJson(eventJson);
            return true;
          } catch (e) {
            return false;
          }
        })
        .map((eventJson) => EventGroupModel.fromJson(eventJson))
        .toList();
  }
}
