import 'package:biori/style/javi_edit_text.dart';
import 'package:flutter/material.dart';
import '../../releases_widgets/releases_widgets.dart';
import '../model/advertisement_model.dart';

class AdvertisementCard extends StatelessWidget {
  final scrollController = ScrollController();
  final AdvertisementModel advertisementModel;

  AdvertisementCard(
      {super.key,
      required this.advertisementModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(JaviPaddings.L),
      child: Column(
        children: [
          ReleasesWidgets.releaseTitleRow(context, advertisementModel.title),
          ReleasesWidgets.releaseDescriptionRow(
              context, advertisementModel.description),
          ReleasesWidgets().dividerAndSubtitleName(context, "Grupos"),
          ReleasesWidgets.releaseGroupsNameRow(
              context, advertisementModel.groupsInfo),
        ],
      ),
    );

  }
}
