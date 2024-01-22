import 'package:biori/authentication_screen/register/user_stories/DoRegister.dart';
import 'package:biori/router/route_constants.dart';
import 'package:biori/style/javiEditText.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

import '../../style/widgetsJavi.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isApiCallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  TextEditingController _timeController = TextEditingController();

  String? username;
  String? nombre;
  String? apellidos;
  DateTime? fechaNacimiento;
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
          paddedWidget(usernameEditText(_onValidateUsername)),
          paddedWidget(nombreEditText(_onValidateNombre)),
          paddedWidget(apellidosEditText(_onValidateApellidos)),
          paddedWidget(passwordEditText(_onValidatePassword)),
          paddedWidget(passwordEditText(_onValidateConfirmPassword)),
          paddedWidget(timeEditText()),
          paddedWidget(phoneNumberEditText(_onValidatePhoneNumber)),
          paddedWidget(JaviForms.submitButton(
              context,
              "Register",
              _submitForm,
            ),
          ),
          paddedWidget(WidgetsJavi().informacionSecundaria(context, "¿Ya tienes cuenta? ", "Login", loginRoute)),
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
      "Email corporativo",
      onValidate,
          (onSavedVal) => {username = onSavedVal},
      prefixIcon: const Icon(Icons.email),
    );
  }


  Widget nombreEditText(Function onValidate) {
    return JaviForms.inputBaseWidget(
      context,
      "nombre",
      "Nombre",
      onValidate,
          (onSavedVal) => {username = onSavedVal},
      prefixIcon: const Icon(Icons.abc),
    );
  }

  Widget apellidosEditText(Function onValidate) {
    return JaviForms.inputBaseWidget(
      context,
      "apellidos",
      "Apellidos",
      onValidate,
          (onSavedVal) => {username = onSavedVal},
      prefixIcon: const Icon(Icons.abc),
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

  Widget timeEditText() {
    return JaviForms.introducirFecha(
      context,
      _timeController,
      "Fecha de nacimiento",
    );
  }

  Widget phoneNumberEditText(Function onValidate) {
    return JaviForms.inputBaseWidget(
    context,
    "numeroTelefono",
    "Número de teléfono",
    onValidate,
      (onSavedVal) => {username = onSavedVal},
    prefixIcon: const Icon(Icons.phone),
    );
  }

  _submitForm() async {
    if (!globalFormKey.currentState!.validate()) {
      return;
    }
    globalFormKey.currentState!.save();

    Output output = await DoRegister().run(username, password, nombre, apellidos, fechaNacimiento, numeroTelefono);

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
      return 'Password no puede estar vacío.';
    } else if (onValidateVal.length < 8) {
      return 'Password ha de tener al menos 8 caracteres.';
    }

    return null;
  }

  _onValidateNombre(String onValidateVal) {
    if (onValidateVal.isEmpty) {
      return 'Nombre no puede estar vacío.';
    }

    return null;
  }

  _onValidateApellidos(String onValidateVal) {
    if (onValidateVal.isEmpty) {
      return 'Apellidos no puede estar vacío.';
    }

    return null;
  }

  _onValidateConfirmPassword(String onValidateVal) {
    if (onValidateVal.isEmpty) {
      return 'Password no puede estar vacío.';
    } else if (onValidateVal.length < 8) {
      return 'Password ha de tener al menos 8 caracteres.';
    } else if (onValidateVal != password) {
      return 'Las contraseñas no coinciden.';
    }

    return null;
  }

  _onValidatePhoneNumber(String onValidateVal) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (onValidateVal.isEmpty) {
      return 'Introduzca un número de teléfono';
    }
    else if (!regExp.hasMatch(onValidateVal)) {
      return 'Introduce un número de teléfono válido';
    }
    return null;
  }

  _errorSesionSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Error al registrar el usuario'),
      ),
    );
  }
}
