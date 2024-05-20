import 'package:biori/main_screen/home/listeners/card_listener_interface.dart';
import 'package:biori/main_screen/home/widget/releases_widgets/release_model_interface.dart';
import 'package:biori/router/custom_router.dart';
import 'package:biori/router/route_constants.dart';
import 'package:biori/style/javi_edit_text.dart';
import 'package:flutter/material.dart';

import 'advertisement/model/advertisement_model.dart';
import 'advertisement/widget/advertisement_card.dart';
import 'events/model/event_model.dart';
import 'events/widget/event_card.dart';
import 'releases_widgets/constants/constants.dart';
import 'reports/model/report_model.dart';
import 'reports/widget/report_card.dart';

class HomeWidgets {
  Center getCenterListBuilder(
      allReleases, CardListenerInterface cardListenerInterfaceHomePage) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: ReleasesConstants.maxWidth,
        ),
        child: ListView.builder(
          itemBuilder: (context, index) {
            final release = _getWidgetFromRelease(
                allReleases[index], cardListenerInterfaceHomePage);

            return Card(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(ReleasesConstants.borderRadius),
              ),
              elevation: ReleasesConstants.elevation,
              margin: const EdgeInsets.fromLTRB(JaviPaddings.L, JaviPaddings.M,
                  JaviPaddings.L, JaviPaddings.M),
              child: release,
            );
          },
          itemCount: allReleases.length,
        ),
      ),
    );
  }

  Positioned getFloatingActionButton() {
    return Positioned(
      bottom: 16,
      right: 16,
      child: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          CustomRouter.router.push(addReleasesRoute).then((value) => null);
        },
      ),
    );
  }

  StatelessWidget _getWidgetFromRelease(ReleaseModelInterface release,
      CardListenerInterface cardListenerInterfaceHomePage) {
    if (release is EventModel) {
      return EventCard(
        cardListenerInterface: cardListenerInterfaceHomePage,
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
}
