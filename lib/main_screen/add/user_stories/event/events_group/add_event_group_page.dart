import 'dart:async';

import 'package:biori/main_screen/add/constants/add_constants.dart';
import 'package:biori/style/javi_edit_text.dart';
import 'package:biori/style/widgets_javi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../event_common_widgets.dart';
import 'add_event_group_page_mv.dart';

class AddEventGroupPage extends StatefulWidget {
  const AddEventGroupPage({super.key});

  @override
  State<AddEventGroupPage> createState() => _AddEventGroupPageState();
}

class _AddEventGroupPageState extends State<AddEventGroupPage> {
  final widgetsJavi = WidgetsJavi();
  final viewModel = AddEventGroupPageVM();
  final List<StreamSubscription> subscriptions = [];
  final EventCommonWidgets eventWidgets = EventCommonWidgets();

  List<Widget> widgets = [];

  bool _isCheckedForInscriptionDate = false;
  bool _isApiCallProcess = false;
  final TextEditingController categoryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _subscribeAllToViewModel();

    viewModel.loadTags();
    viewModel.loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    if (widgets.isEmpty) {
      widgets.add(eventWidgets.addDate(TextEditingController(), context,
          viewModel.onValidateDates, viewModel.onSavedValDates));
    }

    var formWidgets = [
      eventWidgets.eventTitleEditText(
          context, viewModel.onValidateTitle, viewModel.onSavedValTitle),
      eventWidgets.descriptionBigEditText(context,
          viewModel.onValidateDescription, viewModel.onSavedValDescription),
      eventWidgets.categoryChooser(
          context,
          viewModel.onValidateCategory,
          viewModel.onSavedValCategory,
          categoryController,
          viewModel.categories),
      groupsCheckBoxes(viewModel.onValidateTags, viewModel.onSavedValTags),
      eventWidgets.addDatesIntoWidget(context, widgets, () {
        setState(() {});
      }, viewModel.onValidateDates, viewModel.onSavedValDates),
      eventWidgets.locationEditText(
          context, viewModel.onValidateLocation, viewModel.onSavedValLocation),
      eventWidgets.addCheckbox(
          context,
          AppLocalizations.of(context)!.necesitaFechaInscripcion,
          viewModel.onValidateInscriptionDate,
          viewModel.onSavedValInscriptionDate,
          _isCheckedForInscriptionDate, () {
        viewModel.onCheckedInscriptionDate(_isCheckedForInscriptionDate);
      }),
      submitButton(context),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: AddConstants().eventGroupTag,
          child: Text(
              "${AppLocalizations.of(context)!.anadir} ${AppLocalizations.of(context)!.evento}"),
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

  groupsCheckBoxes(Function onValidate, Function onSavedVal) {
    return JaviForms.chipsInputFieldWidget(
        context, viewModel.allGroups, onValidate, onSavedVal,
        titleEvent: AppLocalizations.of(context)!.seleccionaEtiquetas);
  }

  submitButton(BuildContext context) {
    return JaviForms.submitButton(context, AppLocalizations.of(context)!.send,
        () async {
      viewModel.submitButton(context);
    });
  }

  void _subscribeAllToViewModel() {
    subscriptions
        .add(viewModel.isApiCallProcess.stream.listen((isApiCallProcess) {
      setState(() {
        _isApiCallProcess = isApiCallProcess;
      });
    }));

    subscriptions.add(viewModel.responseDialog.listen((responseDialog) {
      widgetsJavi.showDialogWithText(
          context, responseDialog.title, responseDialog.onPressed,
          icon: responseDialog.icon);
    }));

    subscriptions.add(viewModel.isChecked.stream.listen((check) {
      setState(() {
        _isCheckedForInscriptionDate = check;
      });
    }));
  }

  @override
  void dispose() {
    for (var element in subscriptions) {
      element.cancel();
    }
    super.dispose();
  }
}
