import 'dart:async';

import 'package:biori/main_screen/add/constants/add_constants.dart';
import 'package:biori/style/javi_edit_text.dart';
import 'package:biori/style/widgets_javi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'add_advertisement_page_mv.dart';

class AddAdvertisementPage extends StatefulWidget {
  const AddAdvertisementPage({super.key});

  @override
  State<AddAdvertisementPage> createState() => _AddAdvertisementPageState();
}

class _AddAdvertisementPageState extends State<AddAdvertisementPage> {
  final widgetsJavi = WidgetsJavi();
  final List<StreamSubscription> subscriptions = [];
  final viewModel = AddAdvertisementPageVM();

  @override
  void initState() {
    super.initState();
    _subscribeAllToViewModel();
    viewModel.loadGroups();
  }

  @override
  Widget build(BuildContext context) {
    var formWidgets = [
      eventTitleEditText(viewModel.onValidateTitle, viewModel.onSavedValTitle),
      descriptionBigEditText(
          viewModel.onValidateDescription, viewModel.onSavedValDescription),
      groupsCheckBoxes(viewModel.onValidateTags, viewModel.onSavedValTags),
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
        child: WidgetsJavi().progressHudJavi(
          context,
          viewModel.isApiCallProcess,
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
      "${AppLocalizations.of(context)!.titulo} ${AppLocalizations.of(context)!.advertisement}",
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

  groupsCheckBoxes(Function onValidate, Function onSaved) {
    if (viewModel.allGroups.isEmpty) {
      return const CircularProgressIndicator();
    } else {
      return JaviForms.chipsInputFieldWidget(context, viewModel.allGroups,
          onValidate, (onSavedVal) => onSaved(onSavedVal),
          titleEvent: AppLocalizations.of(context)?.seleccionaGrupos ?? "");
    }
  }

  submitButton(BuildContext context) {
    return JaviForms.submitButton(context, AppLocalizations.of(context)!.send,
        () async {
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
    subscriptions.add(viewModel.reload.stream.listen((response) {
      setState(() {});
    }));

    subscriptions.add(viewModel.responseDialog.listen((responseDialog) {
      widgetsJavi.showDialogWithText(
          context, responseDialog.title, responseDialog.onPressed,
          icon: responseDialog.icon);
    }));
  }
}
