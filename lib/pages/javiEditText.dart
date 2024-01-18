import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class JaviForms {
  static Widget inputBaseWidget(BuildContext context, String keyName,
      String hintText, Function onValidate, Function onSaved, {
        Icon? prefixIcon, Widget? suffixIcon, bool obscureText = false
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
    );
  }
}

class JaviPaddings{
  static const S = 4;
  static const M = 8;
  static const L = 12;
  static const XL = 16;
}

class JaviStyle{
  static const TextStyle granada1 = TextStyle(
    fontSize: 14,
    color: Colors.white,
  );

  static const TextStyle url = TextStyle(
    color: Colors.black,
    fontSize: 14.0,
    decoration: TextDecoration.underline,
  );

}
