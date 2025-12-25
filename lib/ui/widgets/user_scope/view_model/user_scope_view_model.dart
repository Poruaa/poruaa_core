import 'dart:async';

import 'package:flutter/material.dart';
import 'package:poruaa_core/data/repositories/user/user_repository.dart';

class UserScopeViewModel with ChangeNotifier {
  final UserRepository _userRepository;
  UserScopeViewModel(this._userRepository) {
    _init();
  }

  /// Set FCM manager after it's available from provider
  StreamSubscription? _streamSubscription;

  Future<void> _init() async {
    _streamSubscription = _userRepository.userSnapshot.listen((user) {
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }
}
