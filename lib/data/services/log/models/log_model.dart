enum LogLevel {
  debug,
  info,
  warn,
  error,
}

class LogModel {
  final LogLevel level;
  final String message;
  final Map<String, dynamic>? params;
  final String? error;
  final String? stack;

  LogModel({
    required this.level,
    required this.message,
    this.params,
    this.error,
    this.stack,
  });

  Map<String, dynamic> toJson() {
    return {
      'level': level.name.toUpperCase(),
      'message': message,
      if (params != null) 'params': params,
      if (error != null) 'error': error,
      if (stack != null) 'stack': stack,
    };
  }

  // Convenience constructors for different log levels
  factory LogModel.debug(String message, {Map<String, dynamic>? params}) {
    return LogModel(
      level: LogLevel.debug,
      message: message,
      params: params,
    );
  }

  factory LogModel.info(String message, {Map<String, dynamic>? params}) {
    return LogModel(
      level: LogLevel.info,
      message: message,
      params: params,
    );
  }

  factory LogModel.warn(String message, {Map<String, dynamic>? params}) {
    return LogModel(
      level: LogLevel.warn,
      message: message,
      params: params,
    );
  }

  factory LogModel.error(
    String message, {
    Map<String, dynamic>? params,
    String? error,
    String? stack,
  }) {
    return LogModel(
      level: LogLevel.error,
      message: message,
      params: params,
      error: error,
      stack: stack,
    );
  }
}
