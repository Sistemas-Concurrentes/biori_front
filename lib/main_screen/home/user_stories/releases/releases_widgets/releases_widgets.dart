import 'package:flutter/material.dart';

import '../../../../../style/javi_edit_text.dart';
import 'constants/constants.dart';

class ReleasesWidgets{
  static Row releaseTitleRow(context, title) {
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(EventConstants.borderRadius),
            ),
            margin: const EdgeInsets.all(EventConstants.margin),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: JaviStyle.tituloEvento,
            ),
          ),
        )
      ],
    );
  }

  static Row releaseDescriptionRow(context, description) {
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(EventConstants.margin),
            ),
            margin: const EdgeInsets.all(EventConstants.margin),
            padding: const EdgeInsets.all(EventConstants.padding),
            child: Text(
              description,
              textAlign: TextAlign.justify,
              style: JaviStyle.descripcion,
            ),
          ),
        )
      ],
    );
  }
  
  static Row moreInfo(context, String location, DateTime date, DateTime? endInscription) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(EventConstants.margin),
            child: RichText(text: TextSpan(
              text: '',
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                const TextSpan(
                    text: 'Fecha del evento: ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: _dateToString(date)),
                const TextSpan(
                    text: '\nLugar: ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: location),
                endInscription == null
                    ? const TextSpan(text: '')
                    : const TextSpan(
                    text: '\nFecha fin de inscripción: ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                endInscription == null
                    ? const TextSpan(text: '')
                    : TextSpan(
                    text: _dateToString(endInscription)),
              ],
            ),),
          ),
        ),],
    );
  }
  
  static Expanded moreInfoButton(context, String location, DateTime date,
      DateTime? endInscription) {
    return Expanded(
      child: ExpansionTile(
        title: const Text(" "),
        expandedAlignment: Alignment.topLeft,
        children: [
          IntrinsicWidth(
            child: RichText(
              text: TextSpan(
                text: '',
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  const TextSpan(
                      text: 'Fecha del evento: ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: _dateToString(date)),
                  const TextSpan(
                      text: '\nLugar: ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: location),
                  endInscription == null
                      ? const TextSpan(text: '')
                      : const TextSpan(
                      text: '\nFecha fin de inscripción: ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  endInscription == null
                      ? const TextSpan(text: '')
                      : TextSpan(
                      text: _dateToString(endInscription) + "\n"),
                  endInscription == null
                      ? const TextSpan(text: ''):
                  const TextSpan(text: 'Inscribirse',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static String _dateToString(DateTime date, {bool withHour = true}) {
    if (withHour) {
      return "${date.day}/${date.month}/${date.year}. ${date.hour}h";
    }
    return "${date.day}/${date.month}/${date.year}";
  }
}