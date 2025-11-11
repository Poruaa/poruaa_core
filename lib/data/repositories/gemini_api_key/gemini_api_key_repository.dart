import 'package:poruaa_core/data/services/shared_preference/shared_preference_service.dart';
import 'package:rxdart/rxdart.dart';

class GeminiApiKeyRepository {
  final SharedPreferenceService _sharedPreferenceService;
  GeminiApiKeyRepository(this._sharedPreferenceService);

  String get geminiApiKeyKey => 'gemini_api_key';

  bool _initialized = false;

  void _init() {
    if (_initialized) {
      return;
    }
    _initialized = true;
    _apiKey.add(getKey());
  }

  final BehaviorSubject<String?> _apiKey = BehaviorSubject.seeded(null);

  String? getKey() {
    return _sharedPreferenceService.getString(geminiApiKeyKey);
  }

  Stream<String?> watchKey() {
    _init();
    return _apiKey.stream;
  }

  void setKey(String value) {
    _sharedPreferenceService.setString(geminiApiKeyKey, value);
    _init();
    _apiKey.add(value);
  }

  void dispose() {
    _apiKey.close();
  }
}
