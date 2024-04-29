import 'package:biori/main_screen/home/user_stories/releases/releases_widgets/constants/constants.dart';
import 'package:biori/main_screen/home/user_stories/releases/releases_widgets/releases_widgets.dart';
import 'package:biori/style/javi_edit_text.dart';
import 'package:flutter/material.dart';
import '../model/report_model.dart';

class ReportCard extends StatelessWidget {
  final scrollController = ScrollController();
  final ReportModel reportModel;

  ReportCard (
      {super.key,
      required this.reportModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(JaviPaddings.L),
      child: Column(
        children: [
          ReleasesWidgets.releaseTitleRow(context, reportModel.title),
          creatorName(),
          ReleasesWidgets.releaseDescriptionRow(
              context, reportModel.description),
        ],
      ),
    );
  }

  Widget creatorName() {
    return Container(
      margin: const EdgeInsets.only(bottom: JaviPaddings.L),
      child: Row(
        children: [
          Expanded(
            child: Text(
              reportModel.creatorName,
              textAlign: TextAlign.left,
              style: JaviStyle.informacionExtraCards,
            ),
          )
        ],
      ),
    );
  }
}
