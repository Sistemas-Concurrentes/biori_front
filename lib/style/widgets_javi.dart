import 'package:biori/keys/globals.dart';
import 'package:biori/router/custom_router.dart';
import 'package:biori/router/route_constants.dart';
import 'package:biori/style/model/chip_button_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

import 'javi_edit_text.dart';

class WidgetsJavi {
  Container bioriContainer(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.0),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, 2), blurRadius: 6.0)
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
                style: JaviStyle.titulo,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container informacionSecundaria(BuildContext context, String textoSinUrl,
      String textoRedirigir, String rutaRedirigir) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
          JaviPaddings.M, JaviPaddings.M, JaviPaddings.M, JaviPaddings.M),
      child: RichText(
        text: TextSpan(
          style: JaviStyle.subcomentarios,
          children: <TextSpan>[
            TextSpan(
              text: textoSinUrl,
            ),
            TextSpan(
              text: textoRedirigir,
              style: JaviStyle.url,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  CustomRouter.router.push(rutaRedirigir);
                },
            ),
          ],
        ),
      ),
    );
  }

  Widget paddedWidget(Widget child, {double topPadding = JaviPaddings.L}) {
    return Padding(
      padding: EdgeInsets.only(
        top: topPadding,
      ),
      child: child,
    );
  }

  Widget progressHudJavi(
      BuildContext context, bool isApiCallProcess, Widget child) {
    return ProgressHUD(
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
      key: UniqueKey(),
      child: child,
    );
  }

  snackbarScaffold(String message) {
    final SnackBar snackBar = SnackBar(content: Text(message));
    snackbarKey.currentState?.showSnackBar(snackBar);
  }

  Widget filterChipForTags(List<ChipButtonModel> tags,
      Function(ChipButtonModel) onSelected) {
    return Wrap(
      spacing: 5.0,
      children: tags.map((actualTag) {
        bool isActualChipSelected = actualTag.isFollowed;
        return FilterChip(
          label: Text(actualTag.name),
          selected: isActualChipSelected,
          onSelected: (bool selected) {
            onSelected(actualTag);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          labelStyle: TextStyle(
            color: isActualChipSelected ? Colors.white : Colors.black,
          ),
        );
      }).toList(),
    );
  }

  showDialogWithText(BuildContext context, String title, Function onPressed,
      {Icon? icon,
      String nextPath = homePath,
      bool pushToNextPath = true,
      String buttonText = "OK",
      bool error = false}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: icon,
          title: Text(title),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onPressed();
              },
              child: Text(buttonText),
            ),
          ],
          backgroundColor:
              error ? Theme.of(context).colorScheme.onErrorContainer : null,
          iconColor: error ? Theme.of(context).colorScheme.error : null,
        );
      },
    );
  }
}
