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

class _HomePageState extends State<HomePage> {
  late List<EventModel> eventsModels;

  @override
  void initState() {
    eventsModels = EventRepository().getEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> allEvents = eventsModels
        .map((eventModel) => EventCard(eventModel: eventModel, likeEvent: likeEvent))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: SafeArea(
        child: Center(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                  constraints: const BoxConstraints(
                    maxWidth: EventConstants.maxWidth,
                  ),
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
    );
  }

  likeEvent(int idEvent) {
    setState(() {
      eventsModels = eventsModels.map((eventModel) {
        if (eventModel.id == idEvent) {
          eventModel.isLiked
              ? eventModel.numberLikes--
              : eventModel.numberLikes++;
          eventModel.isLiked = !eventModel.isLiked;
        }
        return eventModel;
      }).toList();
    });
  }

  subscribeEvent(int idEvent) {
    setState(() {
      eventsModels = eventsModels.map((eventModel) {
        if (eventModel.id == idEvent) {
          eventModel.isSubscribed = !eventModel.isSubscribed;
        }
        return eventModel;
      }).toList();
    });
  }

  restartEvents() {
    setState(() {
      eventsModels = EventRepository().getEvents();
    });
  }
}
