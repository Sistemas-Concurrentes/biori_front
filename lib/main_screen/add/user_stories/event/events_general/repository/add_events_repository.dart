import 'package:biori/main_screen/add/user_stories/event/events_general/datasource/api_add_events_datasource.dart';
import 'package:biori/style/model/chip_button_model.dart';

import '../datasource/local_add_events_datasource.dart';

class AddEventRepository {
  final ApiAddEventsDatasource apiAddReportsDatasource =
      ApiAddEventsDatasource();
  final LocalAddEventDatasource localAddReportDatasource =
      LocalAddEventDatasource();

  Future<List<ChipButtonModel>> getTeacherTags() async {
    if (true) {
      return await localAddReportDatasource.getEvents();
    } else {
      final courses = await apiAddReportsDatasource.getEvents();
    }
  }
}
