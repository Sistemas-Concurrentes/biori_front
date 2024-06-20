import 'package:biori/style/javi_edit_text.dart';
import 'package:flutter/material.dart';
import '../../releases_widgets/releases_widgets.dart';
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
          ReleasesWidgets.releaseTitleRow(context, reportModel.title,
              bottomPadding: JaviPaddings.S),
          creatorName(),
          ReleasesWidgets.releaseDescriptionRow(
              context, reportModel.description),
          ReleasesWidgets().dividerAndSubtitleName(context, "Courses"),
          releaseCoursesNameRow(
              context, reportModel.courses, reportModel.toTeachers),
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
              style: JaviStyle.subcomentarios,
            ),
          )
        ],
      ),
    );
  }

  static Row releaseCoursesNameRow(
      context, List<int> courses, bool toTeachers) {
    String coursesName = _coursesToString(courses, toTeachers);
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.topLeft,
            child: Text(
              coursesName,
              textAlign: TextAlign.left,
              style: JaviStyle.informacionExtraCards,
            ),
          ),
        )
      ],
    );
  }
}

String _coursesToString(List<int> courses, bool toTeachers) {
  String coursesName = "";
  for (var course in courses) {
    coursesName += "$courseº, ";
  }
  if (toTeachers) {
    coursesName += "to teachers";
  } else {
    coursesName = coursesName.substring(0, coursesName.length - 2);
  }

  return coursesName;
}
