import 'package:poruaa_core/utils/result.dart';

abstract class ConfigRepository {
  /// Loads configuration from the service
  Future<Result<Map<String, dynamic>>> load();

  /// Watches configuration changes using BehaviorSubject
  Stream<Result<Map<String, dynamic>>?> watch();

  /// Reloads configuration and updates the stream
  Future<Result<Map<String, dynamic>>> reload();

  /// Gets the current cached configuration
  Map<String, dynamic>? get currentConfig;

  /// Disposes the repository resources
  void dispose();
}
