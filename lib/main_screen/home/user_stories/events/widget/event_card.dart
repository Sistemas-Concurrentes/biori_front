import 'package:biori/main_screen/home/listeners/card_listener_interface.dart';
import 'package:biori/main_screen/home/user_stories/releases/releases_widgets/button_widgets/categories_buttons.dart';
import 'package:biori/main_screen/home/user_stories/releases/releases_widgets/button_widgets/my_like_button.dart';
import 'package:biori/main_screen/home/user_stories/releases/releases_widgets/releases_widgets.dart';
import 'package:biori/router/custom_router.dart';
import 'package:biori/style/javi_edit_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import '../../releases/releases_widgets/constants/constants.dart';
import '../model/event_model.dart';

class EventCard extends StatelessWidget {
  final scrollController = ScrollController();
  final EventModel eventModel;
  final CardListenerInterface cardListenerInterface;

  EventCard(
      {super.key,
      required this.cardListenerInterface,
      required this.eventModel});

  Future _goToEventDetail() {
    return CustomRouter.router.push("/eventDetail/${eventModel.id}", extra: {
      'eventModel': eventModel,
      'cardListenerInterface': cardListenerInterface
    }).then((value) => null);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _goToEventDetail();
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ReleasesWidgets.releaseTitleRow(context, eventModel.title),
            ReleasesWidgets.releaseDescriptionRow(
                context, eventModel.description,
                maxLimit: ReleasesConstants.maxLinesPerEventDescription),
            const Divider(),
            _tagsNameLinea(context),
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: CategoriesButtons(
                categories: eventModel.tags,
                subscribeEvent: cardListenerInterface.subscribeCategory,
                releaseType: ReleaseType.event,
              ),
            ),
            _ultimaLinea(context, AppLocalizations.of(context)!.saberMas)
          ],
        ),
      ),
    );
  }

  Row _tagsNameLinea(context) {
    return Row(children: [
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(bottom: 4),
            child: const Text("Tags", style: JaviStyle.subtitulo)),
      ),
    ]);
  }

  Row _ultimaLinea(context, saberMasText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyLikeButton(
            id: eventModel.id,
            releaseType: ReleaseType.event,
            numberLikes: eventModel.numberLikes,
            isLiked: eventModel.isLiked,
            likeEvent: cardListenerInterface.likeEvent),
        ElevatedButton(
            onPressed: () {
              _goToEventDetail();
            },
            style: ElevatedButton.styleFrom(
              foregroundColor:
                  Theme.of(context).colorScheme.onPrimary, // color de fondo
              backgroundColor:
                  Theme.of(context).colorScheme.primary, // color de texto
            ),
            child: Text(saberMasText)),
      ],
    );
  }
}
