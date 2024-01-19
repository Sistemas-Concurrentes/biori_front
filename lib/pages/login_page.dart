  import 'dart:io';

import 'package:biori/pages/javiEditText.dart';
import 'package:biori/pages/register_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';

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

  Widget usernameEditText() {
    return JaviForms.inputBaseWidget(
      context,
      "username",
      "Email corporativo",
      (onValidateVal) {
        final regExp = RegExp(r'^.*@(correo\.ugr\.es|ugr\.es)$');
        if (onValidateVal.isEmpty) {
          return 'Email no puede estar vacío.';
        } else if (!regExp.hasMatch(onValidateVal)) {
          return 'El email ha de ser el corporativo.';
        }
        print (regExp.hasMatch(onValidateVal));

        return null;
      },
      (onSavedVal) => {username = onSavedVal},
      prefixIcon: const Icon(Icons.email),
    );
  }

  Widget passwordEditText() {
    return JaviForms.inputBaseWidget(
      context,
      "password",
      "Password",
      (onValidateVal) {
        if (onValidateVal.isEmpty) {
          return 'La contraseña no puede estar vacía.';
        }

        return null;
      },
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

  _submitForm() {
    if (globalFormKey.currentState!.validate()) {
      globalFormKey.currentState!.save();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login enviado'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Widget _loginUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5,
            decoration: BoxDecoration(
                color: Theme.of(context).secondaryHeaderColor,
                borderRadius: BorderRadius.circular(18.0),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 2),
                      blurRadius: 6.0)
                ]),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Biori",
                      style: TextStyle(
                          fontSize: 28.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
            ),
            child: usernameEditText()
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
            ),
            child:passwordEditText()
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                right: 20.0,
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
            height: 20,
          ),
          Center(
            child: JaviForms.submitButton(
              context,
              "Login",
              _submitForm,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14.0,
              ),
              children: <TextSpan>[
                const TextSpan(
                  text: "¿No tienes una cuenta? ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                  ),
                ),
                TextSpan(
                  text: "Registrate",
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
        ],
      ),
    );
  }
}

class _myEditText {}
