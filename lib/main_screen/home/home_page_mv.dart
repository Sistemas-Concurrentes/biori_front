import 'package:biori/main_screen/home/user_stories/do_like.dart';
import 'package:biori/main_screen/home/user_stories/do_subscribe_event.dart';
import 'package:biori/main_screen/home/user_stories/releases/repository/releases_repository.dart';
import 'package:biori/main_screen/home/widget/events/model/event_model.dart';
import 'package:biori/main_screen/home/widget/events/interface/event_model_interface.dart';
import 'package:biori/main_screen/home/widget/releases_widgets/release_model_interface.dart';
import 'package:rxdart/rxdart.dart';

import '../../conection_to_backend/user_data.dart';
import 'listeners/card_listener_interface.dart';

class HomePageViewModel {
  final releaseRepository = ReleasesRepository();
  List<ReleaseModelInterface> releasesList = [];
  final userRepository = UserDataRepository();

  BehaviorSubject<List<ReleaseModelInterface>> releasesStream =
      BehaviorSubject.seeded([]);
  BehaviorSubject<SubscribeOutput> responseDialog = BehaviorSubject();
  BehaviorSubject<List<int>> categoriesFollowed = BehaviorSubject.seeded([]);
  BehaviorSubject<bool> showButton = BehaviorSubject.seeded(false);

  void loadReleases() async {
    final currentCategories = categoriesFollowed.valueOrNull ?? [];
    releasesList = await releaseRepository.getReleasesOrderedByUpdate();
    releasesStream.add(subscribeToEventsAndSortByTags(currentCategories));
  }

  void likeEvent(int idEvent, bool userSetLike) {
    final currentReleases = releasesStream.valueOrNull ?? [];
    final event = _getEventById(idEvent);
    if (event == null) {
      return;
    }

    DoLikeEvent().run(idEvent, userSetLike: !event.isLiked);

    final newReleases = currentReleases.map((element) {
      if (element.id == idEvent) {
        event.isLiked = !event.isLiked;
        event.numberLikes =
            event.isLiked ? event.numberLikes + 1 : event.numberLikes - 1;
        return event as ReleaseModelInterface;
      }
      return element;
    }).toList();

    releasesStream.add(newReleases);
  }

  void subscribeEvent(int idEvent) async {
    final currentReleases = releasesStream.valueOrNull ?? [];
    final event = _getEventById(idEvent);
    if (event == null) {
      return;
    }

    SubscribeOutput response = await DoSubscribeEvent().run(idEvent);

    final newReleases = currentReleases.map((element) {
      if (element.id == idEvent) {
        event.isSubscribed = true;
        return event as ReleaseModelInterface;
      }
      return element;
    }).toList();

    releasesStream.add(newReleases);
    responseDialog.add(response);
  }

  void loadCategoriesFollowed() {
    categoriesFollowed.add([1]);
  }

  void subscribeCategory(int idCategory) {
    final currentCategories = categoriesFollowed.valueOrNull ?? [];
    releasesList = releasesStream.valueOrNull ?? [];
    if (currentCategories.contains(idCategory)) {
      currentCategories.remove(idCategory);
    } else {
      currentCategories.add(idCategory);
    }
    releasesStream.add(updateCategoryOnEvents(idCategory));
  }

  List<ReleaseModelInterface> updateCategoryOnEvents(int idCategory) {
    return releasesList.map((actualRelease) {
      bool isEvent = actualRelease is EventModel;
      if (isEvent) {
        for (var category in actualRelease.tags) {
          if (category.id == idCategory) {
            category.isFollowed = !category.isFollowed;
            return actualRelease;
          }
        }
      }
      return actualRelease;
    }).toList();
  }

  List<ReleaseModelInterface> subscribeToEventsAndSortByTags(
      List<int> categoriesFollowed) {
    List<ReleaseModelInterface> releasesNotInterested = [];
    final List<ReleaseModelInterface> newReleases = releasesList
        .map((actualRelease) {
          bool isUserInterested = false;
          bool isEvent = actualRelease is EventModel;
          if (isEvent) {
            for (var category in actualRelease.tags) {
              if (categoriesFollowed.contains(category.id)) {
                isUserInterested = true;
                category.isFollowed = true;
              } else {
                category.isFollowed = false;
              }
            }
          }
          if (!isUserInterested && isEvent) {
            releasesNotInterested.add(actualRelease);
          } else {
            return actualRelease;
          }
        })
        .nonNulls
        .toList();

    return newReleases + releasesNotInterested;
  }

  void showButtonToAddComunications() async {
    bool show = false;
    UserModel user = await userRepository.getUserData();

    if (user.rol == UserRol.admin) {
      show = true;
    }
    showButton.add(show);
  }

  EventModelInterface? _getEventById(int idEvent) {
    final currentReleases = releasesStream.valueOrNull ?? [];
    final findRelease = currentReleases
        .where((element) =>
            (ReleaseType.event == element.releaseType ||
                ReleaseType.eventGroup == element.releaseType) &&
            element.id == idEvent)
        .firstOrNull;

    return findRelease as EventModelInterface?;
  }
}
