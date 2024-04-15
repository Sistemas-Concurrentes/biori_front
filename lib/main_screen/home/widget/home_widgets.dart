import 'package:biori/main_screen/home/listeners/card_listener_interface.dart';
import 'package:biori/main_screen/home/user_stories/advertisement/model/advertisement_model.dart';
import 'package:biori/main_screen/home/user_stories/advertisement/widget/advertisement_card.dart';
import 'package:biori/main_screen/home/user_stories/events/model/event_model.dart';
import 'package:biori/main_screen/home/user_stories/events/widget/event_card.dart';
import 'package:biori/main_screen/home/user_stories/releases/release_model_interface.dart';
import 'package:biori/main_screen/home/user_stories/releases/releases_widgets/constants/constants.dart';
import 'package:biori/main_screen/home/user_stories/reports/model/report_model.dart';
import 'package:biori/main_screen/home/user_stories/reports/widget/report_card.dart';
import 'package:biori/theme/pallete.dart';
import 'package:flutter/material.dart';

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
        onPressed: () {},
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
