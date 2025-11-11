import 'package:flutter/foundation.dart';
import 'package:poruaa_core/data/services/log/log_service.dart';
import 'package:poruaa_core/data/services/log/log_service_impl.dart';
import 'package:poruaa_core/data/services/log/models/log_model.dart';

class AppLogger {
  static final LogService _logService = LogServiceImpl();
  // ANSI color codes
  static const _reset = '\x1B[0m';
  static const _red = '\x1B[31m';
  static const _green = '\x1B[32m';
  static const _yellow = '\x1B[33m';
  static const _blue = '\x1B[34m';

  static void info(String message, {Map<String, dynamic>? params}) {
    _log("INFO", message, _green, params: params);
  }

  static void warn(String message, {Map<String, dynamic>? params}) {
    _log("WARN", message, _yellow, params: params);
  }

  static void error(
    String message, {
    dynamic error,
    StackTrace? stack,
    Map<String, dynamic>? params,
  }) {
    _log("ERROR", message, _red, params: params, error: error, stack: stack);
  }

  static void debug(String message, {Map<String, dynamic>? params}) {
    _log("DEBUG", message, _blue, params: params);
  }

  static void _log(
    String level,
    String message,
    String color, {
    dynamic error,
    StackTrace? stack,
    Map<String, dynamic>? params,
  }) {
    // Send to log service
    _logService.log(
      LogModel(
        level: LogLevel.values.firstWhere((e) => e.name.toUpperCase() == level),
        message: message,
        params: params,
        error: error?.toString(),
        stack: stack?.toString(),
      ),
    );

    // Print to console in debug mode
    if (kDebugMode) {
      final paramStr = params != null ? " | $params" : "";
      print("$color[$level] $message$paramStr$_reset");
      if (error != null) print("$color$error$_reset");
      if (stack != null) print("$color$stack$_reset");
    }
  }
}
