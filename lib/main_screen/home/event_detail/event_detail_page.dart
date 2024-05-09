import 'package:biori/main_screen/home/listeners/card_listener_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../style/javi_edit_text.dart';
import '../widget/events/model/event_model.dart';
import '../widget/releases_widgets/button_widgets/categories_buttons.dart';
import '../widget/releases_widgets/button_widgets/my_like_button.dart';
import '../widget/releases_widgets/constants/constants.dart';

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
          child: Container(
            padding: const EdgeInsets.all(JaviPaddings.L),
            child: Column(
              children: [
                _eventCardRow(context),
                Container(
                  margin: const EdgeInsets.only(bottom: JaviPaddings.L),
                  child: CategoriesButtons(categories: detailEventModel.tags,
                      subscribeEvent: subscribeCategory,
                      releaseType: ReleaseType.event,
                      isEventDetailPage: true
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(bottom: JaviPaddings.L),
                    child: _eventCardDescription(context)),
                Container(
                  margin: const EdgeInsets.only(bottom: JaviPaddings.L),
                  child: MyLikeButton(
                      id: detailEventModel.id,
                      releaseType: ReleaseType.event,
                      numberLikes: detailEventModel.numberLikes,
                      isLiked: detailEventModel.isLiked,
                      likeEvent: likeEvent),
                ),
                Container(
                    margin: const EdgeInsets.only(bottom: JaviPaddings.L),
                    child: _moreInfo(context)),
                detailEventModel.endInscription != null
                    ? ElevatedButton(
                        onPressed: detailEventModel.isSubscribed
                            ? null
                            : () {
                                subscribeEvent(detailEventModel.id);
                              },
                        style: ElevatedButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.onPrimary, // color de fondo
                      backgroundColor: Theme.of(context).colorScheme.primary, // color de texto
                        ),
                        child: Text(
                            AppLocalizations.of(context)?.inscribirse ?? ''),
                      )
                    : const SizedBox(),
              ],
            ),
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
            margin: const EdgeInsets.only(bottom: JaviPaddings.L),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ReleasesConstants.borderRadius),
            ),
            child: Text(
              detailEventModel.title,
              textAlign: TextAlign.left,
              style: JaviStyle.titulo,
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
              borderRadius: BorderRadius.circular(ReleasesConstants.margin),
            ),
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
                TextSpan(text: allDatesToString(detailEventModel.dates)),
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
      ],
    );
  }

  String allDatesToString (List<DateTime> dates){
    String result = '';
    for (DateTime date in dates){
      bool withHour = (date.hour != 0 || date.minute != 0 || date.second != 0);

      result += '${dateToString(date, withHour: withHour)}\n';
    }
    return result;
  }

  @override
  likeEvent(int idEvent, ReleaseType releaseType, bool userSetLike) {
    setState(() {
      widget.cardListenerInterface.likeEvent(idEvent, releaseType, userSetLike);
    });
  }

   @override
   subscribeCategory(int idEvent, ReleaseType releaseType) {
     setState(() {
       detailEventModel.tags = detailEventModel.tags.map((category) {
         if (category.id == idEvent) {
           category.isFollowed = !category.isFollowed;
         }
         return category;
       }).toList();

        widget.cardListenerInterface.subscribeCategory(idEvent, releaseType);
     });
   }

  @override
  subscribeEvent(int idEvent) {
    widget.cardListenerInterface.subscribeEvent(idEvent);
  }
}

String dateToString(DateTime date, {bool withHour = true}) {
  if (withHour) {
    return "${date.day}/${date.month}/${date.year}. ${date.hour}h";
  }
  return "${date.day}/${date.month}/${date.year}";
}

