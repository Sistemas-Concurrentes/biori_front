import 'package:biori/main_screen/home/listeners/card_listener_interface.dart';
import 'package:biori/router/custom_router.dart';
import 'package:biori/style/releases_widgets/button_widgets/categories_buttons.dart';
import 'package:biori/style/releases_widgets/button_widgets/my_like_button.dart';
import 'package:biori/style/releases_widgets/releases_widgets.dart';
import 'package:flutter/material.dart';
import '../model/event_model.dart';

class EventCard extends StatelessWidget {
  final scrollController = ScrollController();
  final EventModel eventModel;
  final CardListenerInterface cardListenerInterface;

  EventCard(
      {super.key,
      required this.cardListenerInterface,
      required this.eventModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ReleasesWidgets.releaseTitleRow(context, eventModel.title),
            CategoriesButtons(
                categories: eventModel.categories,
                subscribeEvent: cardListenerInterface.subscribeCategory,
                releaseType: ReleaseType.event,
              ),
            ReleasesWidgets.releaseDescriptionRow(
                context, eventModel.description),
            _ultimaLinea(context)
          ],
        ),
      ),
      onTap: () {
        CustomRouter.router.push("/eventDetail/${eventModel.id}", extra: {
          'eventModel': eventModel,
          'cardListenerInterface': cardListenerInterface
        }).then((value) => null);
      },
    );
  }

  Row _ultimaLinea(context) {
    return Row(
      children: [
        MyLikeButton(
            id: eventModel.id,
            releaseType: ReleaseType.event,
            numberLikes: eventModel.numberLikes,
            isLiked: eventModel.isLiked,
            likeEvent: cardListenerInterface.likeEvent),
        ReleasesWidgets.moreInfoButton(context, eventModel.location,
            eventModel.date, eventModel.endInscription),
      ],
    );
  }
}
