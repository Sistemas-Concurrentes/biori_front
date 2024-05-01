import 'package:biori/main_screen/home/listeners/card_listener_interface.dart';
import 'package:biori/main_screen/home/user_stories/releases/release_model_interface.dart';
import 'package:biori/main_screen/home/user_stories/events/model/event_model.dart';
import 'package:biori/main_screen/home/user_stories/releases/repository/releases_repository.dart';
import 'package:biori/main_screen/home/widget/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    categoriesFollowedByUser = [1];
    allReleases = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomeWidgets homeWidgets = HomeWidgets();
    _updateEventsSubscribed();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: SafeArea(
        child: FutureBuilder<List<ReleaseModelInterface>>(
          future: Provider.of<ReleasesRepository>(context)
              .getReleasesOrderedByUpdate(allReleases),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              allReleases = snapshot.data!;
              return Stack(
                children: [
                  homeWidgets.getCenterListBuilder(allReleases, this),
                  homeWidgets.getFloatingActionButton(),
                ],
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
    setState(() {});
  }
}
