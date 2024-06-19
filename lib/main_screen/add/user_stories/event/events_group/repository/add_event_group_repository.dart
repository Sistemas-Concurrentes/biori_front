import 'package:biori/main_screen/add/user_stories/event/events_group/datasource/api_add_event_group_datasource.dart';
import 'package:biori/style/model/chip_button_model.dart';

import '../datasource/local_add_event_group_datasource.dart';

class AddEventGroupRespository {
  final ApiAddEventGroupDatasource apiAddReportsDatasource =
      ApiAddEventGroupDatasource();
  final LocalAddEventGroupDatasource localAddReportDatasource =
      LocalAddEventGroupDatasource();

  Future<List<ChipButtonModel>> getAllGroups() async {
    if (true) {
      return await localAddReportDatasource.getGroups();
    } else {
      final groups = await apiAddReportsDatasource.getGroups();
    }
  }
}
