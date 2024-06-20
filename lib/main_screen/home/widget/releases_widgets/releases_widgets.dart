import 'package:flutter/material.dart';

import '../../../../../style/javi_edit_text.dart';
import 'constants/constants.dart';

class ReleasesWidgets {
  static Row releaseTitleRow(context, title, {bottomPadding = JaviPaddings.L}) {
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(bottom: bottomPadding),
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: JaviStyle.tituloEvento,
            ),
          ),
        )
      ],
    );
  }

  static Row releaseDescriptionRow(context, description,
      {maxLimit = ReleasesConstants.maxLinesPerDescription}) {
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(bottom: JaviPaddings.L),
            child: Text(
              description,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
              maxLines: maxLimit,
              style: JaviStyle.descripcion,
            ),
          ),
        )
      ],
    );
  }

  static Row releaseGroupsNameRow(context, Map<int, String> groups) {
    String groupsName = _groupsToString(groups);
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ReleasesConstants.margin),
            ),
            padding: const EdgeInsets.fromLTRB(
                ReleasesConstants.padding, 0, ReleasesConstants.padding, 0),
            child: Text(
              groupsName,
              textAlign: TextAlign.left,
              style: JaviStyle.informacionExtraCards,
            ),
          ),
        )
      ],
    );
  }

  static String _groupsToString(Map<int, String> groupsInfo) {
    String groups = "";
    groupsInfo.forEach((k, v) => groups += "$v, ");
    return groups.substring(0, groups.length - 2);
  }

  Column dividerAndSubtitleName(context, String subtitle) {
    return Column(
      children: [
        const Divider(),
        Row(children: [
          Expanded(
            child: Container(
                margin: const EdgeInsets.only(bottom: JaviPaddings.S),
                child: Text(subtitle, style: JaviStyle.subtitulo)),
          ),
        ]),
      ],
    );
  }
}
