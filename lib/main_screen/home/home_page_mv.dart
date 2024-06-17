import 'package:biori/main_screen/home/user_stories/do_like.dart';
import 'package:biori/main_screen/home/user_stories/do_subscribe_event.dart';
import 'package:biori/main_screen/home/user_stories/releases/repository/releases_repository.dart';
import 'package:biori/main_screen/home/widget/events/model/event_model.dart';
import 'package:biori/main_screen/home/widget/releases_widgets/release_model_interface.dart';
import 'package:rxdart/rxdart.dart';

import 'listeners/card_listener_interface.dart';

class HomePageViewModel {
  final releaseRepository = ReleasesRepository();
  BehaviorSubject<List<ReleaseModelInterface>> releases =
      BehaviorSubject.seeded([]);
  BehaviorSubject<SubscribeOutput> responseDialog = BehaviorSubject();
  BehaviorSubject<List<int>> categoriesFollowed = BehaviorSubject.seeded([]);

  void loadReleases() async {
    final currentReleases = releases.valueOrNull ?? [];

    if (currentReleases.isNotEmpty) {
      releases.add(currentReleases);
      return;
    }

    final newReleases = await releaseRepository.getReleasesOrderedByUpdate();
    releases.add(newReleases);
  }

  void likeEvent(int idEvent, ReleaseType releaseType, bool userSetLike) {
    final currentReleases = releases.valueOrNull ?? [];
    final findRelease = currentReleases
        .where((element) =>
            (ReleaseType.event == element.releaseType ||
                ReleaseType.eventGroup == element.releaseType) &&
            element.id == idEvent)
        .firstOrNull;

    final event = findRelease as EventModel?;
    if (event == null) {
      return;
    }

    DoLikeEvent().run(idEvent, userSetLike: !event.isLiked);

    final newReleases = currentReleases.map((element) {
      if (element == event) {
        event.isLiked = !event.isLiked;
        event.numberLikes =
            event.isLiked ? event.numberLikes + 1 : event.numberLikes - 1;
        return event;
      }
      return element;
    }).toList();

    releases.add(newReleases);
  }

  void subscribeEvent(int idEvent) async {
    final currentReleases = releases.valueOrNull ?? [];
    final findRelease = currentReleases
        .where((element) =>
            (ReleaseType.event == element.releaseType) && element.id == idEvent)
        .firstOrNull;

    final event = findRelease as EventModel?;
    if (event == null) {
      return;
    }

    SubscribeOutput response = await DoSubscribeEvent().run(idEvent);
    final newReleases = currentReleases.map((element) {
      if (element == event) {
        event.isSubscribed = true;
        return event;
      }
      return element;
    }).toList();

    releases.add(newReleases);
    responseDialog.add(response);
  }

  void loadCategoriesFollowed() {
    categoriesFollowed.add([1]);
  }

  void subscribeCategory(int idEvent) {
    final currentCategories = categoriesFollowed.valueOrNull ?? [];
    if (currentCategories.contains(idEvent)) {
      currentCategories.remove(idEvent);
    } else {
      currentCategories.add(idEvent);
    }

    final currentReleases = releases.valueOrNull ?? [];

    final newReleases = currentReleases.map((allReleases) {
      if (allReleases is EventModel) {
        for (var category in allReleases.tags) {
          currentCategories.contains(category.id)
              ? category.isFollowed = true
              : category.isFollowed = false;
        }
      }
      return allReleases;
    }).toList();

    releases.add(newReleases);
  }
}
