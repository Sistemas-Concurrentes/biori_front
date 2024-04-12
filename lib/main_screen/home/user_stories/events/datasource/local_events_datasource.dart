import '../../events/model/event_model.dart';
import 'event_datasource.dart';

class LocalEventsDatasource implements EventsDatasource {

  @override
  Future<List<EventModel>> getEventsOrderedByLastUpdate() {
    return Future.delayed(const Duration(seconds: 1), () {
      return [];
    });
  }

  @override
  Future<List<int>> getCategoriesFollowedByUser() {
    return Future.delayed(const Duration(seconds: 1), () {
      return [];
    });
  }
}