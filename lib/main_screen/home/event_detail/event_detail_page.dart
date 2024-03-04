import 'package:biori/main_screen/home/listeners/card_listener_interface.dart';
import 'package:biori/style/releases_widgets/button_widgets/my_like_button.dart';
import 'package:biori/style/releases_widgets/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../../style/javi_edit_text.dart';
import '../../../theme/pallete.dart';
import '../user_stories/events/model/event_model.dart';

class EventDetailPage extends StatelessWidget {
  final EventModel eventModel;
  final Function(int, ReleaseType) likeEvent;

  const EventDetailPage(
      {super.key, required this.eventModel, required this.likeEvent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(eventModel.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _eventCardRow(context),
              //CategoriesButtons(),
              _eventCardDescription(context),
              MyLikeButton(
                  id: eventModel.id,
                  releaseType: ReleaseType.event,
                  numberLikes: eventModel.numberLikes,
                  isLiked: eventModel.isLiked,
                  likeEvent: likeEvent),
              _moreInfo(context),
            ],
          ),
        ),
      ),
    );
  }

  Row _eventCardRow(context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            height: EventConstants.heightButtons,
            decoration: BoxDecoration(
              color: Pallete.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(EventConstants.borderRadius),
            ),
            margin: const EdgeInsets.all(EventConstants.margin),
            child: Text(
              eventModel.title,
              textAlign: TextAlign.center,
              style: JaviStyle.tituloEvento,
            ),
          ),
        )
      ],
    );
  }

  Row _eventCardDescription(context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
              color: Pallete.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(EventConstants.margin),
            ),
            margin: const EdgeInsets.all(EventConstants.margin),
            padding: const EdgeInsets.all(EventConstants.padding),
            child: Text(
              eventModel.description,
              textAlign: TextAlign.justify,
              style: JaviStyle.descripcion,
            ),
          ),
        )
      ],
    );
  }

  Row _moreInfo(context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(EventConstants.margin),
            child: RichText(
              text: TextSpan(
                text: '',
                style: DefaultTextStyle
                    .of(context)
                    .style,
                children: <TextSpan>[
                  const TextSpan(
                      text: 'Fecha del evento: ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: dateToString(eventModel.date)),
                  const TextSpan(
                      text: '\nLugar: ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: eventModel.location),
                  eventModel.endInscription == null
                      ? const TextSpan(text: '')
                      : const TextSpan(
                      text: '\nFecha fin de inscripción: ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  eventModel.endInscription == null
                      ? const TextSpan(text: '')
                      : TextSpan(
                      text: dateToString(eventModel.endInscription!)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
String dateToString(DateTime date, {bool withHour = true}) {
  if (withHour) {
    return "${date.day}/${date.month}/${date.year}. ${date.hour}h";
  }
  return "${date.day}/${date.month}/${date.year}";
}

