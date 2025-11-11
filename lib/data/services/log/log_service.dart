import 'package:poruaa_core/data/services/log/models/log_model.dart';
import 'package:poruaa_core/utils/result.dart';

abstract class LogService {
  /// Send a debug log
  Future<Result<void>> debug(String message, {Map<String, dynamic>? params});

  /// Send an info log
  Future<Result<void>> info(String message, {Map<String, dynamic>? params});

  /// Send a warning log
  Future<Result<void>> warn(String message, {Map<String, dynamic>? params});

  /// Send an error log
  Future<Result<void>> error(
    String message, {
    Map<String, dynamic>? params,
    String? error,
    String? stack,
  });

  /// Send a custom log with full control
  Future<Result<void>> log(LogModel logModel);
}
