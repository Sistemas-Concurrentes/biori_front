import 'package:biori/authentication_screen/register/user_stories/do_register.dart';
import 'package:biori/router/route_constants.dart';
import 'package:biori/style/javi_edit_text.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:biori/conection_to_backend/authentication_screen/output.dart';


import '../../style/widgets_javi.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isApiCallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  String? username;
  String? nombre;
  String? apellidos;
  TextEditingController _timeController = TextEditingController();
  String? password;
  String? confirmPassword;
  String? numeroTelefono;



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
            child: _registerUI(context),
          ),
        ),
      ),
    );
  }

  Widget _registerUI(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          WidgetsJavi().bioriContainer(context),
          WidgetsJavi().paddedWidget(usernameEditText(_onValidateUsername)),
          WidgetsJavi().paddedWidget(nombreEditText(_onValidateNombre)),
          WidgetsJavi().paddedWidget(apellidosEditText(_onValidateApellidos)),
          WidgetsJavi().paddedWidget(passwordEditText(_onValidatePassword)),
          WidgetsJavi().paddedWidget(passwordEditText(_onValidateConfirmPassword)),
          WidgetsJavi().paddedWidget(timeEditText()),
          WidgetsJavi().paddedWidget(phoneNumberEditText(_onValidatePhoneNumber)),
          WidgetsJavi().paddedWidget(
            JaviForms.submitButton(
              context,
              "Register",
              _submitForm,
            ),
          ),
          WidgetsJavi().paddedWidget(WidgetsJavi().informacionSecundaria(
              context, "¿Ya tienes cuenta? ", "Login", loginRoute)),
        ],
      ),
    );

  }

  Widget paddedWidget(Widget child) {
    return Padding(
      padding: const EdgeInsets.only(
        top: JaviPaddings.L,
      ),
      child: child,
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


  Widget nombreEditText(Function onValidate) {
    return JaviForms.inputBaseWidget(
      context,
      "nombre",
      AppLocalizations.of(context)!.nombre,
      onValidate,
          (onSavedVal) => {nombre = onSavedVal},
      prefixIcon: const Icon(Icons.abc),
    );
  }

  Widget apellidosEditText(Function onValidate) {
    return JaviForms.inputBaseWidget(
      context,
      "apellidos",
      AppLocalizations.of(context)!.apellidos,
      onValidate,
          (onSavedVal) => {apellidos = onSavedVal},
      prefixIcon: const Icon(Icons.abc),
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

  Widget timeEditText() {
    return JaviForms.introducirFecha(
      context,
      _timeController,
      AppLocalizations.of(context)!.fechaNacimiento,
    );
  }

  Widget phoneNumberEditText(Function onValidate) {
    return JaviForms.inputBaseWidget(
    context,
    "numeroTelefono",
    AppLocalizations.of(context)!.numeroTelefono,
    onValidate,
      (onSavedVal) => {numeroTelefono = onSavedVal},
    prefixIcon: const Icon(Icons.phone),
    );
  }

  _submitForm() async {
    if (!globalFormKey.currentState!.validate()) {
      return;
    }
    globalFormKey.currentState!.save();

    setState(() {
      isApiCallProcess = true;
    });

    Output output = await DoRegister().run(username, password, nombre, apellidos, _timeController.text, numeroTelefono);

    setState(() {
      isApiCallProcess = false;
    });

    if (output == Output.success) {
      // Navigate to home Page
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
    } else if (onValidateVal.length < 8) {
      return AppLocalizations.of(context)!.contrasenaCorta;
    }

    return null;
  }

  _onValidateNombre(String onValidateVal) {
    if (onValidateVal.isEmpty) {
      return AppLocalizations.of(context)!.nombreVacio;
    }

    return null;
  }

  _onValidateApellidos(String onValidateVal) {
    if (onValidateVal.isEmpty) {
      return AppLocalizations.of(context)!.apellidosVacio;
    }

    return null;
  }

  _onValidateConfirmPassword(String onValidateVal) {
    return null;
    if (onValidateVal.isEmpty) {
      return AppLocalizations.of(context)!.contrasenaVacia;
    } else if (onValidateVal.length < 8) {
      return AppLocalizations.of(context)!.contrasenaCorta;
    } else if (onValidateVal != password) {
      return AppLocalizations.of(context)!.contrasenaNoCoincide;
    }

    return null;
  }

  _onValidatePhoneNumber(String onValidateVal) {
    String pattern = r'(^(?:[+0]9)?[0-9]{9,12}$)';
    RegExp regExp = RegExp(pattern);
    if (onValidateVal.isEmpty) {
      return AppLocalizations.of(context)!.numeroTelefonoVacio;
    }
    else if (!regExp.hasMatch(onValidateVal)) {
      return AppLocalizations.of(context)!.numeroTelefonoNoValido;
    }
    return null;
  }

  _errorSesionSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.errorRegistro),
      ),
    );
  }
}
