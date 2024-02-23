import 'package:biori/authentication_screen/login/validation/user_stories/do_request_resend.dart';
import 'package:biori/authentication_screen/login/validation/user_stories/do_validation.dart';
import 'package:biori/style/javi_edit_text.dart';
import 'package:flutter/material.dart';
import 'package:biori/conection_to_backend/authentication_screen/output.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../style/widgets_javi.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ValidationPage extends StatefulWidget {
  const ValidationPage({super.key});

  @override
  State<ValidationPage> createState() => _ValidationPageState();
}

class _ValidationPageState extends State<ValidationPage> {
  bool isApiCallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? validationCode;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: WidgetsJavi().progressHudJavi(
            context,
            isApiCallProcess,
            Form(
              key: globalFormKey,
              child: _validationUI(context),
            )),
      ),
    );
  }

  Widget _validationUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          WidgetsJavi().bioriContainer(context),
          WidgetsJavi().paddedWidget(validationEditText(_onValidateValidationCode),
              topPadding: JaviPaddings.XL),
          WidgetsJavi().paddedWidget(
            JaviForms.submitButton(
              context,
              AppLocalizations.of(context)!.send,
              _submitForm,
            ),
            topPadding: JaviPaddings.XL),

          WidgetsJavi().paddedWidget(
            Text(
              AppLocalizations.of(context)!.spamValidation,
              style: JaviStyle.subcomentarios,
            ),
            topPadding: JaviPaddings.XL,
          ),
          WidgetsJavi().paddedWidget(JaviForms.submitButton(
            context,
            AppLocalizations.of(context)!.resendCode,
            _resendCode,
          fontSize: 12)
          ),
        ],
      ),
    );
  }

  Widget validationEditText(Function onValidate) {
    return JaviForms.inputBaseWidget(
      context,
      "username",
      AppLocalizations.of(context)!.validationHintText,
      onValidate,
      (onSavedVal) => {validationCode = (onSavedVal)},
      prefixIcon: const Icon(Icons.onetwothree_rounded),
      isNumeric: true,
    );
  }



  _onValidateValidationCode(String onValidateVal) {
    if (onValidateVal.isEmpty) {
      return AppLocalizations.of(context)!.validationCodeEmpty;
    }

    return null;
  }

  _submitForm() async {
    if (!globalFormKey.currentState!.validate()) {
      return;
    }
    globalFormKey.currentState!.save();

    _showLoading(true);

    final sharedPrefs = await SharedPreferences.getInstance();


    String? jwt = sharedPrefs.getString('token');

    Output output = await DoValidation().run(validationCode, jwt);
    _showLoading(false);

    if (output == Output.success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Validación completa"),
        ),
      );

      // Enviar a mainpage
    }
    else{
      _errorSesionSnackBar();
    }
  }

  _resendCode() async {
    _showLoading(true);

    final sharedPrefs = await SharedPreferences.getInstance();


    String? jwt = sharedPrefs.getString('token');

    Output output = await DoRequestResend().run(jwt);
    _showLoading(false);

    if (output == Output.success) {
      _showSuccessMessageSnackBar();

      // Enviar a mainpage
    }
    else{
      _errorSesionSnackBar();
    }
  }

  _showLoading(bool showLoading) {
    setState(() {
      isApiCallProcess = showLoading;
    });
  }

  _showSuccessMessageSnackBar(){
    WidgetsJavi().snackbarScaffold(AppLocalizations.of(context)!.codigoEnviado);
  }

  _errorSesionSnackBar() {
    WidgetsJavi().snackbarScaffold(AppLocalizations.of(context)!.validationError);
  }
}
