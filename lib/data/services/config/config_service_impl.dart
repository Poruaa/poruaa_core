import 'dart:convert';
import 'package:poruaa_core/data/services/config/config_service.dart';
import 'package:poruaa_core/utils/result.dart';
import 'package:http/http.dart' as http;

class ConfigServiceImpl extends ConfigService {
  static const String _configUrl = 'https://config.poruaa.com/config';

  @override
  Future<Result<Map<String, dynamic>>> getConfig() async {
    try {
      final response = await http.get(
        Uri.parse(_configUrl),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> configData = json.decode(response.body);
        return Result.ok(configData);
      } else {
        return Result.error(
          'Failed to fetch config: ${response.statusCode} - ${response.body}',
        );
      }
    } catch (e) {
      return Result.error('Error fetching config: $e');
    }
  }
}
