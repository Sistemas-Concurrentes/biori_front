import 'dart:async';

import 'package:biori/main_screen/add/constants/add_constants.dart';
import 'package:biori/style/javi_edit_text.dart';
import 'package:biori/style/model/chip_button_model.dart';
import 'package:biori/style/widgets_javi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'add_report_page_viewmodel.dart';

class AddReportPage extends StatefulWidget {
  const AddReportPage({super.key});

  @override
  State<AddReportPage> createState() => _AddReportPageState();
}

class _AddReportPageState extends State<AddReportPage> {
  final widgetsJavi = WidgetsJavi();
  final List<StreamSubscription> subscriptions = [];
  final viewModel = AddReportPageVM();

  List<ChipButtonModel> courses = [];

  bool _isApiCallProcess = false;

  @override
  void initState() {
    super.initState();
    _subscribeAllToViewModel();
    viewModel.loadCourses();
  }

  @override
  Widget build(BuildContext context) {
    var formWidgets = [
      eventTitleEditText(viewModel.onValidateTitle, viewModel.onSavedValTitle),
      descriptionBigEditText(
          viewModel.onValidateDescription, viewModel.onSavedValDescription),
      tagsCheckBoxes(viewModel.onValidateTags, viewModel.onSavedValTags),
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
            key: viewModel.formKey,
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

  eventTitleEditText(Function onValidate, Function onSaved) {
    return JaviForms.inputFieldWidget(
      context,
      "eventTitle",
      "${AppLocalizations.of(context)!.titulo} ${AppLocalizations.of(context)!.report}",
      (onValidateVal) => onValidate(onValidateVal, context),
      (onSavedVal) => onSaved(onSavedVal),
      prefixIcon: const Icon(Icons.title),
    );
  }

  descriptionBigEditText(Function onValidate, Function onSaved) {
    return JaviForms.inputFieldWidget(
        context,
        "eventDescription",
        AppLocalizations.of(context)!.descripcion,
        (onValidateVal) => onValidate(onValidateVal, context),
        (onSavedVal) => onSaved(onSavedVal),
        prefixIcon: const Icon(Icons.description),
        maxLines: null);
  }

  Widget tagsCheckBoxes(Function onValidate, Function onSaved) {
    if (courses.isEmpty) {
      return const CircularProgressIndicator();
    } else {
      return JaviForms.chipsInputFieldWidget(
          context,
          courses, onValidate, (onSavedVal) => onSaved(onSavedVal),
          titleEvent: AppLocalizations.of(context)?.seleccionaGrupos ?? "");
    }
  }

  submitButton(BuildContext context) {
    return JaviForms.submitButton(context, AppLocalizations.of(context)!.send,
        () {
      viewModel.submitButton(context);
    });
  }

  @override
  void dispose() {
    for (var element in subscriptions) {
      element.cancel();
    }
    super.dispose();
  }

  void _subscribeAllToViewModel() {
    subscriptions.add(viewModel.courses.stream.listen((courses) {
      setState(() {
        this.courses = courses;
      });
    }));

    subscriptions.add(viewModel.isApiCallProcess.stream.listen((courses) {
      setState(() {
        _isApiCallProcess = false;
      });
    }));

    subscriptions.add(viewModel.responseDialog.listen((responseDialog) {
      widgetsJavi.showDialogWithText(
          context, responseDialog.title, responseDialog.onPressed,
          icon: responseDialog.icon);
    }));
  }
}
