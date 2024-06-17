import 'package:biori/main_screen/home/user_stories/releases/datasource/api_releases_datasource.dart';
import 'package:biori/main_screen/home/widget/events/model/event_group_model.dart';
import 'package:biori/main_screen/home/widget/notices/model/mapper.dart';
import 'package:biori/main_screen/home/widget/notices/model/notices_model.dart';
import 'package:biori/main_screen/home/widget/releases_widgets/release_model_interface.dart';

import '../../../widget/events/model/event_model.dart';
import '../../../widget/events/model/groupEventMapper.dart';
import '../../../widget/events/model/mapper.dart';
import '../../../widget/reports/model/mapper.dart';
import '../../../widget/reports/model/report_model.dart';

class ReleasesRepository {
  final ApiReleasesDatasource apiReleasesDatasource = ApiReleasesDatasource();

  Future<List<ReleaseModelInterface>> getReleasesOrderedByUpdate() async {
    final releasesJson = await apiReleasesDatasource.getReleases();
    final releasesSorted = getReleasesFromJson(releasesJson);
    releasesSorted.sort((a, b) => b.lastUpdate.compareTo(a.lastUpdate));
    return releasesSorted;
  }

  List<ReleaseModelInterface> getReleasesFromJson(Map<String, dynamic> json) {
    List<EventModel> events = EventMapper().fromJson(json['events']);
    List<EventGroupModel> eventsGroup =
        EventGroupMapper().fromJson(json['eventsGroup']);
    List<NoticesModel> notices = NoticesMapper().fromJson(json['notices']);
    List<ReportModel> reports = ReportMapper().fromJson(json['reports']);

    return addAll(events, notices, reports, eventsGroup);
  }

  List<ReleaseModelInterface> addAll(List<EventModel> events,
      List<NoticesModel> notices,
      List<ReportModel> reports,
      List<EventGroupModel> eventsGroup) {
    List<ReleaseModelInterface> releases = [];
    releases.addAll(events);
    releases.addAll(notices);
    releases.addAll(reports);
    releases.addAll(eventsGroup);
    return releases;
  }
}
