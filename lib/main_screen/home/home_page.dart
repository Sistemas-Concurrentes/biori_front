import 'package:biori/main_screen/home/listeners/card_listener_interface.dart';
import 'package:biori/main_screen/home/user_stories/releases/release_model_interface.dart';
import 'package:biori/main_screen/home/user_stories/advertisement/model/advertisement_model.dart';
import 'package:biori/main_screen/home/user_stories/advertisement/widget/advertisement_card.dart';
import 'package:biori/main_screen/home/user_stories/events/widget/event_card.dart';
import 'package:biori/main_screen/home/user_stories/events/model/event_model.dart';
import 'package:biori/main_screen/home/user_stories/events/repository/event_repository.dart';
import 'package:biori/main_screen/home/user_stories/releases/releases_widgets/constants/constants.dart';
import 'package:biori/main_screen/home/user_stories/releases/repository/releases_repository.dart';
import 'package:biori/main_screen/home/user_stories/reports/model/report_model.dart';
import 'package:biori/main_screen/home/user_stories/reports/widget/report_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme/pallete.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> implements CardListenerInterface {
  late List<int> categoriesFollowedByUser;
  late List<int> groupsSubscribedByUser;

  late List<ReleaseModelInterface> allReleases;

  @override
  void initState() {
    categoriesFollowedByUser = EventRepository().getTagsIdFollowedByUser();
    allReleases = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _updateEventsSubscribed();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: SafeArea(
        child: FutureBuilder<List<ReleaseModelInterface>>(
          future:
              Provider.of<ReleasesRepository>(context).getReleasesOrderedByUpdate(allReleases),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              allReleases = snapshot.data!;
              return Center(
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: ReleasesConstants.maxWidth,
                  ),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final release =
                          _getWidgetFromRelease(snapshot.data![index]);

                      return Container(
                        decoration: const BoxDecoration(
                          color: Pallete.backgroundColor,
                          border: Border(
                            bottom: BorderSide(
                                width: ReleasesConstants.widthBorderSeparator,
                                color: Pallete.primaryColor),
                          ),
                        ),
                        child: release,
                      );
                    },
                    itemCount: snapshot.data!.length,
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  _updateEventsSubscribed() {
    allReleases = allReleases.map((allReleases) {
      if (allReleases is EventModel) {
        for (var category in allReleases.tags) {
          categoriesFollowedByUser.contains(category.id)
              ? category.isFollowed = true
              : category.isFollowed = false;
        }
      }
      return allReleases;
    }).toList();
  }

  StatelessWidget _getWidgetFromRelease(ReleaseModelInterface release) {
    if (release is EventModel) {
      return EventCard(
        cardListenerInterface: this,
        eventModel: release,
      );
    } else if (release is AdvertisementModel) {
      return AdvertisementCard(
        advertisementModel: release,
      );
    } else if (release is ReportModel) {
      return ReportCard(
        reportModel: release,
      );
    } else {
      return Container();
    }
  }

  @override
  likeEvent(int idEvent, ReleaseType releaseType) {
    setState(() {
      if (releaseType == ReleaseType.event) {
        allReleases = allReleases.map((release) {
          if (release is EventModel && release.id == idEvent) {
            release.isLiked ? release.numberLikes-- : release.numberLikes++;
            release.isLiked = !release.isLiked;
          }
          return release;
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
    });
  }
}
