import 'package:biori/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class JaviForms {
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
    List<String> date = spainFormat.split("/");
    return "${date[2]}-${date[1]}-${date[0]}";
  }
}

class JaviPaddings {
  static const double S = 4;
  static const double M = 8;
  static const double L = 12;
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
    fontSize: 28.0,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle tituloEvento = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Pallete.secondaryColor,
  );

  static const TextStyle descripcion = TextStyle(
    fontSize: 15.0,
    color: Pallete.negro,
  );
  static const TextStyle informacionExtraCards = TextStyle(
    fontSize: 14.0,
    color: Pallete.secondaryColor,
  );
}
