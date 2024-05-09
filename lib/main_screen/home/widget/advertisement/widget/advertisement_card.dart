import 'package:biori/style/javi_edit_text.dart';
import 'package:flutter/material.dart';
import '../../releases_widgets/constants/constants.dart';
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
          _groupsAffectedRow(),
          ReleasesWidgets.releaseDescriptionRow(
              context, advertisementModel.description),
        ],
      ),
    );

  }

  String _groupsToString(){
    String groups = "";
    advertisementModel.groupsInfo.forEach((k,v) => groups += "$v, ");
    return groups.substring(0, groups.length - 2);
  }
  Row _groupsAffectedRow(){
    String groups = _groupsToString();
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ReleasesConstants.margin),
            ),
            padding: const EdgeInsets.fromLTRB(ReleasesConstants.padding, 0, ReleasesConstants.padding, 0),
            child: Text(
              groups,
              textAlign: TextAlign.left,
              style: JaviStyle.informacionExtraCards,
            ),
          ),
        )
      ],
    );
  }

}
