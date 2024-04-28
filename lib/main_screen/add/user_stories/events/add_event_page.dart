import 'package:biori/main_screen/add/constants/add_constants.dart';
import 'package:biori/main_screen/add/user_stories/events/user_stories/add_event.dart';
import 'package:biori/main_screen/home/user_stories/releases/releases_widgets/button_widgets/model/categories_button_model.dart';
import 'package:biori/style/javi_edit_text.dart';
import 'package:biori/style/model/chip_button_model.dart';
import 'package:biori/style/widgets_javi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum CategoryLabel {
  actividad("ACTIVIDAD"),
  gestion("GESTION"),
  clase("CLASE");

  const CategoryLabel(this.label);

  final String label;
}

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final _formKey = GlobalKey<FormState>();
  final widgetsJavi = WidgetsJavi();

  String? titulo;
  String? descripcion;
  String? categoria;
  String? localizacion;
  List<Widget> widgets = [];
  List<String?> fechasEvento = [];
  String? fechaFinInscripcion;
  List<ChipButtonModel> tagsButtons = [];
  List<TagsButtonsModel> allTagsButtons = [];

  bool _isCheckedForInscriptionDate = false;

  @override
  void initState() {
    super.initState();
    allTagsButtons.addAll([
      TagsButtonsModel(name: "tag1", id: 1),
      TagsButtonsModel(name: "tag2", id: 2),
      TagsButtonsModel(name: "tag3", id: 3),
      TagsButtonsModel(name: "tag4", id: 4),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    if (widgets.isEmpty) {
      widgets.add(
          addDate(TextEditingController(), _onValidateDates, _onSavedValDates));
    }

    var formWidgets = [
      eventTitleEditText(_onValidateTitle),
      descriptionBigEditText(_onValidateDescription),
      categoryChooser(_onValidateCategory),
      tagsCheckBoxes(_onValidateTags),
      addDatesIntoWidget(),
      locationEditText(_onValidateLocation),
      addCheckbox(AppLocalizations.of(context)!.necesitaFechaInscripcion,
          _onValidateInscriptionDate),
      submitButton(context),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: AddConstants().advertisementTag,
          child: Text(
              "${AppLocalizations.of(context)!.anadir} ${AppLocalizations.of(context)!.evento}"),
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
      "${AppLocalizations.of(context)!.titulo} ${AppLocalizations.of(context)!.evento}",
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

  categoryChooser(Function onValidateVal) {
    return JaviForms.dropDownMenu(
        context,
        TextEditingController(),
        CategoryLabel.actividad,
        CategoryLabel.values,
        (onSavedVal) => {categoria = onSavedVal},
        _onValidateCategory,
        hintText: AppLocalizations.of(context)!.selectOne);
  }

  tagsCheckBoxes(Function onValidate) {
    return JaviForms.chipsInputFieldWidget(context, allTagsButtons, onValidate,
        (onSavedVal) => {tagsButtons = onSavedVal},
        titleEvent: AppLocalizations.of(context)!.seleccionaEtiquetas);
  }

  TextFormField addDate(
      TextEditingController controller, Function onValidate, onSavedVal) {
    return JaviForms.selectDateTime(
      context,
      controller,
      onValidate,
      onSavedVal,
      prefixIcon: const Icon(Icons.calendar_today),
      hintText: "dd/mm/yyyy hh:mm:ss",
      needTime: true,
    );
  }

  void addWidgetIfLastIsFilled() {
    if (widgets.isNotEmpty) {
      TextFormField lastWidget = widgets.last as TextFormField;
      if (lastWidget.controller!.text.isNotEmpty) {
        widgets.add(addDate(
            TextEditingController(), _onValidateDates, _onSavedValDates));
      }
    }
    setState(() {});
  }

  addDatesIntoWidget() {
    return Container(
      decoration: JaviInputDecorators().boxDecorator(context),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: JaviPaddings.M),
              child: Text(
                AppLocalizations.of(context)!.fechasEvento,
                style: JaviStyle.subtitulo,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: JaviPaddings.M),
              child: Column(
                children: widgets,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: JaviPaddings.M),
              child: ElevatedButton(
                onPressed: addWidgetIfLastIsFilled,
                child: Text(
                    "${AppLocalizations.of(context)!.anadir} ${AppLocalizations.of(context)!.fecha}"),
              ),
            )
          ],
        ),
      ),
    );
  }

  locationEditText(Function onValidate) {
    return JaviForms.inputFieldWidget(
      context,
      "eventLocation",
      AppLocalizations.of(context)!.localizacion,
      onValidate,
      (onSavedVal) => {localizacion = onSavedVal},
      prefixIcon: const Icon(Icons.location_on),
    );
  }

  addCheckbox(String title, Function onValidate) {
    return JaviForms().addCheckboxWithResponsiveWidget(
        context,
        title,
        _isCheckedForInscriptionDate,
        addDate(TextEditingController(), _onValidateDates,
            _onSavedValInscriptionDate), () {
      setState(() {
        _isCheckedForInscriptionDate = !_isCheckedForInscriptionDate;
      });
    });
  }

  submitButton(BuildContext context) {
    return JaviForms.submitButton(context, AppLocalizations.of(context)!.send,
        () {
        if (!_formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Evento creado mal!")));
        }

        _formKey.currentState!.save();

        AddEvent()
            .run(titulo!, descripcion!, categoria!, localizacion!, fechasEvento,
                tagsButtons)
            .then((value) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Evento creado!")));
        });
      },
    );
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

  _onValidateCategory(String? onValidateVal) {
    if (onValidateVal == null || onValidateVal.isEmpty) {
      return AppLocalizations.of(context)!.mustSelectOne;
    }
    return null;
  }

  String? _onValidateTags(List<ChipButtonModel>? onValidateVal) {
    return (onValidateVal == null || onValidateVal.isEmpty)
        ? AppLocalizations.of(context)!.mustSelectOneOrMore
        : null;
  }

  _onValidateDates(String? onValidate) {
    if (onValidate == null || onValidate.isEmpty) {
      return AppLocalizations.of(context)!.mustSelectOne;
    }
    return null;
  }

  _onValidateLocation(String? onValidate) {
    if (onValidate == null || onValidate.isEmpty) {
      return "Localization ${AppLocalizations.of(context)!.cannotBeEmpty}";
    }
    return null;
  }

  _onValidateInscriptionDate(String? onValidate) {
    if (_isCheckedForInscriptionDate &&
        (onValidate == null || onValidate.isEmpty)) {
      return AppLocalizations.of(context)!.mustSelectOne;
    }
    return null;
  }

  _onSavedValDates(String? onSavedVal) {
    fechasEvento.add(JaviForms().stringSpainFormatToBdFormat(onSavedVal!));
  }

  _onSavedValInscriptionDate(String? onSavedVal) {
    fechaFinInscripcion =
        (JaviForms().stringSpainFormatToBdFormat(onSavedVal!));
  }
}
