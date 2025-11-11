import 'package:flutter/material.dart';
import 'package:poruaa_core/data/services/shared_preference/shared_preference_service.dart';
import 'package:rxdart/rxdart.dart';

class ThemeModeRepository {
  final SharedPreferenceService _sharedPreferenceService;
  ThemeModeRepository(this._sharedPreferenceService);

  String get themeModeKey => 'theme_mode';

  bool _initialized = false;

  void _init() {
    if (_initialized) {
      return;
    }
    _initialized = true;
    var themeMode = _sharedPreferenceService.getString(themeModeKey);
    if (themeMode == null) {
      _themeMode.add(ThemeMode.system);
    } else {
      _themeMode.add(ThemeMode.values.byName(themeMode));
    }
  }

  final BehaviorSubject<ThemeMode> _themeMode = BehaviorSubject.seeded(
    ThemeMode.system,
  );
  ThemeMode get themeMode => _themeMode.value;

  Stream<ThemeMode> get watchThemeMode {
    _init();
    return _themeMode.stream;
  }

  void setThemeMode(ThemeMode themeMode) {
    if (themeMode == _themeMode.value) {
      return;
    }
    _sharedPreferenceService.setString(themeModeKey, themeMode.name);
    _themeMode.add(themeMode);
  }
}
