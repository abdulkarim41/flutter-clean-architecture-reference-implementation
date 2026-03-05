import 'dart:async';
import 'package:flutter/foundation.dart';

class RouterRefreshStream extends ChangeNotifier {
  RouterRefreshStream(Stream stream) {
    notifyListeners();

    _subscription = stream.asBroadcastStream().listen(
          (_) => notifyListeners(),
    );
  }

  late final StreamSubscription _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}