import 'package:poruaa_core/utils/result.dart';
import 'package:http/http.dart' as http;

import 'model/response.dart';

abstract class ApiService {
  Future<Result<Response>> get(String path, {Map<String, String>? headers});

  Future<Result<Response>> post(
    String path, {
    Map<String, String>? headers,
    Object? body,
  });
  Future<Result<Response>> patch(
    String path, {
    Map<String, String>? headers,
    Object? body,
  });
  Future<Result<Response>> put(
    String path, {
    Map<String, String>? headers,
    Object? body,
  });
  Future<Result<Response>> delete(
    String path, {
    Map<String, String>? headers,
    Object? body,
  });

  Future<Result<Response>> patchMultipart(
    String path, {
    required List<http.MultipartFile> files,
    Map<String, String>? fields,
  });

  Future<String?> getRefreshToken();
}
