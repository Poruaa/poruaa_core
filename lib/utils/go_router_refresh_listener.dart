import 'dart:async';

import 'package:flutter/material.dart';

class GoRouterRefreshListener extends ChangeNotifier {
  late StreamSubscription _subscription;
  GoRouterRefreshListener(Stream stream) {
    _subscription = stream.listen((_) => notifyListeners());
  }
  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
