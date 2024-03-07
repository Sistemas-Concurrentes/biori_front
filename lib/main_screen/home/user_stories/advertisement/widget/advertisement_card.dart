import 'package:biori/main_screen/home/user_stories/releases/releases_widgets/constants/constants.dart';
import 'package:biori/main_screen/home/user_stories/releases/releases_widgets/releases_widgets.dart';
import 'package:biori/style/javi_edit_text.dart';
import 'package:flutter/material.dart';
import '../../../../../theme/pallete.dart';
import '../model/advertisement_model.dart';

class AdvertisementCard extends StatelessWidget {
  final scrollController = ScrollController();
  final AdvertisementModel advertisementModel;

  AdvertisementCard(
      {super.key,
      required this.advertisementModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ReleasesWidgets.releaseTitleRow(context, advertisementModel.title),
            _groupsAffectedRow(),
            ReleasesWidgets.releaseDescriptionRow(
                context, advertisementModel.description),

          ],
        ),
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
              color: Pallete.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(EventConstants.margin),
            ),
            padding: const EdgeInsets.all(EventConstants.padding),
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
