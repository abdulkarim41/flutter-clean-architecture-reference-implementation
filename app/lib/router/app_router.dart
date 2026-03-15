import 'package:app/router/router_observer.dart';
import 'package:app/router/router_registry.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation/navigation.dart';
import 'auth_coordinator.dart';

class AppRouter {
  final GlobalKey<NavigatorState> rootNavKey = GlobalKey<NavigatorState>();

  final GlobalKey<NavigatorState> rootShellNavKey = GlobalKey<NavigatorState>();

  final RouteObserver<ModalRoute<void>> routeObserver =
      RouteObserver<ModalRoute<void>>();

  GoRouter router() {
    return GoRouter(
      initialLocation: AppRoutesPath.splashScreenPath,
      navigatorKey: rootNavKey,
      debugLogDiagnostics: true,

      routes: [
        ShellRoute(
          navigatorKey: rootShellNavKey,

          observers: [routeObserver, RouterObserver()],

          builder: (context, state, child) {
            return AuthCoordinator(child: child);
          },

          routes: [...routers.expand((router) => router.routes)],
        ),
      ],
    );
  }
}
