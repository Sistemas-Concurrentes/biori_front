import 'package:biori/main_screen/home/listeners/card_listener_interface.dart';
import 'package:biori/main_screen/home/widget/events/model/event_group_model.dart';
import 'package:biori/router/custom_router.dart';
import 'package:biori/style/javi_edit_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import '../../releases_widgets/button_widgets/my_like_button.dart';
import '../../releases_widgets/constants/constants.dart';
import '../../releases_widgets/releases_widgets.dart';

class EventGroupCard extends StatelessWidget {
  final scrollController = ScrollController();
  final EventGroupModel eventGroupModel;
  final CardListenerInterface cardListenerInterface;

  EventGroupCard(
      {super.key,
      required this.cardListenerInterface,
      required this.eventGroupModel});

  Future _goToEventDetail() {
    return CustomRouter.router.push("/eventDetail/${eventGroupModel.id}",
        extra: {
          'eventModel': eventGroupModel,
          'cardListenerInterface': cardListenerInterface
    }).then((value) => null);
  }

  @override
  Widget build(BuildContext context) {
    Map<int, String> groupsInfo = {};
    for (var element in eventGroupModel.groups) {
      groupsInfo[element.id] = element.name;
    }
    return InkWell(
      onTap: () {
        _goToEventDetail();
      },
      child: Padding(
        padding: const EdgeInsets.all(JaviPaddings.L),
        child: Column(
          children: [
            ReleasesWidgets.releaseTitleRow(context, eventGroupModel.title),
            ReleasesWidgets.releaseDescriptionRow(
                context, eventGroupModel.description,
                maxLimit: ReleasesConstants.maxLinesPerEventDescription),
            const Divider(),
            _groupsName(context),
            ReleasesWidgets.releaseGroupsNameRow(context, groupsInfo),
            _ultimaLinea(context, AppLocalizations.of(context)!.saberMas)
          ],
        ),
      ),
    );
  }

  Row _groupsName(context) {
    return Row(children: [
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(bottom: JaviPaddings.S),
            child: const Text("Groups", style: JaviStyle.subtitulo)),
      ),
    ]);
  }

  Row _ultimaLinea(context, saberMasText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyLikeButton(
            id: eventGroupModel.id,
            releaseType: ReleaseType.event,
            numberLikes: eventGroupModel.numberLikes,
            isLiked: eventGroupModel.isLiked,
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
