import 'package:biori/main_screen/add/constants/add_constants.dart';
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
  State<AddEventPage> createState() => _AddEventPageState();}

class _AddEventPageState extends State<AddEventPage> {
  final _formKey = GlobalKey<FormState>();
  final widgetsJavi = WidgetsJavi();

  String? titulo;
  String? descripcion;
  String? categoria;
  String? localizacion;
  List<DateTime> datesFromEvent = [];

  @override
  Widget build(BuildContext context) {
    var formWidgets = [
      eventTitleEditText(_onValidateTitle),
      descriptionBigEditText(_onValidateDescription),
      categoryChooser(_onValidateCategory),

    ];

    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: AddConstants().eventTag,
          child: const Text('Add Event'),
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
              children: formWidgets.map((widget) => widgetsJavi.paddedWidget(widget)).toList(),
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
          (onSavedVal) => { titulo = onSavedVal},
      prefixIcon: const Icon(Icons.title),

    );
  }

  descriptionBigEditText(Function onValidate) {
    return JaviForms.inputFieldWidget(context, "eventDescription",
        AppLocalizations.of(context)!.descripcion,
        onValidate, (onSavedVal) => {descripcion = onSavedVal},
        prefixIcon: const Icon(Icons.description),
        maxLines: null);
  }

  categoryChooser(Function onValidateVal) {
    return JaviForms.dropDownMenu(context, TextEditingController(), CategoryLabel.actividad, CategoryLabel.values,
            (onSavedVal) => {categoria = onSavedVal}, _onValidateCategory);


  }

  _onValidateTitle(String onValidateVal){

  }
  _onValidateDescription(String onValidateVal){

  }


}