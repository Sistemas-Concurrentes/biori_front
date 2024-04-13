import 'package:biori/main_screen/home/user_stories/events/datasource/api_events_datasource.dart';
import 'package:biori/main_screen/home/user_stories/events/datasource/local_events_datasource.dart';

import '../model/event_model.dart';

class EventRepository {
  final ApiEventsDatasource apiEventsDatasource = ApiEventsDatasource() ;
  final LocalEventsDatasource localEventsDatasource = LocalEventsDatasource();


  Future<List<EventModel>> getEvents() async {
    return await apiEventsDatasource.getEventsOrderedByLastUpdate();
  }

  List<int> getTagsIdFollowedByUser() {
    // EventsDatasource eventsDatasource = EventsDatasource();
    return [1];
  }
}
