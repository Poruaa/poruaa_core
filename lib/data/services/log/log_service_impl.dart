import 'dart:convert';
import 'package:poruaa_core/data/services/log/log_service.dart';
import 'package:poruaa_core/data/services/log/models/log_model.dart';
import 'package:poruaa_core/utils/result.dart';
import 'package:http/http.dart' as http;

class LogServiceImpl extends LogService {
  static const String _logUrl = 'https://log-service.poruaa.com/log';

  @override
  Future<Result<void>> debug(
    String message, {
    Map<String, dynamic>? params,
  }) async {
    return await _sendLog(LogModel.debug(message, params: params));
  }

  @override
  Future<Result<void>> info(
    String message, {
    Map<String, dynamic>? params,
  }) async {
    return await _sendLog(LogModel.info(message, params: params));
  }

  @override
  Future<Result<void>> warn(
    String message, {
    Map<String, dynamic>? params,
  }) async {
    return await _sendLog(LogModel.warn(message, params: params));
  }

  @override
  Future<Result<void>> error(
    String message, {
    Map<String, dynamic>? params,
    String? error,
    String? stack,
  }) async {
    return await _sendLog(
      LogModel.error(message, params: params, error: error, stack: stack),
    );
  }

  @override
  Future<Result<void>> log(LogModel logModel) async {
    return await _sendLog(logModel);
  }

  Future<Result<void>> _sendLog(LogModel logModel) async {
    try {
      final response = await http.post(
        Uri.parse(_logUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(logModel.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return const Result.ok(null);
      } else {
        return Result.error(
          'Failed to send log: ${response.statusCode} - ${response.body}',
        );
      }
    } catch (e) {
      return Result.error('Error sending log: $e');
    }
  }
}
