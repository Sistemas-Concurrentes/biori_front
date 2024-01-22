import 'package:biori/authentication_screen/login/login_page.dart';
import 'package:biori/authentication_screen/register/register_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class CustomRouter {
  final router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
      path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        }
      ),
      GoRoute(
        path: '/register',
        builder: (BuildContext context, GoRouterState state) {
          return const RegisterPage();
        }
      ),
    ],
  );

}