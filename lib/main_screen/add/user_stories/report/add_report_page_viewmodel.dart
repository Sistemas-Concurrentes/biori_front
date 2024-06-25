import 'package:biori/main_screen/add/user_stories/report/repository/add_report_repository.dart';
import 'package:biori/main_screen/add/user_stories/report/user_stories/add_report.dart';
import 'package:biori/router/custom_router.dart';
import 'package:biori/style/model/chip_button_model.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddReportPageVM {
  final reportRepository = AddReportRepository();
  BehaviorSubject<List<ChipButtonModel>> courses = BehaviorSubject.seeded([]);
  BehaviorSubject<bool> isApiCallProcess = BehaviorSubject.seeded(false);
  BehaviorSubject<ResponseDialog> responseDialog = BehaviorSubject();

  final formKey = GlobalKey<FormState>();
  String titulo = "";
  String descripcion = "";
  List<ChipButtonModel> coursesToSend = [];
  bool toTeachers = false;

  void loadCourses() async {
    final currentCourses = courses.valueOrNull ?? [];

    if (currentCourses.isNotEmpty) {
      courses.add(currentCourses);
      return;
    }

    final newCourses = await reportRepository.getAllCourses();
    courses.add(newCourses);
  }

  onValidateTitle(String onValidateVal, context) {
    return onValidateVal.isEmpty
        ? "${AppLocalizations.of(context)!.titulo} ${AppLocalizations.of(context)!.cannotBeEmpty}"
        : null;
  }

  onValidateDescription(String onValidateVal, context) {
    return onValidateVal.isEmpty
        ? "${AppLocalizations.of(context)!.descripcion} ${AppLocalizations.of(context)!.cannotBeEmpty}"
        : null;
  }

  String? onValidateTags(List<ChipButtonModel>? onValidateVal, context) {
    return (onValidateVal == null || onValidateVal.isEmpty)
        ? AppLocalizations.of(context)!.mustSelectOneOrMore
        : null;
  }

  onSavedValTags(List<ChipButtonModel> onSavedVal) {
    coursesToSend = onSavedVal;
    toTeachers = coursesToSend.any((element) => element.id == 0);
    if (toTeachers) {
      coursesToSend.removeWhere((course) => course.id == 0);
    }
  }

  onSavedValTitle(String onSavedVal) {
    titulo = onSavedVal;
  }

  onSavedValDescription(String onSavedVal) {
    descripcion = onSavedVal;
  }

  void submitButton(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context)!.errorForm)));
      return;
    }
    formKey.currentState!.save();

    isApiCallProcess.add(true);
    var addReportOutput =
        await AddReport().run(titulo, descripcion, coursesToSend, toTeachers);

    isApiCallProcess.add(false);

    if (context.mounted) {
      responseDialog.add(responseDialogFromOutput(context, addReportOutput));
    }
  }

  ResponseDialog responseDialogFromOutput(
      BuildContext context, AddReportOutput addReportOutput) {
    String titleDialog;
    Icon iconDialog;
    Function onPressed = () {
      CustomRouter.router.pop();
    };

    if (addReportOutput == AddReportOutput.created) {
      titleDialog = context.mounted
          ? AppLocalizations.of(context)?.reportCreado ?? ""
          : "";
      iconDialog = const Icon(Icons.check);
    } else if (addReportOutput == AddReportOutput.forbidden) {
      titleDialog = context.mounted
          ? AppLocalizations.of(context)?.errorPermisos ?? ""
          : "";
      iconDialog = const Icon(Icons.sms_failed);
    } else {
      titleDialog = context.mounted
          ? AppLocalizations.of(context)?.errorCrearReport ?? ""
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
