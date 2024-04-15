import 'package:biori/main_screen/home/user_stories/releases/releases_widgets/constants/constants.dart';
import 'package:biori/main_screen/home/user_stories/releases/releases_widgets/releases_widgets.dart';
import 'package:biori/style/javi_edit_text.dart';
import 'package:flutter/material.dart';
import '../../../../../theme/pallete.dart';
import '../model/report_model.dart';

class ReportCard extends StatelessWidget {
  final scrollController = ScrollController();
  final ReportModel reportModel;

  ReportCard (
      {super.key,
      required this.reportModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Pallete.primaryColor.withOpacity(0.8),
          ),
          child: Column(
            children: [
              ReleasesWidgets.releaseTitleRow(context, reportModel.title),
              creatorName(),
              ReleasesWidgets.releaseDescriptionRow(
                  context, reportModel.description),

            ],
          ),
        ),
      ),
    );
  }

  Row creatorName(){
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
              color: Pallete.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(EventConstants.margin),
            ),
            padding: const EdgeInsets.fromLTRB(EventConstants.padding, 0, EventConstants.padding, 0),
            child: Text(
              reportModel.creatorName,
              textAlign: TextAlign.left,
              style: JaviStyle.informacionExtraCards,
            ),
          ),
        )
      ],
    );
  }
}
