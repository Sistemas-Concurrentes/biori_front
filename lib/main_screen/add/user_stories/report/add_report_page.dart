import 'package:biori/main_screen/add/constants/add_constants.dart';
import 'package:biori/main_screen/add/user_stories/report/repository/add_report_repository.dart';
import 'package:biori/main_screen/add/user_stories/report/user_stories/add_report.dart';
import 'package:biori/router/custom_router.dart';
import 'package:biori/style/javi_edit_text.dart';
import 'package:biori/style/model/chip_button_model.dart';
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

  String titulo = "";
  String descripcion = "";
  List<ChipButtonModel> courses = [];
  bool toTeachers = false;

  bool _isApiCallProcess = false;

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

  Widget tagsCheckBoxes(Function onValidate) {
    return FutureBuilder<List<ChipButtonModel>>(
      future: AddReportRepository().getAllCourses(),
      builder: (BuildContext context,
          AsyncSnapshot<List<ChipButtonModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Text('Error al cargar los datos');
        } else {
          return JaviForms.chipsInputFieldWidget(
              context,
              snapshot.data!,
              onValidate,
              (onSavedVal) => {
                    courses = onSavedVal,
                    toTeachers = courses.any((element) => element.id == 0),
                    if (toTeachers)
                      courses.removeWhere((element) => element.id == 0)
                  },
              titleEvent: AppLocalizations.of(context)?.seleccionaGrupos ?? "");
        }
      },
    );
  }

  submitButton(BuildContext context) {
    return JaviForms.submitButton(context, AppLocalizations.of(context)!.send,
        () async {
      if (!_formKey.currentState!.validate()) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(AppLocalizations.of(context)!.errorForm)));
        return;
      }
      _formKey.currentState!.save();

      _showLoading(true);
      var addReportOutput =
          await AddReport().run(titulo, descripcion, courses, toTeachers);
      _showLoading(false);
      _showDialogAfterApiCall(addReportOutput);
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

  _showLoading(bool showLoading) {
    setState(() {
      _isApiCallProcess = showLoading;
    });
  }

  _showDialogAfterApiCall(AddReportOutput addReportOutput) {
    String titleDialog = "";
    Icon? iconDialog;
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

    if (context.mounted) {
      widgetsJavi.showDialogWithText(context, titleDialog, onPressed,
          icon: iconDialog);
    }
  }
}
