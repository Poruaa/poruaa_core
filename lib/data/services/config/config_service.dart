import 'package:poruaa_core/utils/result.dart';

abstract class ConfigService {
  Future<Result<Map<String, dynamic>>> getConfig();
}
