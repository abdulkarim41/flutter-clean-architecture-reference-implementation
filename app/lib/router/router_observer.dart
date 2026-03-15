import 'package:flutter/cupertino.dart';

class RouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('ROUTER LOG [PUSH]: ${route.settings.name ?? 'Unnamed Route'} | Previous: ${previousRoute?.settings.name}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('ROUTER LOG [POP]: ${route.settings.name ?? 'Unnamed Route'} | Previous: ${previousRoute?.settings.name}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    debugPrint('ROUTER LOG [REPLACE]: ${newRoute?.settings.name ?? 'Unnamed Route'} | Old: ${oldRoute?.settings.name}');
  }
}