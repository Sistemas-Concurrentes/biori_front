import 'package:biori/main_screen/add/user_stories/advertisement/repository/add_advertisement_repository.dart';
import 'package:biori/main_screen/add/user_stories/advertisement/user_stories/add_advertisement.dart';
import 'package:biori/router/custom_router.dart';
import 'package:biori/style/model/chip_button_model.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddAdvertisementPageVM {
  final advertisementRepository = AddAdvertisementRepository();

  BehaviorSubject<bool> reload = BehaviorSubject();
  BehaviorSubject<ResponseDialog> responseDialog = BehaviorSubject();

  final formKey = GlobalKey<FormState>();
  List<ChipButtonModel> allGroups = [];

  String titulo = "";
  String descripcion = "";
  List<ChipButtonModel> coursesToSend = [];
  bool isApiCallProcess = false;

  void loadGroups() async {
    allGroups = await advertisementRepository.getAllGroups();
    reload.add(true);
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

    reload.add(isApiCallProcess = true);
    var addAdvertismentOutput =
        await AddAdvertisement().run(titulo, descripcion, coursesToSend);

    reload.add(isApiCallProcess = false);

    if (context.mounted) {
      responseDialog
          .add(responseDialogFromOutput(context, addAdvertismentOutput));
    }
  }

  ResponseDialog responseDialogFromOutput(
      BuildContext context, AddAdvertisementOutput addReportOutput) {
    String titleDialog;
    Icon iconDialog;
    Function onPressed = () {
      CustomRouter.router.pop();
    };

    if (addReportOutput == AddAdvertisementOutput.created) {
      titleDialog = context.mounted
          ? AppLocalizations.of(context)?.avisoCreado ?? ""
          : "";
      iconDialog = const Icon(Icons.check);
    } else if (addReportOutput == AddAdvertisementOutput.forbidden) {
      titleDialog = context.mounted
          ? AppLocalizations.of(context)?.errorPermisos ?? ""
          : "";
      iconDialog = const Icon(Icons.sms_failed);
    } else {
      titleDialog = context.mounted
          ? AppLocalizations.of(context)?.errorCrearAviso ?? ""
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
