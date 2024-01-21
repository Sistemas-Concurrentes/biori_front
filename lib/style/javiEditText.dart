import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class JaviForms {
  static Widget inputBaseWidget(BuildContext context, String keyName,
      String hintText, Function onValidate, Function onSaved, {
        Icon? prefixIcon, Widget? suffixIcon, bool obscureText = false, isNumeric = false
  }) {

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

  static Widget submitButton (BuildContext context, String keyName, Function action) {
    return FormHelper.submitButton(
      keyName,
      action,
      btnColor: Theme.of(context).primaryColor,
      txtColor: Colors.white,
      borderColor: Theme.of(context).primaryColor,
    );
  }

  static Widget introducirFecha(BuildContext context, TextEditingController controller, String label) {
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
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          prefixIcon: Icon(Icons.calendar_today),
          fillColor: Theme.of(context).scaffoldBackgroundColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),

        ),
        onTap: ()  {
          _selectDate(context, controller);
        },
        readOnly: true,
      )
    );
  }

  static Future _selectDate(BuildContext context, TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100)
    );

    if(picked != null) {
      controller.text = picked.toString().split(" ")[0];
    }


  }

}




class JaviPaddings{
  static const double S = 4;
  static const double M = 8;
  static const double L = 12;
  static const double XL = 20;
}

class JaviStyle{
  static const TextStyle granada1 = TextStyle(
    fontSize: 14,
    color: Colors.white,
  );

  static const TextStyle subcomentarios = TextStyle(
    fontSize: 14,
    color: Colors.grey,
  );

  static const TextStyle url = TextStyle(
    color: Colors.black,
    fontSize: 14.0,
    decoration: TextDecoration.underline,
  );

  static const TextStyle titulo = TextStyle(
  fontSize: 28.0, fontWeight: FontWeight.bold,
  );

}
