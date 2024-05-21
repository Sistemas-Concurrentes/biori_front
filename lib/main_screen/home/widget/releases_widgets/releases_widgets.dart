import 'package:flutter/material.dart';

import '../../../../../style/javi_edit_text.dart';
import 'constants/constants.dart';

class ReleasesWidgets {
  static Row releaseTitleRow(context, title) {
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(bottom: JaviPaddings.L),
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
}
