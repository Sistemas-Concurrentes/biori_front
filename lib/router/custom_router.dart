import 'package:biori/authentication_screen/login/login_page.dart';
import 'package:biori/authentication_screen/register/register_page.dart';
import 'package:biori/main_screen/main_screen.dart';
import 'package:biori/router/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomRouter {
  final router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
          path: mainScreenRoute,
          builder: (BuildContext context, GoRouterState state) {
            return const MainScreen();
          }),
      GoRoute(
          path: loginRoute,
          builder: (BuildContext context, GoRouterState state) {
            return const LoginPage();
          }),
      GoRoute(
          path: registerRoute,
          builder: (BuildContext context, GoRouterState state) {
            return const RegisterPage();
          }),
    ],
  );
}
