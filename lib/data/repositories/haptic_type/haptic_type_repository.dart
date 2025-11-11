import 'package:poruaa_core/data/services/shared_preference/shared_preference_service.dart';
import 'package:rxdart/rxdart.dart';

class HapticTypeRepository {
  final SharedPreferenceService _sharedPreferenceService;
  HapticTypeRepository(this._sharedPreferenceService);

  String get hapticTypeKey => 'haptic_type';

  bool _initialized = false;

  void _init() {
    if (_initialized) {
      return;
    }
    _initialized = true;
    var hapticType = _sharedPreferenceService.getString(hapticTypeKey);
    if (hapticType == null) {
      _hapticType.add('haptic');
    } else {
      _hapticType.add(hapticType);
    }
  }

  final BehaviorSubject<String> _hapticType = BehaviorSubject.seeded('haptic');
  String get hapticType => _hapticType.value;

  Stream<String> get watchHapticType {
    _init();
    return _hapticType.stream;
  }

  void setHapticType(String hapticType) {
    if (hapticType == _hapticType.value) {
      return;
    }
    _sharedPreferenceService.setString(hapticTypeKey, hapticType);
    _hapticType.add(hapticType);
  }
}
