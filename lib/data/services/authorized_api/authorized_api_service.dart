import 'package:poruaa_core/data/services/access_token/access_token_service.dart';
import 'package:poruaa_core/data/services/api/api_service.dart';
import 'package:poruaa_core/data/services/api/model/response.dart';
import 'package:poruaa_core/data/services/auth/auth_service.dart';
import 'package:poruaa_core/utils/result.dart';
import 'package:http/http.dart' as http;

class AuthorizedApiService {
  final ApiService _apiService;
  final AuthService _authService;
  final AccessTokenService _accessTokenService;
  String get hostname => _apiService.hostname;

  AuthorizedApiService(
    this._apiService,
    this._authService,
    this._accessTokenService,
  );

  Future<Result<Response>> get(
    String path, {
    String? overrideBaseUrl,
    Map<String, String>? headers,
  }) async {
    await _accessTokenService.refreshTokenIfNeeded(_authService);
    return await _apiService.get(
      path,
      overrideBaseUrl: overrideBaseUrl,
      headers: headers,
    );
  }

  Future<Result<Response>> post(
    String path, {
    String? overrideBaseUrl,
    Map<String, String>? headers,
    Object? body,
  }) async {
    await _accessTokenService.refreshTokenIfNeeded(_authService);
    return await _apiService.post(
      path,
      overrideBaseUrl: overrideBaseUrl,
      headers: headers,
      body: body,
    );
  }

  Future<Result<Response>> put(
    String path, {
    String? overrideBaseUrl,
    Map<String, String>? headers,
    Object? body,
  }) async {
    await _accessTokenService.refreshTokenIfNeeded(_authService);
    return await _apiService.put(
      path,
      overrideBaseUrl: overrideBaseUrl,
      headers: headers,
      body: body,
    );
  }

  Future<Result<Response>> delete(
    String path, {
    String? overrideBaseUrl,
    Map<String, String>? headers,
    Object? body,
  }) async {
    await _accessTokenService.refreshTokenIfNeeded(_authService);
    return await _apiService.delete(
      path,
      overrideBaseUrl: overrideBaseUrl,
      headers: headers,
      body: body,
    );
  }

  Future<Result<Response>> patch(
    String path, {
    String? overrideBaseUrl,
    Map<String, String>? headers,
    Object? body,
  }) async {
    await _accessTokenService.refreshTokenIfNeeded(_authService);
    return await _apiService.patch(
      path,
      overrideBaseUrl: overrideBaseUrl,
      headers: headers,
      body: body,
    );
  }

  Future<Result<Response>> patchMultipart(
    String path, {
    String? overrideBaseUrl,
    required List<http.MultipartFile> files,
    Map<String, String>? fields,
  }) async {
    await _accessTokenService.refreshTokenIfNeeded(_authService);
    return await _apiService.patchMultipart(
      path,
      overrideBaseUrl: overrideBaseUrl,
      files: files,
      fields: fields,
    );
  }
}
