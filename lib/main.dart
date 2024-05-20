import 'package:biori/keys/globals.dart';
import 'package:biori/main_screen/home/user_stories/releases/repository/releases_repository.dart';
import 'package:biori/router/custom_router.dart';
import 'package:biori/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  CustomRouter.instance; // Initialize the router
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ReleasesRepository>(
          create: (_) => ReleasesRepository(),
        ),

      ],
      child: MaterialApp.router(
        title: "Biori",
        theme: MaterialTheme(
                Typography.material2021(platform: Theme.of(context).platform)
                    .englishLike)
            .lightMediumContrast(),
        routerConfig: CustomRouter.router,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        scaffoldMessengerKey: snackbarKey,
      ),
    );
  }
}
