import 'package:biori/main_screen/add/constants/add_constants.dart';
import 'package:biori/main_screen/add/user_stories/event/events_group/user_stories/add_event_group.dart';
import 'package:biori/main_screen/add/user_stories/event/validators/event_validators.dart';
import 'package:biori/main_screen/home/widget/releases_widgets/button_widgets/model/categories_button_model.dart';
import 'package:biori/router/custom_router.dart';
import 'package:biori/style/javi_edit_text.dart';
import 'package:biori/style/model/chip_button_model.dart';
import 'package:biori/style/widgets_javi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../event_common_widgets.dart';

class AddEventGroupPage extends StatefulWidget {
  const AddEventGroupPage({super.key});

  @override
  State<AddEventGroupPage> createState() => _AddEventGroupPageState();
}

class _AddEventGroupPageState extends State<AddEventGroupPage> {
  final _formKey = GlobalKey<FormState>();
  final widgetsJavi = WidgetsJavi();

  String titulo = "";
  String descripcion = "";
  String categoria = "";
  String localizacion = "";
  List<Widget> widgets = [];
  List<String> fechasEvento = [];
  String? fechaFinInscripcion;
  List<ChipButtonModel> groupsChips = [];
  List<TagsButtonsModel> allTagsButtons = [];

  bool _isCheckedForInscriptionDate = false;
  bool _isApiCallProcess = false;
  final TextEditingController categoryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    allTagsButtons.addAll([
      TagsButtonsModel(name: "Group1", id: 1),
      TagsButtonsModel(name: "Group2", id: 2),
      TagsButtonsModel(name: "Group3", id: 3),
      TagsButtonsModel(name: "Group4", id: 4),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    if (widgets.isEmpty) {
      widgets.add(EventCommonWidgets().addDate(
          TextEditingController(), context, onValidateDates, _onSavedValDates));
    }

    var formWidgets = [
      EventCommonWidgets().eventTitleEditText(
          context, onValidateTitle, (onSavedVal) => {titulo = onSavedVal}),
      EventCommonWidgets().descriptionBigEditText(context,
          onValidateDescription, (onSavedVal) => {descripcion = onSavedVal}),
      EventCommonWidgets().categoryChooser(context, onValidateCategory,
          (onSavedVal) => {categoria = onSavedVal}, categoryController),
      groupsCheckBoxes(_onValidateTags),
      EventCommonWidgets().addDatesIntoWidget(context, widgets, () {
        setState(() {});
      }, onValidateDates, _onSavedValDates),
      EventCommonWidgets().locationEditText(context, onValidateLocation,
          (onSavedVal) => {localizacion = onSavedVal}),
      EventCommonWidgets().addCheckbox(
          context,
          AppLocalizations.of(context)!.necesitaFechaInscripcion,
          onValidateInscriptionDate,
          _onSavedValInscriptionDate,
          _isCheckedForInscriptionDate, () {
        setState(() {
          _isCheckedForInscriptionDate = !_isCheckedForInscriptionDate;
        });
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

  groupsCheckBoxes(Function onValidate) {
    return JaviForms.chipsInputFieldWidget(context, allTagsButtons, onValidate,
        (onSavedVal) => {groupsChips = onSavedVal},
        titleEvent: AppLocalizations.of(context)!.seleccionaEtiquetas);
  }

  submitButton(BuildContext context) {
    return JaviForms.submitButton(context, AppLocalizations.of(context)!.send,
        () async {
      if (!_formKey.currentState!.validate()) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(AppLocalizations.of(context)!.errorForm)));
        return;
      }
      _showLoading(false);
      _formKey.currentState?.save();

      AddEventGroupOutput addEventOutput = await AddEventGroup().run(
          titulo,
          descripcion,
          categoria,
          localizacion,
          fechasEvento,
          groupsChips,
          fechaFinInscripcion);

      fechasEvento = [];
      String titleDialog = "";
      Icon? iconDialog;
      Function onPressed = () {
        CustomRouter.router.pop();
      };

      if (addEventOutput == AddEventGroupOutput.created) {
        titleDialog = context.mounted
            ? AppLocalizations.of(context)?.eventoCreado ?? ""
            : "";
        iconDialog = const Icon(Icons.check);
      } else if (addEventOutput == AddEventGroupOutput.forbidden) {
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
      _showLoading(false);

      if (context.mounted) {
        widgetsJavi.showDialogWithText(context, titleDialog, onPressed,
            icon: iconDialog);
      }
    });
  }

  String? _onValidateTags(List<ChipButtonModel>? onValidateVal) {
    return (onValidateVal == null || onValidateVal.isEmpty)
        ? AppLocalizations.of(context)!.mustSelectOneOrMore
        : null;
  }

  _onSavedValDates(String? onSavedVal) {
    fechasEvento.add(JaviForms().stringSpainFormatToBdFormat(onSavedVal!));
  }

  _onSavedValInscriptionDate(String? onSavedVal) {
    fechaFinInscripcion =
        (JaviForms().stringSpainFormatToBdFormat(onSavedVal!));
  }

  _showLoading(bool showLoading) {
    setState(() {
      _isApiCallProcess = showLoading;
    });
  }
}
