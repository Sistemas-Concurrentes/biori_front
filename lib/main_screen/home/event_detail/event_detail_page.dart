import 'package:biori/main_screen/home/listeners/card_listener_interface.dart';
import 'package:biori/main_screen/home/user_stories/releases/releases_widgets/button_widgets/categories_buttons.dart';
import 'package:biori/main_screen/home/user_stories/releases/releases_widgets/button_widgets/my_like_button.dart';
import 'package:flutter/material.dart';

import '../../../style/javi_edit_text.dart';
import '../../../theme/pallete.dart';
import '../user_stories/events/model/event_model.dart';
import '../user_stories/releases/releases_widgets/constants/constants.dart';

class EventDetailPage extends StatefulWidget {
  final EventModel eventModel;
  final CardListenerInterface cardListenerInterface;

  const EventDetailPage(
      {super.key, required this.eventModel, required this.cardListenerInterface});

  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> implements CardListenerInterface{
   late EventModel detailEventModel;
  
   @override
  void initState() {
    detailEventModel = widget.eventModel;
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(detailEventModel.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _eventCardRow(context),
              CategoriesButtons(categories: detailEventModel.categories,
                  subscribeEvent: subscribeCategory,
                  releaseType: ReleaseType.event),
              _eventCardDescription(context),
              MyLikeButton(
                  id: detailEventModel.id,
                  releaseType: ReleaseType.event,
                  numberLikes: detailEventModel.numberLikes,
                  isLiked: detailEventModel.isLiked,
                  likeEvent: likeEvent),
              _moreInfo(context),
              ElevatedButton(onPressed: () {} , child: Text('Inscribirse')),

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
            decoration: BoxDecoration(
              color: Pallete.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(EventConstants.borderRadius),
            ),
            margin: const EdgeInsets.all(EventConstants.margin),
            child: Text(
              detailEventModel.title,
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
              detailEventModel.description,
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
                  TextSpan(text: dateToString(detailEventModel.date)),
                  const TextSpan(
                      text: '\nLugar: ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: detailEventModel.location),
                  detailEventModel.endInscription == null
                      ? const TextSpan(text: '')
                      : const TextSpan(
                      text: '\nFecha fin de inscripción: ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  detailEventModel.endInscription == null
                      ? const TextSpan(text: '')
                      : TextSpan(
                      text: dateToString(detailEventModel.endInscription!)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  likeEvent(int idEvent, ReleaseType  releaseType) {
    setState(() {
      widget.cardListenerInterface.likeEvent(idEvent, releaseType);
    });
  }

   @override
   subscribeCategory(int idEvent, ReleaseType releaseType) {
     setState(() {
       detailEventModel.categories = detailEventModel.categories.map((category) {
         if (category.id == idEvent) {
           category.isFollowed = !category.isFollowed;
         }
         return category;
       }).toList();

        widget.cardListenerInterface.subscribeCategory(idEvent, releaseType);
     });
   }
}

String dateToString(DateTime date, {bool withHour = true}) {
  if (withHour) {
    return "${date.day}/${date.month}/${date.year}. ${date.hour}h";
  }
  return "${date.day}/${date.month}/${date.year}";
}

