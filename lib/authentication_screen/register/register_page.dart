import 'package:biori/authentication_screen/register/user_stories/do_register.dart';
import 'package:biori/router/route_constants.dart';
import 'package:biori/style/javi_edit_text.dart';
import 'package:flutter/material.dart';
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
  String? fechaNacimiento;
  String? password;
  String? confirmPassword;
  String? numeroTelefono;

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
            child: _registerUI(context),
          ),
        ),
      ),
    );
  }

  Widget _registerUI(BuildContext context) {
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
          WidgetsJavi()
              .paddedWidget(passwordEditText(_onValidateConfirmPassword)),
          WidgetsJavi().paddedWidget(timeEditText(_onValidateDate)),
          WidgetsJavi()
              .paddedWidget(phoneNumberEditText(_onValidatePhoneNumber)),
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

  Widget timeEditText(Function onValidate) {
    return JaviForms.introducirFecha(
      context,
      _timeController,
      AppLocalizations.of(context)!.fechaNacimiento,
      onValidate,
      (onSavedVal) => {fechaNacimiento = JaviForms().stringSpainFormatToBdFormat(onSavedVal)},
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

  _onValidateUsername(String onValidateVal) {
    final regExp = RegExp(r'^.*@(correo\.ugr\.es|ugr\.es)$');
    if (onValidateVal.isEmpty) {
      return AppLocalizations.of(context)!.emailVacio;
    } else if (!regExp.hasMatch(onValidateVal)) {
      return AppLocalizations.of(context)!.emailNoCorporativo;
    }

    return null;
  }

  _onValidateNombre(String onValidateVal) {
    if (onValidateVal.isEmpty) {
      return AppLocalizations.of(context)!.nombreVacio;
    }

    return null;
  }

  _onValidatePassword(String onValidateVal) {
    if (onValidateVal.isEmpty) {
      return AppLocalizations.of(context)!.contrasenaVacia;
    } else if (onValidateVal.length < 8) {
      return AppLocalizations.of(context)!.contrasenaCorta;
    }

    password = onValidateVal;

    return null;
  }

  _onValidateApellidos(String onValidateVal) {
    if (onValidateVal.isEmpty) {
      return AppLocalizations.of(context)!.apellidosVacio;
    }

    return null;
  }

  _onValidateConfirmPassword(String onValidateVal) {
    if (onValidateVal != password) {
      return AppLocalizations.of(context)!.contrasenaNoCoincide;
    }

    return null;
  }

  _onValidatePhoneNumber(String onValidateVal) {
    String pattern = r'(^(?:[+0]9)?[0-9]{9,12}$)';
    RegExp regExp = RegExp(pattern);
    if (onValidateVal.isEmpty) {
      return AppLocalizations.of(context)!.numeroTelefonoVacio;
    } else if (!regExp.hasMatch(onValidateVal)) {
      return AppLocalizations.of(context)!.numeroTelefonoNoValido;
    }
    return null;
  }

  _onValidateDate(String onValidateVal) {
    if (onValidateVal.isEmpty) {
      return AppLocalizations.of(context)!.fechaNacimientoVacia;
    }
    return null;
  }

  _submitForm() async {
    if (!_validatedState()) {
      return;
    }
    globalFormKey.currentState!.save();

    _showLoadingBar(true);

    Output output = await DoRegister().run(
        nombre, apellidos, username, password, fechaNacimiento, numeroTelefono);

    _showLoadingBar(false);

    if (output == Output.success) {
      // Navigate to home Page
    } else if (output == Output.userAlreadyExists) {
      _userExistsSnackBar();
    } else {
      _errorSesionSnackBar();
    }
  }

  _validatedState() {
    if (!globalFormKey.currentState!.validate()) {
      return false;
    }
    return true;
  }

  _errorSesionSnackBar() {
    WidgetsJavi().snackbarScaffold(AppLocalizations.of(context)!.errorRegistro);
  }

  _userExistsSnackBar(){
    WidgetsJavi().snackbarScaffold(AppLocalizations.of(context)!.usuarioYaExiste);
  }

  _showLoadingBar(bool show) {
    setState(() {
      isApiCallProcess = show;
    });
  }
}
