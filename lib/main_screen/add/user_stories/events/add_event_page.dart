import 'package:biori/main_screen/add/constants/add_constants.dart';
import 'package:biori/main_screen/home/user_stories/releases/releases_widgets/button_widgets/model/categories_button_model.dart';
import 'package:biori/style/javi_edit_text.dart';
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
  List<DateTime> datesFromEvent = [];
  List<TagsButtonsModel> tagsButtons = [];

  @override
  Widget build(BuildContext context) {
    if (widgets.isEmpty) {
      widgets.add(addDate(TextEditingController(), _onValidateDates));
    }

    var formWidgets = [
      eventTitleEditText(_onValidateTitle),
      descriptionBigEditText(_onValidateDescription),
      categoryChooser(_onValidateCategory),
      tagsCheckBoxes(_onValidateTags),
      addDatesIntoWidget(),
      submitButton(context),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: AddConstants().eventTag,
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
        _onValidateCategory);
  }

  tagsCheckBoxes(Function onValidate) {
    List<TagsButtonsModel> myChips = [];
    myChips.addAll([
      TagsButtonsModel(name: "tag1", id: 1),
      TagsButtonsModel(name: "tag2", id: 2),
      TagsButtonsModel(name: "tag3", id: 3),
      TagsButtonsModel(name: "tag4", id: 4),
    ]);
    return JaviForms.chipsInputFieldWidget(context, myChips, onValidate,
        (onSavedVal) => {tagsButtons = onSavedVal});
  }

  TextFormField addDate(TextEditingController controller, Function onValidate) {
    return JaviForms.selectDateTime(
      context,
      controller,
      onValidate,
      (onSavedVal) => {
        fechasEvento.add(JaviForms().stringSpainFormatToBdFormat(onSavedVal)),
      },
      prefixIcon: const Icon(Icons.calendar_today),
      hintText: "dd/mm/yyyy hh:mm:ss",
      needTime: true,
    );
  }

  void addWidgetIfLastIsFilled() {
    if (widgets.isNotEmpty) {
      TextFormField lastWidget = widgets.last as TextFormField;
      if (lastWidget.controller!.text.isNotEmpty) {
        widgets.add(addDate(TextEditingController(), _onValidateDates));
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
          children: [
            const Padding(
              padding: EdgeInsets.only(top: JaviPaddings.M),
              child: Text(
                "Fechas",
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
                child: const Text("Añadir fecha"),
              ),
            )
          ],
        ),
      ),
    );
  }

  submitButton(BuildContext context) {
    return JaviForms.submitButton(context, AppLocalizations.of(context)!.send,
        () {
      if (_formKey.currentState!.validate()) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Evento creado correctamente!")));
        _formKey.currentState!.save();
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Evento creado mal!")));
      }
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

  _onValidateCategory(String? onValidateVal) {
    if (onValidateVal == null || onValidateVal.isEmpty) {
      return AppLocalizations.of(context)!.mustSelectOne;
    }
    return null;
  }

  String? _onValidateTags(List<TagsButtonsModel>? onValidateVal) {
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
}
