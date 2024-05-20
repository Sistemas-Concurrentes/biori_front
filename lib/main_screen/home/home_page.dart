import 'package:biori/main_screen/home/user_stories/do_like.dart';
import 'package:biori/main_screen/home/user_stories/do_subscribe_event.dart';
import 'package:biori/main_screen/home/widget/releases_widgets/release_model_interface.dart';
import 'package:biori/main_screen/home/user_stories/releases/repository/releases_repository.dart';
import 'package:biori/main_screen/home/widget/home_widgets.dart';
import 'package:biori/router/custom_router.dart';
import 'package:biori/style/widgets_javi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'listeners/card_listener_interface.dart';
import 'widget/events/model/event_model.dart';

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
    _updateCategoriesSubscribed();

    return Scaffold(
      appBar: WidgetsJavi().myAppBar("Home"),
      body: SafeArea(
        child: FutureBuilder<List<ReleaseModelInterface>>(
          future: Provider.of<ReleasesRepository>(context)
              .getReleasesOrderedByUpdate(allReleases),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              allReleases = snapshot.data!;
              _updateCategoriesSubscribed();
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

  _updateCategoriesSubscribed() {
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
  likeEvent(int idEvent, ReleaseType releaseType, bool userSetLike) {
    DoLikeEvent().run(idEvent, userSetLike: userSetLike);
    _updateLikes(idEvent, releaseType);
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

  @override
  subscribeEvent(int idEvent) async {
    SubscribeOutput response = await DoSubscribeEvent().run(idEvent);
    if (response == SubscribeOutput.success) {
      _updateEventSubscribed(idEvent);
      if (mounted) {
        WidgetsJavi().showDialogWithText(
            context, AppLocalizations.of(context)?.inscrito ?? '', () {
          CustomRouter.router.pop();
        }, icon: const Icon(Icons.check));
      }
    } else {
      if (mounted) {
        WidgetsJavi().showDialogWithText(context,
            AppLocalizations.of(context)?.errorInscripcion ?? '', () {},
            icon: const Icon(Icons.error), error: true);
      }
    }
  }

  restartEvents() {
    setState(() {});
  }

  _updateEventSubscribed(int idEvent) {
    allReleases = allReleases.map((release) {
      if (release is EventModel && release.id == idEvent) {
        release.isSubscribed = true;
      }
      return release;
    }).toList();
  }

  _updateLikes(int idEvent, ReleaseType releaseType) {
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
}
