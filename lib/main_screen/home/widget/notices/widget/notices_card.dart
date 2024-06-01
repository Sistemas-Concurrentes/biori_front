import 'package:biori/style/javi_edit_text.dart';
import 'package:flutter/material.dart';
import '../../releases_widgets/releases_widgets.dart';
import '../model/notices_model.dart';

class NoticesCard extends StatelessWidget {
  final scrollController = ScrollController();
  final NoticesModel noticeModel;

  NoticesCard({super.key, required this.noticeModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(JaviPaddings.L),
      child: Column(
        children: [
          ReleasesWidgets.releaseTitleRow(context, noticeModel.title),
          ReleasesWidgets.releaseDescriptionRow(
              context, noticeModel.description),
          ReleasesWidgets().dividerAndSubtitleName(context, "Grupos"),
          ReleasesWidgets.releaseGroupsNameRow(context, noticeModel.groupsInfo),
        ],
      ),
    );

  }
}
