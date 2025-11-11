import 'package:flutter/material.dart';
import 'package:poruaa_core/data/services/access_token/model/access_token.dart';
import 'package:poruaa_core/data/services/auth/auth_service.dart';
import 'package:poruaa_core/data/services/storage/storage_service.dart';
import 'package:poruaa_core/utils/result.dart';

class AccessTokenService {
  final StorageService _storageService;

  AccessTokenService(StorageService storageService)
    : _storageService = storageService;

  Future<Result<void>> setToken(String token, String refreshToken) async {
    try {
      await _storageService.write("Authorization", token);
    } catch (e) {
      debugPrint("Token write error.");
      return Err(e.toString());
    }
    var refreshTokenResult = await setRefreshToken(refreshToken);
    if (refreshTokenResult case Err(:final error)) {
      return Err(error.toString());
    }
    return Ok(null);
  }

  Future<Result<void>> setRefreshToken(String refreshToken) async {
    try {
      await _storageService.write("refreshToken", refreshToken);
      return Ok(null);
    } catch (e) {
      debugPrint("Token write error.");
      return Err(e.toString());
    }
  }

  Future<void> deleteToken() async {
    await deleteRefreshToken();
    await _storageService.delete("Authorization");
  }

  Future<void> deleteRefreshToken() async {
    await _storageService.delete("refreshToken");
  }

  Future<AccessToken?> getToken() async {
    var result = await _storageService.read("Authorization");
    if (result is! String) {
      return null;
    }
    return AccessToken.fromString(result);
  }

  Future<String?> getRefreshToken() async {
    var value = await _storageService.read("refreshToken");
    return value;
  }

  Future<AccessToken?> _refreshToken(
    String refreshToken,
    AuthService authService,
  ) async {
    var token = await authService.refreshToken(refreshToken);
    if (token case Ok(:final value)) {
      await setToken(value.token.tokenString, value.refreshToken);
      return value.token;
    }
    return null;
  }

  Future<AccessToken?> refreshToken(AuthService authService) async {
    var refreshToken = await getRefreshToken();
    if (refreshToken == null) {
      return null;
    }
    var result = _refreshToken(refreshToken, authService);
    return result;
  }

  Future<AccessToken?> refreshTokenIfNeeded(AuthService authService) async {
    var refreshToken = await getRefreshToken();
    if (refreshToken == null) {
      return null;
    }
    var token = await getToken();
    if (token == null) {
      return _refreshToken(refreshToken, authService);
    }

    if (token.isExpired()) {
      return _refreshToken(refreshToken, authService);
    } else {
      return token;
    }
  }
}
