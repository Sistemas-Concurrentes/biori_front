import 'package:biori/router/custom_router.dart';
import 'package:biori/style/releases_widgets/button_widgets/categories_buttons.dart';
import 'package:biori/style/releases_widgets/button_widgets/my_like_button.dart';
import 'package:biori/style/releases_widgets/releases_widgets.dart';
import 'package:flutter/material.dart';
import '../model/event_model.dart';

class EventCard extends StatelessWidget {
  final scrollController = ScrollController();
  final EventModel eventModel;
  final Function(int) likeEvent;

  EventCard(
      {super.key, required this.likeEvent, required this.eventModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ReleasesWidgets.releaseTitleRow(context, eventModel.title),
            //const CategoriesButtons(),
            ReleasesWidgets.releaseDescriptionRow(
                context, eventModel.description),
            _ultimaLinea(context)
          ],
        ),
      ),
      onTap: () {
        CustomRouter.router.push("/eventDetail/${eventModel.id}",
            extra: {'eventModel': eventModel, 'likeEvent': likeEvent}).then((value) => null);
      },
    );
  }

  Row _ultimaLinea(context) {
    return Row(
      children: [
        MyLikeButton(
            idEvent: eventModel.id,
            numberLikes:eventModel.numberLikes,
            isLiked: eventModel.isLiked,
            likeEvent: likeEvent),
        ReleasesWidgets.moreInfoButton(context, eventModel.location,
            eventModel.date, eventModel.endInscription),
      ],
    );
  }
}
