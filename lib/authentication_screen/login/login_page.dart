import 'package:biori/authentication_screen/login/user_stories/do_login.dart';
import 'package:biori/router/route_constants.dart';
import 'package:biori/style/javi_edit_text.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:biori/conection_to_backend/output.dart';


import '../../style/widgets_javi.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isApiCallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? username;
  String? password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: ProgressHUD(
          inAsyncCall: isApiCallProcess,
          opacity: 0.3,
          key: UniqueKey(),
          child: Form(
            key: globalFormKey,
            child: _loginUI(context),
          ),
        ),
      ),
    );
  }

  Widget _loginUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          WidgetsJavi().bioriContainer(context),

          Padding(
            padding: const EdgeInsets.only(
              top: JaviPaddings.XL,
            ),
            child: usernameEditText(_onValidateUsername),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: JaviPaddings.XL,
            ),
            child:passwordEditText(_onValidatePassword)
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: WidgetsJavi().informacionSecundaria(context, AppLocalizations.of(context)!.olvidadoContrasena,
                AppLocalizations.of(context)!.recuperar, registerRoute),
          ),

          Center(
            child: JaviForms.submitButton(
              context,
              "Login",
              _submitForm,
            ),
          ),
          const SizedBox(
            height: JaviPaddings.L,
          ),
          WidgetsJavi().informacionSecundaria(context, AppLocalizations.of(context)!.sinCuenta,
              AppLocalizations.of(context)!.registrate, registerRoute),
        ],
      ),
    );
  }

  Widget usernameEditText(Function onValidate) {
    return JaviForms.inputBaseWidget(
      context,
      "username",
      AppLocalizations.of(context)!.emailCorporativo,
      onValidate,
      (onSavedVal) => {username = onSavedVal},
      prefixIcon: const Icon(Icons.email),
    );
  }

  Widget passwordEditText(Function onValidate) {
    return JaviForms.inputBaseWidget(
      context,
      "password",
      AppLocalizations.of(context)!.contrasena,
      onValidate,
      (onSavedVal) => {password = onSavedVal},
      prefixIcon: const Icon(Icons.password),
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            hidePassword = !hidePassword;
          });
        },
        color: Theme.of(context).primaryColor.withOpacity(0.4),
        icon: Icon(hidePassword ? Icons.visibility_off : Icons.visibility),
      ),
      obscureText: hidePassword,
    );
  }

  _submitForm() async {
    if (!globalFormKey.currentState!.validate()) {
      return;
    }
    globalFormKey.currentState!.save();

    Output output = await DoLogin().run(username, password);
    if (output == Output.success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("login success"),
        ),
      );
    } else {
      _errorSesionSnackBar();
    }
  }

  _onValidateUsername(String onValidateVal) {
    final regExp = RegExp(r'^.*@(correo\.ugr\.es|ugr\.es)$');
    if (onValidateVal.isEmpty) {
      return AppLocalizations.of(context)!.emailVacio;
    } else if (!regExp.hasMatch(onValidateVal)) {
      return AppLocalizations.of(context)!.emailNoCorporativo;
    }

    return null;
  }

  _onValidatePassword(String onValidateVal) {
    if (onValidateVal.isEmpty) {
      return AppLocalizations.of(context)!.contrasenaVacia;
    }

    return null;
  }


  _errorSesionSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.errorLogin),
      ),
    );
  }
}
