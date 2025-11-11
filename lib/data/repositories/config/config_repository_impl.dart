import 'package:poruaa_core/data/repositories/config/config_repository.dart';
import 'package:poruaa_core/data/services/config/config_service.dart';
import 'package:poruaa_core/utils/result.dart';
import 'package:rxdart/subjects.dart';

class ConfigRepositoryImpl extends ConfigRepository {
  final ConfigService _configService;
  final _configSubject = BehaviorSubject<Result<Map<String, dynamic>>?>.seeded(
    null,
  );

  ConfigRepositoryImpl(this._configService);

  @override
  Future<Result<Map<String, dynamic>>> load() async {
    try {
      final result = await _configService.getConfig();
      _configSubject.add(result);
      return result;
    } catch (e) {
      final errorResult = Result<Map<String, dynamic>>.error(
        'Failed to load config: $e',
      );
      _configSubject.add(errorResult);
      return errorResult;
    }
  }

  @override
  Stream<Result<Map<String, dynamic>>?> watch() {
    return _configSubject.stream;
  }

  @override
  Future<Result<Map<String, dynamic>>> reload() async {
    return await load();
  }

  @override
  Map<String, dynamic>? get currentConfig {
    final currentResult = _configSubject.value;
    if (currentResult == null) return null;

    switch (currentResult) {
      case Ok(value: final config):
        return config;
      case Err():
        return null;
    }
  }

  @override
  void dispose() {
    _configSubject.close();
  }
}
