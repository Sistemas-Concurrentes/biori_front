import 'package:biori/main_screen/home/user_stories/advertisement/model/advertisement_model.dart';
import 'package:biori/main_screen/home/user_stories/advertisement/model/mapper.dart';
import 'package:biori/main_screen/home/user_stories/events/model/event_model.dart';
import 'package:biori/main_screen/home/user_stories/events/model/mapper.dart';
import 'package:biori/main_screen/home/user_stories/events/repository/event_repository.dart';
import 'package:biori/main_screen/home/user_stories/releases/datasource/api_releases_datasource.dart';
import 'package:biori/main_screen/home/user_stories/releases/release_model_interface.dart';

class ReleasesRepository {
  final ApiReleasesDatasource apiReleasesDatasource = ApiReleasesDatasource();

  Future<List<ReleaseModelInterface>> getReleases(
      List<ReleaseModelInterface> allReleases) async {
    if (allReleases.isNotEmpty) {
      return allReleases;
    }

    final releasesJson = await apiReleasesDatasource.getReleases();
    return getReleasesFromJson(releasesJson);
  }

  List<ReleaseModelInterface> getReleasesFromJson(Map<String, dynamic> json) {
    List<EventModel> events = EventMapper().fromJson(json['events']);
    List<AdvertisementModel> advertisements =
        AdvertisementMapper().fromJson(json['advertisements']);

    return addAll(events, advertisements);
  }

  List<int> getCategoriesFollowedByUser() {
    EventRepository eventRepository = EventRepository();
    return eventRepository.getTagsIdFollowedByUser();
  }

  List<ReleaseModelInterface> addAll(
      List<EventModel> events, List<AdvertisementModel> advertisements) {
    List<ReleaseModelInterface> releases = [];
    releases.addAll(events);
    releases.addAll(advertisements);

    return releases;
  }
}
