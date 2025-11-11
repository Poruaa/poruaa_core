import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:poruaa_core/data/services/api/api_service.dart';
import 'package:poruaa_core/data/services/auth/auth_service.dart';
import 'package:poruaa_core/data/services/auth/model/auth_model.dart';
import 'package:poruaa_core/utils/result.dart';

class AuthServiceImpl extends AuthService {
  AuthServiceImpl(ApiService apiService) : _apiService = apiService;
  final ApiService _apiService;

  @override
  Future<Result<AuthModel>> refreshToken(String refreshToken) async {
    final response = await _apiService.post(
      'refresh-token',
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'refresh_token': refreshToken}),
    );
    switch (response) {
      case Ok():
        if (response.value.statusCode != 200) {
          return Result.error("Error: ${response.value.statusCode}");
        }
        var responseBody = jsonDecode(response.value.body);
        if (responseBody is Map<String, dynamic>) {
          var authModel = AuthModel.fromJson(responseBody);
          if (authModel != null) {
            return Result.ok(authModel);
          }
        }
        return Result.error("Error: ${response.value.statusCode}");
      case Err():
        return Result.error("Internal server error");
    }
  }

  @override
  Future<Result<AuthModel>> register(String email, String password) async {
    final response = await _apiService.post(
      'register',
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    switch (response) {
      case Ok():
        if (response.value.statusCode != 201) {
          if (response.value.statusCode == 400) {
            return Result.error("User might already exist try login instead.");
          } else {
            return Result.error("Something went wrong");
          }
        }
        var responseBody = jsonDecode(response.value.body);
        if (responseBody is Map<String, dynamic>) {
          var authModel = AuthModel.fromJson(responseBody);
          if (authModel != null) {
            return Result.ok(authModel);
          }
        }
        return Result.error("Error: something went wrong");
      case Err():
        return Result.error("Error: something went wrong");
    }
  }

  @override
  Future<Result<AuthModel>> login(String email, String password) async {
    final response = await _apiService.post(
      'login',
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    switch (response) {
      case Ok():
        if (response.value.statusCode != 200) {
          return Result.error("Username or password might be wrong");
        }
        var responseBody = jsonDecode(response.value.body);
        if (responseBody is Map<String, dynamic>) {
          var authModel = AuthModel.fromJson(responseBody);
          if (authModel != null) {
            return Result.ok(authModel);
          }
        }
        return Result.error("Something went wrong. Please try again");
      case Err():
        return Result.error("Something went wrong. Please try again");
    }
  }

  @override
  Future<Result<AuthModel>> loginWithGoogle(String authId) async {
    final response = await _apiService.post(
      'auth/google-id-token',
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'id_token': authId}),
    );
    switch (response) {
      case Ok():
        if (response.value.statusCode != 200) {
          return Result.error("Username or password might be wrong");
        }
        var responseBody = jsonDecode(response.value.body);
        if (responseBody is Map<String, dynamic>) {
          var authModel = AuthModel.fromJson(responseBody);
          if (authModel != null) {
            return Result.ok(authModel);
          }
        }
        return Result.error("Something went wrong. Please try again");
      case Err():
        return Result.error("Something went wrong. Please try again");
    }
  }

  @override
  Future<Result<void>> logout() async {
    try {
      // Get the refresh token from storage
      final refreshToken = await _apiService.getRefreshToken();
      if (refreshToken == null) {
        return Result.error("No refresh token found");
      }

      // Call the backend logout endpoint
      final response = await _apiService.post(
        'logout',
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'refresh_token': refreshToken}),
      );

      switch (response) {
        case Ok():
          if (response.value.statusCode == 200) {
            return Result.ok(null);
          } else {
            return Result.error("Logout failed: ${response.value.statusCode}");
          }
        case Err():
          return Result.error("Logout failed: ${response.error}");
      }
    } catch (e) {
      debugPrint("Logout error: $e");
      return Result.error("Logout error: $e");
    }
  }

  // switchProfile() async {
  //   if (user == null) {
  //     return;
  //   }
  //   if (user is StudentUserModel) {
  //     user = await getTeacher();
  //   } else {
  //     user = await getStudent();
  //   }
  //   notifyListeners();
  // }

  // Future<void> initialize() async {
  //   try {
  //     token = await getToken();
  //     if (token != null) {
  //       user = await getAnyUser();
  //     }
  //     notifyListeners();
  //   } catch (_) {}
  // }

  @override
  String? get accessToken => throw UnimplementedError();

  @override
  Future<Result<void>> requestPasswordReset(String email) async {
    final response = await _apiService.post(
      'auth/request-password-reset',
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email}),
    );
    switch (response) {
      case Ok():
        if (response.value.statusCode == 200) {
          return Result.ok(null);
        } else if (response.value.statusCode == 400) {
          return Result.error("Invalid email format");
        } else if (response.value.statusCode == 429) {
          return Result.error(
            "Too many requests. Please wait 5 minutes before trying again",
          );
        } else {
          return Result.error("Something went wrong. Please try again");
        }
      case Err():
        return Result.error("Something went wrong. Please try again");
    }
  }
}
