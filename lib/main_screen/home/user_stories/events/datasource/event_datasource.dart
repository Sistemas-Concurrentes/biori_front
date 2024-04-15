import 'package:biori/main_screen/home/user_stories/events/model/event_model.dart';

abstract class EventsDatasource {
  Future<List<EventModel>> getEventsOrderedByLastUpdate();
  Future<List<int>> getCategoriesFollowedByUser();
}

