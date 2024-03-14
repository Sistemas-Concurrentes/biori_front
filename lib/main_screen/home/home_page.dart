import 'package:biori/main_screen/home/listeners/card_listener_interface.dart';
import 'package:biori/main_screen/home/user_stories/releases/release_model_interface.dart';
import 'package:biori/main_screen/home/user_stories/advertisement/model/advertisement_model.dart';
import 'package:biori/main_screen/home/user_stories/advertisement/repository/advertisement_repository.dart';
import 'package:biori/main_screen/home/user_stories/advertisement/widget/advertisement_card.dart';
import 'package:biori/main_screen/home/user_stories/events/widget/event_card.dart';
import 'package:biori/main_screen/home/user_stories/events/model/event_model.dart';
import 'package:biori/main_screen/home/user_stories/events/repository/event_repository.dart';
import 'package:biori/main_screen/home/user_stories/releases/releases_widgets/constants/constants.dart';
import 'package:biori/main_screen/home/user_stories/reports/model/report_model.dart';
import 'package:biori/main_screen/home/user_stories/reports/repository/report_repository.dart';
import 'package:biori/main_screen/home/user_stories/reports/widget/report_card.dart';
import 'package:flutter/material.dart';

import '../../theme/pallete.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements CardListenerInterface {
  late List<EventModel> eventsModels;
  late List<AdvertisementModel> advertisementModels;
  late List<ReportModel> reportModels;
  late List<int> categoriesFollowedByUser;
  late List<int> groupsSubscribedByUser;


  @override
  void initState() {
    eventsModels = EventRepository().getEvents();
    advertisementModels = AdvertisementRepository().getAdvertisement();
    reportModels = ReportRepository().getReports();
    categoriesFollowedByUser = EventRepository().getCategoriesFollowedByUser();


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _updateEventsSubscribed();
    List<Widget> allEvents = _getAllEventsOrderedByDate();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: EventConstants.maxWidth,
            ),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                    decoration: const BoxDecoration(
                      color: Pallete.backgroundColor,
                      border: Border(
                        bottom: BorderSide(
                            width: EventConstants.widthBorderSeparator,
                            color: Pallete.primaryColor),
                      ),
                    ),
                    child: allEvents[index]);
              },
              itemCount: allEvents.length,
            ),
          ),
        ),
      ),
    );
  }

  _updateEventsSubscribed() {
    eventsModels = eventsModels.map((eventModel) {
      for (var category in eventModel.categories) {
        categoriesFollowedByUser.contains(category.id)
            ? category.isFollowed = true
            : category.isFollowed = false;
      }
      return eventModel;
    }).toList();
  }

  List<Widget> _getAllEventsOrderedByDate() {
    List<ReleaseModelInterface> allReleases = [];

    allReleases.addAll(eventsModels);
    allReleases.addAll(advertisementModels);
    allReleases.addAll(reportModels);

    allReleases.sort((a, b) => b.lastUpdate.compareTo(a.lastUpdate));

    return allReleases.map((release) {
      if (release is EventModel) {
        return EventCard(
          cardListenerInterface: this,
          eventModel: release,
        );
      } else if (release is AdvertisementModel) {
        return AdvertisementCard(
          advertisementModel: release,
        );
      } else if (release is ReportModel){
        return ReportCard(
          reportModel: release ,
        );
      } else {
        return Container();
      }
    }).toList();
  }

  @override
  likeEvent(int idEvent, ReleaseType releaseType) {
    setState(() {
      if (releaseType == ReleaseType.event) {
        eventsModels = eventsModels.map((eventModel) {
          if (eventModel.id == idEvent) {
            eventModel.isLiked
                ? eventModel.numberLikes--
                : eventModel.numberLikes++;
            eventModel.isLiked = !eventModel.isLiked;
          }
          return eventModel;
        }).toList();
      } else {}
    });
  }

  @override
  subscribeCategory(int idEvent, ReleaseType releaseType) {
    setState(() {
      if (releaseType == ReleaseType.event) {
        categoriesFollowedByUser.contains(idEvent)
            ? categoriesFollowedByUser.remove(idEvent)
            : categoriesFollowedByUser.add(idEvent);
      } else {}
    });
  }

  restartEvents() {
    setState(() {
      eventsModels = EventRepository().getEvents();
    });
  }
}
