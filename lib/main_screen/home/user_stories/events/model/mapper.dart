import 'event_model.dart';

class EventMapper {
  List<EventModel> fromJson(List<dynamic> listEventsJson) {
    return listEventsJson
        .where((eventJson) {
          try {
            EventModel.fromJson(eventJson);
            return true;
          } catch (e) {
            return false;
          }
        })
        .map((eventJson) => EventModel.fromJson(eventJson))
        .toList();
  }
}
