import 'package:biori/authentication_screen/login/login_page.dart';
import 'package:biori/authentication_screen/login/validation/validation_page.dart';
import 'package:biori/authentication_screen/register/register_page.dart';
import 'package:biori/main_screen/add/add_page.dart';
import 'package:biori/main_screen/add/user_stories/advertisement/add_advertisement_page.dart';
import 'package:biori/main_screen/add/user_stories/event/events_general/add_event_page.dart';
import 'package:biori/main_screen/add/user_stories/event/events_group/add_event_group_page.dart';
import 'package:biori/main_screen/add/user_stories/report/add_report_page.dart';
import 'package:biori/main_screen/home/event_detail/event_detail_page.dart';
import 'package:biori/main_screen/home/home_page.dart';
import 'package:biori/main_screen/bottom_navigation_bar.dart';
import 'package:biori/main_screen/home/listeners/card_listener_interface.dart';
import 'package:biori/main_screen/home/widget/events/model/event_model.dart';
import 'package:biori/main_screen/settings/setting_page.dart';
import 'package:biori/router/route_constants.dart';
import 'package:biori/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class CustomRouter {
  static final CustomRouter _instance = CustomRouter._internal();
  static late final GoRouter router;

  final GlobalKey<NavigatorState> parentNavigatorKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> homeTabNavigatorKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> profileTabNavigatorKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> settingsTabNavigatorKey =
      GlobalKey<NavigatorState>();

  static CustomRouter get instance => _instance;

  factory CustomRouter() {
    return _instance;
  }

  CustomRouter._internal() {
    final routes = [
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: parentNavigatorKey,
        branches: [
          StatefulShellBranch(
            navigatorKey: homeTabNavigatorKey,
            routes: [
              GoRoute(
                path: homePath,
                pageBuilder: (context, GoRouterState state) {
                  return getPage(
                    child: const HomePage(),
                    state: state,
                  );
                },
              ),
              GoRoute(
                path: eventDetailRoute,
                pageBuilder: (context, state) {
                  final extra = state.extra as Map<String, dynamic>;
                  EventModel eventModel = extra['eventModel'] as EventModel;
                  CardListenerInterface cardListenerInterface =
                      extra['cardListenerInterface'] as CardListenerInterface;
                  return getPage(
                    child: EventDetailPage(
                        eventModel: eventModel, cardListenerInterface: cardListenerInterface),
                    state: state,
                  );
                },
              ),
              GoRoute(
                path: addReleasesRoute,
                pageBuilder: (context, state) {
                  return getPage(
                    child: const AddPage(),
                    state: state,
                  );
                },
                routes: [
                  GoRoute(
                    path: addEventRoute,
                    pageBuilder: (context, state) {
                      return getPage(
                        child: const AddEventPage(),
                        state: state,
                      );
                    },
                  ),
                  GoRoute(
                    path: addEventGroupRoute,
                    pageBuilder: (context, state) {
                      return getPage(
                        child: const AddEventGroupPage(),
                        state: state,
                      );
                    },
                  ),
                  GoRoute(
                    path: addAdvertisementRoute,
                    pageBuilder: (context, state) {
                      return getPage(
                        child: const AddAdvertisementPage(),
                        state: state,
                      );
                    },
                  ),
                  GoRoute(
                    path: addReportRoute,
                    pageBuilder: (context, state) {
                      return getPage(
                        child: const AddReportPage(),
                        state: state,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: settingsTabNavigatorKey,
            routes: [
              GoRoute(
                path: settingsRoute,
                pageBuilder: (context, state) {
                  return getPage(
                    child: const CalendarPage(),
                    state: state,
                  );
                },
              ),
            ],
          ),
        ],
        pageBuilder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) {
          return getPage(
            child: BottomNavigationPage(
              child: navigationShell,
            ),
            state: state,
          );
        },
      ),
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
