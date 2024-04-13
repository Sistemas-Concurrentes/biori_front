import 'package:biori/Datasource/events/events_datasource.dart';

import '../model/event_model.dart';

class EventRepository {
  List<EventModel> getEvents() {
    EventsDatasource eventsDatasource = EventsDatasource();
    return eventsDatasource.getEventsOrderedByLastUpdate();
  }

  List<int> getTagsIdFollowedByUser() {
    // EventsDatasource eventsDatasource = EventsDatasource();
    return [1];
  }
}
