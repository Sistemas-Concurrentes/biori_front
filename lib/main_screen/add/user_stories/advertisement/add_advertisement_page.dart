import 'package:biori/main_screen/add/constants/add_constants.dart';
import 'package:biori/main_screen/add/user_stories/advertisement/user_stories/add_advertisement.dart';
import 'package:biori/style/javi_edit_text.dart';
import 'package:biori/style/model/chip_button_model.dart';
import 'package:biori/style/widgets_javi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddAdvertisementPage extends StatefulWidget {
  const AddAdvertisementPage({super.key});

  @override
  State<AddAdvertisementPage> createState() => _AddAdvertisementPageState();
}

class _AddAdvertisementPageState extends State<AddAdvertisementPage> {
  final _formKey = GlobalKey<FormState>();
  final widgetsJavi = WidgetsJavi();

  String? titulo;
  String? descripcion;
  List<ChipButtonModel> tagsButtons = [];
  List<ChipButtonModel> allTagsButtons = [];

  @override
  void initState() {
    super.initState();
    allTagsButtons.addAll([
      ChipButtonModel(name: "Grupo Organica A1", id: 1),
      ChipButtonModel(name: "Grupo Organica A2", id: 2),
      ChipButtonModel(name: "Grupo Organica A3", id: 3),
      ChipButtonModel(name: "SubGrupos Organica A", id: 4),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    var formWidgets = [
      eventTitleEditText(_onValidateTitle),
      descriptionBigEditText(_onValidateDescription),
      tagsCheckBoxes(_onValidateTags),
      submitButton(context),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: AddConstants().eventTag,
          child: Text(
              "${AppLocalizations.of(context)!.anadir} ${AppLocalizations.of(context)!.advertisement}"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(JaviPaddings.L),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: formWidgets
                  .map((widget) => widgetsJavi.paddedWidget(widget))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  eventTitleEditText(Function onValidate) {
    return JaviForms.inputFieldWidget(
      context,
      "eventTitle",
      "${AppLocalizations.of(context)!.titulo} ${AppLocalizations.of(context)!.advertisement}",
      onValidate,
      (onSavedVal) => {titulo = onSavedVal},
      prefixIcon: const Icon(Icons.title),
    );
  }

  descriptionBigEditText(Function onValidate) {
    return JaviForms.inputFieldWidget(
        context,
        "eventDescription",
        AppLocalizations.of(context)!.descripcion,
        onValidate,
        (onSavedVal) => {descripcion = onSavedVal},
        prefixIcon: const Icon(Icons.description),
        maxLines: null);
  }

  tagsCheckBoxes(Function onValidate) {
    return JaviForms.chipsInputFieldWidget(context, allTagsButtons, onValidate,
        (onSavedVal) => {tagsButtons = onSavedVal},
        titleEvent: AppLocalizations.of(context)!.seleccionaGrupos);
  }

  submitButton(BuildContext context) {
    return JaviForms.submitButton(context, AppLocalizations.of(context)!.send,
        () {
      if (!_formKey.currentState!.validate()) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Aviso creado correctamente!")));
        return;
      }

      _formKey.currentState!.save();
      AddAdvertisement()
          .run(titulo!, descripcion!, tagsButtons)
          .then((addAdvertisementOutput) {
        String titleDialog = "";
        Icon? iconDialog;
        if (addAdvertisementOutput == AddAdvertisementOutput.created) {
          titleDialog = "AppLocalizations.of(context)!.advertisementCreado";
          iconDialog = const Icon(Icons.check);
        } else if (addAdvertisementOutput == AddAdvertisementOutput.forbidden) {
          titleDialog = AppLocalizations.of(context)!.errorPermisos;
          iconDialog = const Icon(Icons.sms_failed);
        } else {
          titleDialog = "AppLocalizations.of(context)!.errorCrearAdvertisement";
          iconDialog = const Icon(Icons.error);
        }
        widgetsJavi.showDialogWithText(context, titleDialog, icon: iconDialog);
      });
    });
  }

  _onValidateTitle(String onValidateVal) {
    return onValidateVal.isEmpty
        ? "${AppLocalizations.of(context)!.titulo} ${AppLocalizations.of(context)!.cannotBeEmpty}"
        : null;
  }

  _onValidateDescription(String onValidateVal) {
    return onValidateVal.isEmpty
        ? "${AppLocalizations.of(context)!.descripcion} ${AppLocalizations.of(context)!.cannotBeEmpty}"
        : null;
  }

  String? _onValidateTags(List<ChipButtonModel>? onValidateVal) {
    return (onValidateVal == null || onValidateVal.isEmpty)
        ? AppLocalizations.of(context)!.mustSelectOneOrMore
        : null;
  }
}
