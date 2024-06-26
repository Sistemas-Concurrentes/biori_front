import 'package:biori/style/model/chip_button_model.dart';
import 'package:biori/style/widgets_javi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class JaviForms {
  static const double WIDTH_ERROR = 4;
  static const double WIDTH_NORMAL = 1;
  static const double WIDTH_FOCUS = 3;

  @Deprecated("Usa inputFieldWidget")
  static Widget inputBaseWidget(BuildContext context, String keyName,
      String hintText, Function onValidate, Function onSaved,
      {Icon? prefixIcon,
      Widget? suffixIcon,
      bool obscureText = false,
      isNumeric = false}) {
    return FormHelper.inputFieldWidget(
      context,
      keyName,
      hintText,
      onValidate,
      onSaved,
      borderFocusColor: Theme.of(context).primaryColor,
      prefixIconColor: Theme.of(context).primaryColor,
      borderColor: Theme.of(context).primaryColor,
      borderRadius: 10,
      showPrefixIcon: prefixIcon != null,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      obscureText: obscureText,
      hintColor: Theme.of(context).primaryColor,
      textColor: Theme.of(context).primaryColor,
      isNumeric: isNumeric,
    );
  }

  static Widget inputFieldWidget(
    BuildContext context,
    String keyName,
    String hintText,
    Function onValidate,
    Function onSaved, {
    Icon? prefixIcon,
    Widget? suffixIcon,
    bool obscureText = false,
    maxLines = 1,
    bool isNumeric = false,
  }) {
    return TextFormField(
      maxLines: maxLines,
      validator: (val) {
        return onValidate(val!);
      },
      onSaved: (val) {
        onSaved(val);
      },
      decoration: JaviInputDecorators().inputDecorationBiori(context, hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          obscureText: obscureText),
      keyboardType: isNumeric ? TextInputType.number : null,
    );
  }

  static Widget submitButton(
      BuildContext context, String keyName, Function action,
      {double fontSize = 16}) {
    return ElevatedButton(
      onPressed: () {
        action();
      },
      child: Text(
        keyName,
        style: TextStyle(
          fontSize: fontSize,
        ),
      ),
    );
  }

  @Deprecated("Usa selectDateTime")
  static Widget introducirFecha(
      BuildContext context,
      TextEditingController controller,
      String label,
      Function onValidate,
      Function onSaved) {
    double paddingLeft = 20;
    double paddingRight = 20;
    double paddingTop = 0;
    double paddingBottom = 0;

    return Padding(
        padding: EdgeInsets.only(
          left: paddingLeft,
          right: paddingRight,
          top: paddingTop,
          bottom: paddingBottom,
        ),
        child: TextFormField(
          validator: (val) {
            return onValidate(val);
          },
          onSaved: (val) {
            onSaved(val);
          },
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            filled: true,
            fillColor: Theme.of(context).dialogBackgroundColor,
            prefixIcon: const Icon(Icons.calendar_today),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
          ),
          onTap: () {
            _selectDate(context, controller);
          },
          readOnly: true,
        ));
  }

  static Widget dropDownMenu(
      BuildContext context,
      TextEditingController controller,
      List enumValues,
      Function onSaved,
      Function onValidate,
      {enableSearch = false,
      hintText = ""}) {
    return FormField(
      onSaved: (val) {
        onSaved(val);
      },
      validator: (val) {
        return onValidate(val);
      },
      builder: (FormFieldState<dynamic> state) => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: DropdownMenu(
          errorText: state.errorText,
          hintText: hintText,
          controller: controller,
          leadingIcon: const Icon(Icons.category),
          inputDecorationTheme: JaviInputDecorators().inputDecorationThemeBiori(context, ""),
          dropdownMenuEntries:
              enumValues.map<DropdownMenuEntry<dynamic>>((value) {
            return DropdownMenuEntry(
              value: value,
              label: value.label,
            );
          }).toList(),
          onSelected: (initialSelection) {
            state.didChange(initialSelection.label);
          },
        ),
      ),
    );
  }

  @Deprecated("Usa selectDateTime")
  static Future _selectDate(
      BuildContext context, TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      controller.text = _dateToSpainFormat(picked);
    }
  }

  static String _dateToSpainFormat(DateTime date) {
    var dateString = date.toString().split(" ");
    var finalDate = dateString[0].split("-");
    return "${finalDate[2]}/${finalDate[1]}/${finalDate[0]}";
  }

  String stringSpainFormatToBdFormat(String spainFormat) {
    List<String> dateAndTime = spainFormat.split(" ");
    if (dateAndTime.isEmpty) {
      return "";
    }

    if (dateAndTime.length == 1) {
      List<String> date = spainFormat.split("/");
      return "${date[2]}-${date[1]}-${date[0]}";
    } else {
      List<String> date = dateAndTime[0].split("/");
      return "${date[2]}-${date[1]}-${date[0]} ${dateAndTime[1]}";
    }
  }

  static chipsInputFieldWidget(BuildContext context,
    List<ChipButtonModel> chips,
    Function onValidate,
    Function onSaved, {
    titleEvent = "",
  }) {
    List<ChipButtonModel> selectedChips = [];
    List<ChipButtonModel> filteredChips = chips;
    SearchController searchController = SearchController();

    return FormField(
      onSaved: (val) {
        onSaved(val);
      },
      validator: (onValidateVal) => onValidate(onValidateVal, context),
      builder: (FormFieldState<dynamic> state) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: state.hasError ? Theme.of(context).colorScheme.error : Theme.of(context).primaryColor,
              width: state.hasError ? WIDTH_ERROR : WIDTH_NORMAL
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(JaviPaddings.M),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titleEvent,
                  style: JaviStyle.subtitulo,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      0, JaviPaddings.M, 0, JaviPaddings.M),
                  child: WidgetsJavi().mySearchBar(
                    (value) {
                      if (value.isEmpty) {
                        filteredChips = chips;
                      } else {
                        filteredChips = chips
                            .where((element) => element.name
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                      }
                      state.didChange(filteredChips);
                    },
                    searchController,
                    leadingIcon: const Icon(Icons.search),
                    trailingWidget: <Widget>[
                      if (searchController.text.isNotEmpty)
                        IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            searchController.clear();
                            filteredChips = chips;
                            state.didChange(filteredChips);
                          },
                        ),
                    ],
                    hintText: AppLocalizations.of(context)?.buscar ?? "",
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: WidgetsJavi().filterChipForTags(
                    filteredChips,
                    (actualChip) {
                      actualChip.isFollowed
                          ? selectedChips.remove(actualChip)
                          : selectedChips.add(actualChip);
                      actualChip.isFollowed = !actualChip.isFollowed;
                      state.didChange(selectedChips);
                    },
                  ),
                ),
                if (state.hasError) Text(state.errorText ?? '', style: TextStyle(color: Theme.of(context).colorScheme.error),),
              ],
            ),
          ),
        );
      },
    );
  }

  static TextFormField selectDateTime(
    BuildContext context,
    TextEditingController controller,
    Function onValidate,
    Function onSaved, {
    bool needTime = false,
    String hintText = "",
    Icon? prefixIcon,
  }) {
    return TextFormField(
      validator: (val) {
        return onValidate(val);
      },
      onSaved: (val) {
        onSaved(val);
      },
      controller: controller,
      decoration: JaviInputDecorators().inputDecorationBiori(
        context,
        hintText,
        prefixIcon: prefixIcon,
      ),
      onTap: () {
        _showDateTimePicker(context, controller, needTime);
      },
      readOnly: true,
    );
  }

  static _showDateTimePicker(BuildContext context,
      TextEditingController controller, bool needTime) async {
    String dateString = "";
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    );

    if (picked != null) {
      dateString = _dateToSpainFormat(picked);
    }

    if (context.mounted && needTime) {
      TextEditingController timeController = TextEditingController();
      await _selectTime(context, timeController);
      dateString += " ${timeController.text}";
    }

    controller.text = dateString;
  }

  static _selectTime(
      BuildContext context, TextEditingController controller) async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 0, minute: 0),
    );

    if (time != null) {
      controller.text =
          "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:00";
    }
  }

  Widget addCheckboxWithResponsiveWidget(BuildContext context, String title,
      bool checked, Widget newWidget, Function onChanged) {
    return Container(
      decoration: JaviInputDecorators().boxDecorator(context),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CheckboxListTile(
              value: checked,
              title: Text(title),
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: const EdgeInsets.all(0),
              onChanged: (bool? newValue) {
                onChanged();
              },
            ),
            if (checked) newWidget,
          ],
        ),
      ),
    );
  }
}

class JaviPaddings {
  static const double S = 4;
  static const double M = 8;
  static const double L = 16;
  static const double XL = 20;
}

class JaviStyle {
  static const TextStyle granada1 = TextStyle(
    fontSize: 14,
    color: Colors.white,
  );

  static const TextStyle subcomentarios = TextStyle(
    fontSize: 14,
    color: Colors.grey,
  );

  static const TextStyle url = TextStyle(
    fontSize: 14.0,
    decoration: TextDecoration.underline,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle titulo = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: Color(4287254562),
  );

  static const TextStyle tituloEvento = TextStyle(
    fontSize: 21.0,
    fontWeight: FontWeight.w800,
    color: Color(4287254562),
  );

  static const TextStyle subtitulo = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Color(4279050240),
  );

  static const TextStyle descripcion = TextStyle(
    fontSize: 16.0,
    color: Color(4280424981),
    fontWeight: FontWeight.w500,
  );
  static const TextStyle informacionExtraCards = TextStyle(
    fontSize: 18.0,
    color: Color(4283000622),
    fontWeight: FontWeight.w600,
  );
}

class JaviInputDecorators{
  _inputBorderBiori(BuildContext context, borderColor, borderWith) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(color: borderColor, width: borderWith),
    );
  }

  _inputErrorBorderBiori(BuildContext context) {
    return _inputBorderBiori(context, Theme.of(context).colorScheme.error, JaviForms.WIDTH_ERROR);
  }

  _inputFocusBorderBiori(BuildContext context) {
    return _inputBorderBiori(context, Theme.of(context).primaryColor, JaviForms.WIDTH_FOCUS);
  }

  _inputNormalBorderBiori(BuildContext context) {
    return _inputBorderBiori(context, Theme.of(context).primaryColor, JaviForms.WIDTH_NORMAL);
  }


  InputDecoration inputDecorationBiori(BuildContext context, String hintText,
      {Widget? suffixIcon, Icon? prefixIcon, bool obscureText = false}) {
    return InputDecoration(
      filled: true,
      fillColor: Theme.of(context).dialogBackgroundColor,
      enabledBorder: _inputNormalBorderBiori(context),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: Theme.of(context).primaryColor, width: JaviForms.WIDTH_NORMAL),
      ),
      focusedBorder: _inputFocusBorderBiori(context),
      hintText: hintText,
      errorBorder: _inputErrorBorderBiori(context),
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      hintStyle: TextStyle(
        color: Theme.of(context).hintColor,
      ),
    );
  }

  InputDecorationTheme inputDecorationThemeBiori(BuildContext context, String hintText,
      {Widget? suffixIcon, Icon? prefixIcon, bool obscureText = false}) {
    return InputDecorationTheme(
      filled: true,
      fillColor: Theme
          .of(context)
          .dialogBackgroundColor,
      enabledBorder: _inputNormalBorderBiori(context),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(color: Theme
            .of(context)
            .primaryColor, width: 1),
      ),
      focusedBorder: _inputFocusBorderBiori(context),

      hintStyle: TextStyle(
        color: Theme
            .of(context)
            .hintColor,
      ),

      errorBorder: _inputErrorBorderBiori(context),
    );
  }

  BoxDecoration boxDecorator(BuildContext context) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Theme.of(context).primaryColor),
    );
  }
}
