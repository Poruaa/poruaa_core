import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:poruaa_core/config/poruaa_app_config.dart';
import 'package:poruaa_core/data/services/access_token/access_token_service.dart';
import 'package:poruaa_core/data/services/device_info/device_info_service.dart';
import 'package:poruaa_core/utils/result.dart';
import 'package:http/http.dart' as http;

import 'api_service.dart';
import 'model/response.dart';

class _Client extends http.BaseClient {
  final AccessTokenService accessTokenService;
  final http.Client _inner;
  final String userAgent;

  _Client(this.accessTokenService, this.userAgent) : _inner = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    if (kDebugMode) {
      await Future.delayed(Duration(milliseconds: 300));
    }

    // Add detailed device information as User-Agent
    request.headers['User-Agent'] = userAgent;

    var jwtToken = await accessTokenService.getToken();
    if (jwtToken != null && (jwtToken.tokenString.isNotEmpty)) {
      request.headers['Authorization'] = 'Bearer ${jwtToken.tokenString}';
    }
    return _inner.send(request);
  }

  @override
  void close() {
    _inner.close();
  }
}

final class ApiServiceImpl extends ApiService {
  @override
  String get hostname => _config.baseUrl;
  // static const String hostname = kDebugMode
  //     ? "http://localhost:8080"
  //     : "https://api.poruaa.com";
  // static const String hostname =
  //     kDebugMode ? "http://192.168.0.141:8080" : "https://api.poruaa.com";
  // static const String hostname =
  //     kDebugMode ? "https://api.poruaa.com" : "https://api.poruaa.com";
  // String hostname = "https://api.poruaa.com";
  // String hostname = "http://192.168.0.200:8080";
  // static String hostname =
  //     "https://bidda-pith-full-stack-389977953443.asia-southeast1.run.app";
  ApiServiceImpl(PoruaaAppConfig config, AccessTokenService authService)
    : _accessTokenService = authService,
      _config = config;

  final PoruaaAppConfig _config;
  final AccessTokenService _accessTokenService;
  final DeviceInfoService _deviceInfoService = DeviceInfoService();

  // Cache the user agent to avoid async calls in sync context
  String? _cachedUserAgent;

  http.BaseClient get _client {
    return _Client(_accessTokenService, _getUserAgent());
  }

  /// Get detailed device information for User-Agent
  String _getUserAgent() {
    if (_cachedUserAgent != null) {
      return _cachedUserAgent!;
    }

    try {
      // Use simple device type as fallback
      _cachedUserAgent = _deviceInfoService.getSimpleDeviceType();
      return _cachedUserAgent!;
    } catch (e) {
      _cachedUserAgent = 'PoruaaApp/1.0 (Unknown Device)';
      return _cachedUserAgent!;
    }
  }

  /// Initialize detailed device information (call this once at app startup)
  Future<void> initializeDeviceInfo() async {
    try {
      _cachedUserAgent = await _deviceInfoService.getDetailedDeviceInfo();
    } catch (e) {
      _cachedUserAgent = _deviceInfoService.getSimpleDeviceType();
    }
  }

  @override
  Future<Result<Response>> get(
    String path, {
    String? overrideBaseUrl,
    Map<String, String>? headers,
  }) async {
    final Uri url = Uri.parse('${overrideBaseUrl ?? hostname}/$path');
    try {
      var response = await _client.get(url, headers: headers);
      var result = Result.ok(Response.fromHttpResponse(response));
      return result;
    } catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<Response>> post(
    String path, {
    String? overrideBaseUrl,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final Uri url = Uri.parse('${overrideBaseUrl ?? hostname}/$path');
    try {
      var response = await _client.post(
        url,
        headers: headers,
        body: body,
        encoding: encoding,
      );
      var result = Result.ok(Response.fromHttpResponse(response));
      return result;
    } catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<Response>> put(
    String path, {
    String? overrideBaseUrl,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final Uri url = Uri.parse('${overrideBaseUrl ?? hostname}/$path');
    try {
      var response = await _client.put(
        url,
        headers: headers,
        body: body,
        encoding: encoding,
      );
      var result = Result.ok(Response.fromHttpResponse(response));
      return result;
    } catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<Response>> delete(
    String path, {
    String? overrideBaseUrl,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final Uri url = Uri.parse('${overrideBaseUrl ?? hostname}/$path');
    try {
      var response = await _client.delete(
        url,
        headers: headers,
        body: body,
        encoding: encoding,
      );
      var result = Result.ok(Response.fromHttpResponse(response));
      return result;
    } catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<Response>> patch(
    String path, {
    String? overrideBaseUrl,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    final Uri url = Uri.parse('${overrideBaseUrl ?? hostname}/$path');
    try {
      var response = await _client.patch(
        url,
        headers: headers,
        body: body,
        encoding: encoding,
      );
      var result = Result.ok(Response.fromHttpResponse(response));
      return result;
    } catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<Response>> patchMultipart(
    String path, {
    String? overrideBaseUrl,
    required List<http.MultipartFile> files,
    Map<String, String>? fields,
  }) async {
    final uri = Uri.parse('${overrideBaseUrl ?? hostname}/$path');
    final client = _Client(_accessTokenService, _getUserAgent());

    final request = http.MultipartRequest('PATCH', uri);

    // Attach fields if any
    if (fields != null) {
      request.fields.addAll(fields);
    }

    // Attach files
    request.files.addAll(files);

    try {
      final streamed = await client.send(request);
      final response = await http.Response.fromStream(streamed);
      return Result.ok(Response.fromHttpResponse(response));
    } catch (e) {
      return Result.error(e.toString());
    } finally {
      client.close();
    }
  }

  @override
  Future<String?> getRefreshToken() async {
    return await _accessTokenService.getRefreshToken();
  }
}
