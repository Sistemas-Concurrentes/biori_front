import 'package:biori/main_screen/add/user_stories/event/events_general/dto/add_event_dto.dart';
import 'package:biori/main_screen/add/user_stories/event/events_general/repository/add_events_repository.dart';
import 'package:biori/main_screen/add/user_stories/event/events_general/user_stories/add_event.dart';
import 'package:biori/main_screen/add/user_stories/event/validators/event_validators.dart';
import 'package:biori/router/custom_router.dart';
import 'package:biori/style/javi_edit_text.dart';
import 'package:biori/style/model/chip_button_model.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddEventPageVM {
  final eventRepository = AddEventRepository();
  List<ChipButtonModel> allTags = [];
  List<CategoryLabelGroup> categories = [];
  BehaviorSubject<bool> isApiCallProcess = BehaviorSubject.seeded(false);
  BehaviorSubject<bool> isChecked = BehaviorSubject.seeded(false);
  BehaviorSubject<ResponseDialog> responseDialog = BehaviorSubject();

  final formKey = GlobalKey<FormState>();
  AddEventDto model = AddEventDto(fechas: []);
  EventValidators eventValidators = EventValidators();
  JaviForms form = JaviForms();

  void loadTags() async {
    allTags = await eventRepository.getTeacherTags();
  }

  void loadCategories() {
    categories.addAll(CategoryLabelGroup.values);
  }

  void onCheckedInscriptionDate(bool actualValue) {
    isChecked.add(!actualValue);
  }

  onValidateTitle(String onValidateVal, String? error) {
    return eventValidators.onValidateTitle(onValidateVal, error);
  }

  onValidateDescription(String onValidateVal, String? error) {
    return eventValidators.onValidateDescription(onValidateVal, error);
  }

  onValidateCategory(String? onValidateVal, String? error) {
    onValidateVal ??= "";
    return eventValidators.onValidateCategory(onValidateVal, error);
  }

  onValidateDates(String onValidateVal, String? error) {
    return eventValidators.onValidateDates(onValidateVal, error);
  }

  onValidateLocation(String onValidateVal, String? error) {
    return eventValidators.onValidateLocation(onValidateVal, error);
  }

  onValidateTags(List<ChipButtonModel>? onValidateVal, context) {
    return (onValidateVal == null || onValidateVal.isEmpty)
        ? AppLocalizations.of(context)!.mustSelectOneOrMore
        : null;
  }

  onValidateInscriptionDate(
      String? onValidateVal, String? error, bool isCheckedForInscriptionDate) {
    return eventValidators.onValidateInscriptionDate(
        onValidateVal, error, isCheckedForInscriptionDate);
  }

  onSavedValTags(List<ChipButtonModel> onSavedVal) {
    model.tagsButtons = onSavedVal;
  }

  onSavedValTitle(String onSavedVal) {
    model.titulo = onSavedVal;
  }

  onSavedValDescription(String onSavedVal) {
    model.descripcion = onSavedVal;
  }

  onSavedValCategory(String onSavedVal) {
    model.categoria = onSavedVal;
  }

  onSavedValDates(String onSavedVal) {
    model.fechas.add(form.stringSpainFormatToBdFormat(onSavedVal));
  }

  onSavedValLocation(String onSavedVal) {
    model.localizacion = onSavedVal;
  }

  onSavedValInscriptionDate(String onSavedVal) {
    model.fechaFinInscripcion = form.stringSpainFormatToBdFormat(onSavedVal);
  }

  void submitButton(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context)!.errorForm)));
      return;
    }
    formKey.currentState!.save();

    isApiCallProcess.add(true);
    var addEventOutput = await AddEvent().run(model);
    isApiCallProcess.add(false);

    if (context.mounted) {
      responseDialog.add(responseDialogFromOutput(context, addEventOutput));
    }
  }

  ResponseDialog responseDialogFromOutput(
      BuildContext context, AddEventOutput addEventOutput) {
    String titleDialog;
    Icon iconDialog;
    Function onPressed = () {
      CustomRouter.router.pop();
    };

    if (addEventOutput == AddEventOutput.created) {
      titleDialog = context.mounted
          ? AppLocalizations.of(context)?.eventoCreado ?? ""
          : "";
      iconDialog = const Icon(Icons.check);
    } else if (addEventOutput == AddEventOutput.forbidden) {
      titleDialog = context.mounted
          ? AppLocalizations.of(context)?.errorPermisos ?? ""
          : "";
      iconDialog = const Icon(Icons.sms_failed);
    } else {
      titleDialog = context.mounted
          ? AppLocalizations.of(context)?.errorCrearEvento ?? ""
          : "";
      iconDialog = const Icon(Icons.error);
      onPressed = () {};
    }

    return ResponseDialog(titleDialog, iconDialog, onPressed);
  }
}

class ResponseDialog {
  final String title;
  final Icon icon;
  final Function onPressed;

  ResponseDialog(this.title, this.icon, this.onPressed);
}

enum CategoryLabelGroup {
  becas("Becas y empleo"),
  jornadas("Jornadas y cursos"),
  conferencias("Conferencias"),
  voluntariado("Voluntariado"),
  exposiciones("Exposiciones y Concursos");

  const CategoryLabelGroup(this.label);

  final String label;
}
