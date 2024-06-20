import 'package:biori/main_screen/home/listeners/card_listener_interface.dart';
import 'package:biori/router/custom_router.dart';
import 'package:biori/style/javi_edit_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import '../../releases_widgets/button_widgets/categories_buttons.dart';
import '../../releases_widgets/button_widgets/my_like_button.dart';
import '../../releases_widgets/constants/constants.dart';
import '../../releases_widgets/releases_widgets.dart';
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
      'releaseType': ReleaseType.event,
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
        padding: const EdgeInsets.all(JaviPaddings.L  ),
        child: Column(
          children: [
            ReleasesWidgets.releaseTitleRow(context, eventModel.title),
            ReleasesWidgets.releaseDescriptionRow(
                context, eventModel.description,
                maxLimit: ReleasesConstants.maxLinesPerEventDescription),
            ReleasesWidgets().dividerAndSubtitleName(context, "Tags"),
            Container(
              margin: const EdgeInsets.only(bottom: JaviPaddings.M),
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

  Row _ultimaLinea(context, saberMasText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyLikeButton(
            id: eventModel.id,
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
