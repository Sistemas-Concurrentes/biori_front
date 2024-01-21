import 'package:biori/authentication_screen/login/user_stories/DoLogin.dart';
import 'package:biori/style/javiEditText.dart';
import 'package:biori/authentication_screen/register/register_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

import '../../style/widgetsJavi.dart';


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
            child: Padding(
              padding: const EdgeInsets.only(
                top: JaviPaddings.L,
                right: JaviPaddings.XL,
              ),
              child: RichText(
                text: TextSpan(
                  style: JaviStyle.granada1,
                  children: <TextSpan>[
                    TextSpan(
                      text: "Forgot Password?",
                      style: JaviStyle.url,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage()),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: JaviPaddings.XL,
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
          WidgetsJavi().informacionSecundaria(context, "¿No tienes cuenta?", "Registrate",
                  (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterPage()),
                );
              }),
        ],
      ),
    );
  }

  Widget usernameEditText(Function onValidate) {
    return JaviForms.inputBaseWidget(
      context,
      "username",
      "Email corporativo",
      onValidate,
      (onSavedVal) => {username = onSavedVal},
      prefixIcon: const Icon(Icons.email),
    );
  }

  Widget passwordEditText(Function onValidate) {
    return JaviForms.inputBaseWidget(
      context,
      "password",
      "Password",
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
      // Navigate to home Page
    } else {
      _errorSesionSnackBar();
    }
  }

  _onValidateUsername(String onValidateVal) {
    final regExp = RegExp(r'^.*@(correo\.ugr\.es|ugr\.es)$');
    if (onValidateVal.isEmpty) {
      return 'Email no puede estar vacío.';
    } else if (!regExp.hasMatch(onValidateVal)) {
      return 'El email ha de ser el corporativo.';
    }

    return null;
  }

  _onValidatePassword(String onValidateVal) {
    if (onValidateVal.isEmpty) {
      return 'La contraseña no puede estar vacía.';
    }

    return null;
  }


  _errorSesionSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Error al iniciar sesión'),
      ),
    );
  }
}
