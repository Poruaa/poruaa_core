import 'dart:convert';

import 'package:poruaa_core/data/services/authorized_api/authorized_api_service.dart';
import 'package:poruaa_core/data/services/fcm/dto/fcm_status_response_dto.dart';
import 'package:poruaa_core/data/services/fcm/dto/register_fcm_token_input_dto.dart';
import 'package:poruaa_core/data/services/fcm/dto/register_fcm_token_response_dto.dart';
import 'package:poruaa_core/data/services/fcm/dto/remove_fcm_token_input_dto.dart';
import 'package:poruaa_core/data/services/fcm/dto/remove_fcm_token_response_dto.dart';
import 'package:poruaa_core/data/services/fcm/fcm_service.dart';
import 'package:poruaa_core/utils/result.dart';

class FcmServiceImpl extends FcmService {
  final AuthorizedApiService _apiService;

  FcmServiceImpl(this._apiService);

  @override
  Future<Result<RegisterFcmTokenResponseDto>> registerToken(
    RegisterFcmTokenInputDto input,
  ) async {
    try {
      var result = await _apiService.post(
        'fcm/register',
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(input.toJson()),
      );

      switch (result) {
        case Ok():
          var response = result.value;
          if (response.statusCode != 200) {
            return Result.error(response.body);
          }
          var jsonBody = jsonDecode(response.body);
          var registerResponse = RegisterFcmTokenResponseDto.fromJson(jsonBody);
          return Result.ok(registerResponse);
        case Err():
          return Result.error("Connection error");
      }
    } catch (e) {
      return Result.error("Error: $e");
    }
  }

  @override
  Future<Result<RemoveFcmTokenResponseDto>> removeToken(
    RemoveFcmTokenInputDto input,
  ) async {
    try {
      var result = await _apiService.delete(
        'fcm/token',
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(input.toJson()),
      );

      switch (result) {
        case Ok():
          var response = result.value;
          if (response.statusCode != 200) {
            return Result.error(response.body);
          }
          var jsonBody = jsonDecode(response.body);
          var removeResponse = RemoveFcmTokenResponseDto.fromJson(jsonBody);
          return Result.ok(removeResponse);
        case Err():
          return Result.error("Connection error");
      }
    } catch (e) {
      return Result.error("Error: $e");
    }
  }

  @override
  Future<Result<FcmStatusResponseDto>> getStatus() async {
    try {
      var result = await _apiService.get('fcm/status');
      switch (result) {
        case Ok():
          var response = result.value;
          if (response.statusCode != 200) {
            return Result.error(response.body);
          }
          var jsonBody = jsonDecode(response.body);
          var statusResponse = FcmStatusResponseDto.fromJson(jsonBody);
          return Result.ok(statusResponse);
        case Err():
          return Result.error("Connection error");
      }
    } catch (e) {
      return Result.error("Error: $e");
    }
  }
}
