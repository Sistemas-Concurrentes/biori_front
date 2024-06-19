import 'package:biori/style/javi_edit_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'events_general/add_event_page.dart';

class EventCommonWidgets {
  Widget eventTitleEditText(
      BuildContext context, Function onValidate, Function onSavedVal) {
    return JaviForms.inputFieldWidget(
      context,
      "eventTitle",
      "${AppLocalizations.of(context)?.titulo} ${AppLocalizations.of(context)!.evento}",
      (onValidateVal) => onValidate(onValidateVal,
          "${AppLocalizations.of(context)?.titulo} ${AppLocalizations.of(context)?.cannotBeEmpty}"),
      onSavedVal,
      prefixIcon: const Icon(Icons.title),
    );
  }

  descriptionBigEditText(
      BuildContext context, Function onValidate, Function onSavedVal) {
    return JaviForms.inputFieldWidget(
        context,
        "eventDescription",
        AppLocalizations.of(context)!.descripcion,
        (onValidateVal) => onValidate(onValidateVal,
            "${AppLocalizations.of(context)!.descripcion} ${AppLocalizations.of(context)?.cannotBeEmpty}"),
        onSavedVal,
        prefixIcon: const Icon(Icons.description),
        maxLines: null);
  }

  categoryChooser(BuildContext context, Function onValidate,
      Function onSavedVal, TextEditingController controller, List values) {
    return JaviForms.dropDownMenu(
        context,
        controller,
        values,
        onSavedVal,
        (onValidateVal) => onValidate(
            onValidateVal, "${AppLocalizations.of(context)?.mustSelectOne}"),
        hintText: AppLocalizations.of(context)!.selectOne);
  }

  TextFormField addDate(TextEditingController controller, BuildContext context,
      Function onValidate, Function onSavedVal) {
    return JaviForms.selectDateTime(
      context,
      controller,
      (onValidateVal) => onValidate(
          onValidateVal, "${AppLocalizations.of(context)?.mustSelectOne}"),
      onSavedVal,
      prefixIcon: const Icon(Icons.calendar_today),
      hintText: "dd/mm/yyyy hh:mm:ss",
      needTime: true,
    );
  }

  TextFormField addInscriptionDate(
      TextEditingController controller,
      BuildContext context,
      Function onValidate,
      Function onSavedVal,
      bool isCheckedForInscriptionDate) {
    return JaviForms.selectDateTime(
      context,
      controller,
      (onValidateVal) => onValidate(
          onValidateVal,
          "${AppLocalizations.of(context)?.mustSelectOne}",
          isCheckedForInscriptionDate),
      onSavedVal,
      prefixIcon: const Icon(Icons.calendar_today),
      hintText: "dd/mm/yyyy hh:mm:ss",
      needTime: true,
    );
  }

  addWidgetIfLastIsFilled(BuildContext context, widgets, Function setState,
      Function onValidateDate, Function onSavedValDates) {
    if (widgets.isNotEmpty) {
      TextFormField lastWidget = widgets.last as TextFormField;
      if (lastWidget.controller!.text.isNotEmpty) {
        widgets.add(addDate(
            TextEditingController(), context, onValidateDate, onSavedValDates));
      }
    }
    setState();
  }

  addDatesIntoWidget(BuildContext context, widgets, Function setState,
      Function onValidateDate, Function onSavedValDates) {
    return Container(
      decoration: JaviInputDecorators().boxDecorator(context),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: JaviPaddings.M),
              child: Text(
                AppLocalizations.of(context)!.fechasEvento,
                style: JaviStyle.subtitulo,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: JaviPaddings.M),
              child: Column(
                children: widgets,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: JaviPaddings.M),
              child: ElevatedButton(
                onPressed: () => addWidgetIfLastIsFilled(context, widgets,
                    setState, onValidateDate, onSavedValDates),
                child: Text(
                    "${AppLocalizations.of(context)!.anadir} ${AppLocalizations.of(context)!.fecha}"),
              ),
            )
          ],
        ),
      ),
    );
  }

  locationEditText(
      BuildContext context, Function onValidate, Function onSavedVal) {
    return JaviForms.inputFieldWidget(
      context,
      "eventLocation",
      AppLocalizations.of(context)!.localizacion,
      (onValidateVal) => onValidate(onValidateVal, "Error"),
      onSavedVal,
      prefixIcon: const Icon(Icons.location_on),
    );
  }

  addCheckbox(
      BuildContext context,
      String title,
      Function onValidateDate,
      Function onSavedValInscriptionDate,
      bool isCheckedForInscriptionDate,
      Function setState) {
    return JaviForms().addCheckboxWithResponsiveWidget(
        context,
        title,
        isCheckedForInscriptionDate,
        addInscriptionDate(TextEditingController(), context, onValidateDate,
            onSavedValInscriptionDate, isCheckedForInscriptionDate),
        setState);
  }
}
