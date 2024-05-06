import 'package:biori/main_screen/home/user_stories/advertisement/model/advertisement_model.dart';
import 'package:biori/main_screen/home/user_stories/advertisement/model/mapper.dart';
import 'package:biori/main_screen/home/user_stories/events/model/event_model.dart';
import 'package:biori/main_screen/home/user_stories/events/model/mapper.dart';
import 'package:biori/main_screen/home/user_stories/releases/datasource/api_releases_datasource.dart';
import 'package:biori/main_screen/home/user_stories/releases/release_model_interface.dart';
import 'package:biori/main_screen/home/user_stories/reports/model/mapper.dart';
import 'package:biori/main_screen/home/user_stories/reports/model/report_model.dart';

class ReleasesRepository {
  final ApiReleasesDatasource apiReleasesDatasource = ApiReleasesDatasource();

  Future<List<ReleaseModelInterface>> getReleasesOrderedByUpdate(
      List<ReleaseModelInterface> allReleases) async {
    if (allReleases.isNotEmpty) {
      return getReleasesOrderedByLastUpdate(allReleases);
    }

    final releasesJson = await apiReleasesDatasource.getReleases();
    return getReleasesOrderedByLastUpdate(getReleasesFromJson(releasesJson));
  }

  List<ReleaseModelInterface> getReleasesFromJson(Map<String, dynamic> json) {
    List<EventModel> events = EventMapper().fromJson(json['events']);
    List<AdvertisementModel> advertisements =
        AdvertisementMapper().fromJson(json['advertisements']);
    List<ReportModel> reports = ReportMapper().fromJson(json['reports']);

    return addAll(events, advertisements, reports);
  }

  List<ReleaseModelInterface> addAll(List<EventModel> events,
      List<AdvertisementModel> advertisements, List<ReportModel> reports) {
    List<ReleaseModelInterface> releases = [];
    releases.addAll(events);
    releases.addAll(advertisements);
    releases.addAll(reports);
    return releases;
  }

  List<ReleaseModelInterface> getReleasesOrderedByLastUpdate(
      List<ReleaseModelInterface> allReleases) {
    allReleases.sort((a, b) => b.lastUpdate.compareTo(a.lastUpdate));
    return allReleases;
  }
}
