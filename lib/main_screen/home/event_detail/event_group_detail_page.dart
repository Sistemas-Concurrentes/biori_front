import 'package:biori/main_screen/home/listeners/card_listener_interface.dart';
import 'package:biori/main_screen/home/widget/events/model/event_group_model.dart';
import 'package:biori/style/widgets_javi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../style/javi_edit_text.dart';
import '../widget/releases_widgets/button_widgets/my_like_button.dart';
import '../widget/releases_widgets/constants/constants.dart';

class EventGroupDetailPage extends StatefulWidget {
  final EventGroupModel eventGroupModel;
  final CardListenerInterface cardListenerInterface;

  const EventGroupDetailPage(
      {super.key,
      required this.eventGroupModel,
      required this.cardListenerInterface});

  @override
  State<EventGroupDetailPage> createState() => _EventGroupDetailPageState();
}

class _EventGroupDetailPageState extends State<EventGroupDetailPage>
    implements CardListenerInterface {
  late EventGroupModel detailEventModel;

  @override
  void initState() {
    detailEventModel = widget.eventGroupModel;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          WidgetsJavi().myAppBar(AppLocalizations.of(context)?.evento ?? ''),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(JaviPaddings.L),
            child: Column(
              children: [
                _eventCardRow(context),
                WidgetsJavi().paddedWidget(_eventCardDescription(context)),
                WidgetsJavi().paddedWidget(_moreInfo(context)),
                WidgetsJavi().paddedWidget(const Divider()),
                WidgetsJavi().paddedWidget(userInteractionsRow(),
                    topPadding: JaviPaddings.S),
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
          child: Text(
            detailEventModel.title,
            textAlign: TextAlign.left,
            style: JaviStyle.titulo,
          ),
        ),
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

  Widget _moreInfo(context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          complementaryInfo(
              "Fecha del evento", allDatesToString(detailEventModel.dates)),
          WidgetsJavi().paddedWidget(
              complementaryInfo("Lugar", detailEventModel.location),
              topPadding: JaviPaddings.M),
          if (detailEventModel.endInscription != null)
            WidgetsJavi().paddedWidget(
                complementaryInfo("Fecha fin de inscripción",
                    dateToString(detailEventModel.endInscription!)),
                topPadding: JaviPaddings.M),
        ],
      ),
    );
  }

  Widget complementaryInfo(
      String informationType, String informationDescription) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$informationType: ', style: JaviStyle.informacionExtraCards),
        Container(
            margin: const EdgeInsets.only(left: JaviPaddings.M),
            child: Text(informationDescription, style: JaviStyle.descripcion)),
      ],
    );
  }

  Widget userInteractionsRow() {
    return Column(
      children: [
        const Row(children: [
          Expanded(
            child: Text("Groups", style: JaviStyle.subtitulo),
          ),
          //
        ]),
        WidgetsJavi().paddedWidget(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyLikeButton(
                  id: detailEventModel.id,
                  numberLikes: detailEventModel.numberLikes,
                  isLiked: detailEventModel.isLiked,
                  likeEvent: likeEvent),
              subscribeButtonIfNeeded(),
            ],
          ),
        ),
      ],
    );
  }

  Widget subscribeButtonIfNeeded() {
    if (detailEventModel.endInscription == null) {
      return const SizedBox();
    } else {
      String buttonText = "";
      void Function()? onPressed;
      if (detailEventModel.isSubscribed) {
        buttonText = AppLocalizations.of(context)?.inscrito ?? '';
      } else {
        buttonText = AppLocalizations.of(context)?.inscribirse ?? '';
        onPressed = () {
          subscribeEvent(detailEventModel.id);
        };
      }

      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor:
              Theme.of(context).colorScheme.onPrimary, // color de fondo
          backgroundColor:
              Theme.of(context).colorScheme.primary, // color de texto
        ),
        child: Text(buttonText),
      );
    }
  }

  String allDatesToString(List<DateTime> dates) {
    String result = '';
    for (DateTime date in dates) {
      bool withHour = (date.hour != 0 || date.minute != 0 || date.second != 0);

      result += '${dateToString(date, withHour: withHour)}\n';
    }
    result = result.substring(0, result.length - 1);
    return result;
  }

  @override
  likeEvent(int idEvent, bool userSetLike) {
    setState(() {
      widget.cardListenerInterface.likeEvent(idEvent, userSetLike);
    });
  }

  @override
  subscribeCategory(int idEvent, ReleaseType releaseType) {
    setState(() {
      detailEventModel.groups = detailEventModel.groups.map((category) {
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
