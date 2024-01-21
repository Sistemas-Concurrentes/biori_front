
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'javiEditText.dart';

class WidgetsJavi {
  Container bioriContainer(context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: MediaQuery
          .of(context)
          .size
          .height / 5,
      decoration: BoxDecoration(
          color: Theme
              .of(context)
              .secondaryHeaderColor,
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
                style: JaviStyle.titulo,
              ),
            ),
          ),
        ],
      ),
    );
  }

  RichText informacionSecundaria(BuildContext context, String textoSinUrl, String textoRedirigir, Function redirigir){
    return RichText(
      text: TextSpan(
        style: JaviStyle.subcomentarios,
        children: <TextSpan>[
          TextSpan(
            text: textoSinUrl,
            style: JaviStyle.granada1,
          ),
          TextSpan(
            text: textoRedirigir,
            style: JaviStyle.url,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                redirigir();
              },
          ),
        ],
      ),
    );
  }
}