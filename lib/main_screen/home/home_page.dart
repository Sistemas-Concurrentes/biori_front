import 'package:biori/main_screen/home/listeners/card_listener_interface.dart';
import 'package:biori/main_screen/home/user_stories/events/widget/event_card.dart';
import 'package:biori/main_screen/home/user_stories/events/model/event_model.dart';
import 'package:biori/main_screen/home/user_stories/events/repository/event_repository.dart';
import 'package:flutter/material.dart';

import '../../style/releases_widgets/constants/constants.dart';
import '../../theme/pallete.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements CardListenerInterface{
  late List<EventModel> eventsModels;
  late List<AdvertisementModel> advertisementModels;
  late List<int> categoriesFollowedByUser;
  late List<int> groupsSubscribedByUser;

  @override
  void initState() {
    eventsModels = EventRepository().getEvents();
    advertisementModels = AdvertisementRepository().getAdvertisement();
    categoriesFollowedByUser = EventRepository().getCategoriesFollowedByUser();
    groupsSubscribedByUser =
        AdvertisementRepository().getGroupsSusbcribedByUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> allEvents = eventsModels.map((eventModel) {
      for (var category in eventModel.categories) {
        if (categoriesFollowedByUser.contains(category.id)) {
          category.isFollowed = true;
        } else{
          category.isFollowed = false;
        }
      }
      return EventCard(eventModel: eventModel, cardListenerInterface: this);
    }).toList();

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
                    margin: const EdgeInsets.fromLTRB(
                        EventConstants.margin, 0, EventConstants.margin, 0),
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

  @override
  likeEvent(int idEvent, ReleaseType  releaseType) {
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
      }
      else {

      }
    });
  }

  @override
  subscribeCategory(int idEvent, ReleaseType releaseType) {
    setState(() {
      if (releaseType == ReleaseType.event) {
        categoriesFollowedByUser.contains(idEvent)
            ? categoriesFollowedByUser.remove(idEvent)
            : categoriesFollowedByUser.add(idEvent);
      }
      else {

      }
    });
  }

  restartEvents() {
    setState(() {
      eventsModels = EventRepository().getEvents();
    });
  }
}
