import 'dart:async';

import 'package:biori/main_screen/home/user_stories/do_subscribe_event.dart';
import 'package:biori/main_screen/home/widget/releases_widgets/release_model_interface.dart';
import 'package:biori/main_screen/home/widget/home_widgets.dart';
import 'package:biori/router/custom_router.dart';
import 'package:biori/style/widgets_javi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'home_page_mv.dart';
import 'listeners/card_listener_interface.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  late List<int> categoriesFollowedByUser;
  late List<int> groupsSubscribedByUser;
  final viewModel = HomePageViewModel();
  final List<StreamSubscription> subscriptions = [];
  final homeWidgets = HomeWidgets();

  late final cardListener;

  List<ReleaseModelInterface> allReleases = [];

  @override
  void initState() {
    super.initState();
    cardListener = _CardListenerInterface(viewModel);
    groupsSubscribedByUser = [1];

    subscriptions.add(viewModel.releases.stream.listen((releases) {
      setState(() {
        allReleases = releases;
      });
    }));
    subscriptions.add(viewModel.responseDialog.stream.listen((response) {
      if (response == SubscribeOutput.success) {
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
    }));

    viewModel.loadReleases();
  }

  @override
  void dispose() {
    super.dispose();
    for (var element in subscriptions) {
      element.cancel();
    }
  }

  Widget _getContent() {
    if (allReleases.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Stack(
        children: [
          RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: () async {
                viewModel.loadReleases();
              },
              child:
                  homeWidgets.getCenterListBuilder(allReleases, cardListener)),
          homeWidgets.getFloatingActionButton(),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: WidgetsJavi().myAppBar("Home"),
      body: SafeArea(
        child: _getContent(),
      ),
    );
  }

  restartEvents() {
    setState(() {});
  }
}

class _CardListenerInterface implements CardListenerInterface {
  final HomePageViewModel viewModel;

  _CardListenerInterface(this.viewModel);

  @override
  likeEvent(int idEvent, bool userSetLike) {
    viewModel.likeEvent(idEvent, userSetLike);
  }

  @override
  subscribeCategory(int idEvent, ReleaseType releaseType) {
    viewModel.subscribeCategory(idEvent);
  }

  @override
  subscribeEvent(int idEvent) async {
    viewModel.subscribeEvent(idEvent);
  }
}
