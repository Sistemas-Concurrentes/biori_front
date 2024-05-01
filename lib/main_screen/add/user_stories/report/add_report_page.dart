import 'package:biori/main_screen/add/constants/add_constants.dart';
import 'package:biori/main_screen/add/user_stories/report/user_stories/add_report.dart';
import 'package:biori/style/javi_edit_text.dart';
import 'package:biori/style/widgets_javi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddReportPage extends StatefulWidget {
  const AddReportPage({super.key});

  @override
  State<AddReportPage> createState() => _AddReportPageState();
}

class _AddReportPageState extends State<AddReportPage> {
  final _formKey = GlobalKey<FormState>();
  final widgetsJavi = WidgetsJavi();

  String? titulo;
  String? descripcion;

  bool _isApiCallProcess = false;

  @override
  Widget build(BuildContext context) {
    var formWidgets = [
      eventTitleEditText(_onValidateTitle),
      descriptionBigEditText(_onValidateDescription),
      submitButton(context),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: AddConstants().reportTag,
          child: Text(
              "${AppLocalizations.of(context)!.anadir} ${AppLocalizations.of(context)!.report}"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(JaviPaddings.L),
        child: WidgetsJavi().progressHudJavi(
          context,
          _isApiCallProcess,
          Form(
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
      ),
    );
  }

  eventTitleEditText(Function onValidate) {
    return JaviForms.inputFieldWidget(
      context,
      "eventTitle",
      "${AppLocalizations.of(context)!.titulo} ${AppLocalizations.of(context)!.report}",
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

  submitButton(BuildContext context) {
    return JaviForms.submitButton(context, AppLocalizations.of(context)!.send,
        () {
      if (!_formKey.currentState!.validate()) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Report mal creado")));
        return;
      }
      _showLoading(true);

      _formKey.currentState!.save();
      AddReport().run(titulo!, descripcion!).then((addReportOutput) {
        String titleDialog = "";
        Icon? iconDialog;
        if (addReportOutput == AddReportOutput.created) {
          titleDialog = "AppLocalizations.of(context)!.reportCreado";
          iconDialog = const Icon(Icons.check);
        } else if (addReportOutput == AddReportOutput.forbidden) {
          titleDialog = AppLocalizations.of(context)!.errorPermisos;
          iconDialog = const Icon(Icons.sms_failed);
        } else {
          titleDialog = "AppLocalizations.of(context)!.errorCrearReport";
          iconDialog = const Icon(Icons.error);
        }
        _showLoading(false);

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

  _showLoading(bool showLoading) {
    setState(() {
      _isApiCallProcess = showLoading;
    });
  }
}
