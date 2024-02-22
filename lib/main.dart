import 'package:biori/global/globals.dart';
import 'package:biori/router/custom_router.dart';
import 'package:biori/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Biori",
      theme: AppTheme.theme,
      routerConfig: CustomRouter().router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      scaffoldMessengerKey: snackbarKey,


    );
  }
}

