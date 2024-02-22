import 'package:biori/authentication_screen/login/login_page.dart';
import 'package:biori/authentication_screen/login/validation/validation_page.dart';
import 'package:biori/authentication_screen/register/register_page.dart';
import 'package:biori/keys/globals.dart';
import 'package:biori/main_screen/main_screen.dart';
import 'package:biori/router/route_constants.dart';
import 'package:biori/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomRouter {
  static final CustomRouter _instance = CustomRouter._internal();
  static late final GoRouter router;

  static CustomRouter get instance => _instance;

  factory CustomRouter() {
    return _instance;
  }

  CustomRouter._internal() {
    final routes = [
        GoRoute(
          path: splashScreenRoute,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return getPage(
                child: const SplashScreen(),
                state: state,
            );
          },
        ),

        GoRoute(
          path: mainScreenRoute,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return getPage(
                child: const MainScreen(),
                state: state,
            );
          },
        ),

        GoRoute(
            path: loginRoute,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return getPage(
                  child: const LoginPage(),
                  state: state,
              );
            },
        ),

        GoRoute(
            path: registerRoute,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return getPage(
                  child: const RegisterPage(),
                  state: state,
              );
            },
        ),

        GoRoute(
            path: validationRoute,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return getPage(
                  child: const ValidationPage(),
                  state: state,
              );
            },
        ),
    ];

    router = GoRouter(
      navigatorKey: parentNavigatorKey,
      initialLocation: splashScreenRoute,
      routes: routes,
    );
  }

  static Page getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }
}
