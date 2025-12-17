import 'package:poruaa_core/data/services/fcm/dto/fcm_status_response_dto.dart';
import 'package:poruaa_core/data/services/fcm/dto/register_fcm_token_input_dto.dart';
import 'package:poruaa_core/data/services/fcm/dto/register_fcm_token_response_dto.dart';
import 'package:poruaa_core/data/services/fcm/dto/remove_fcm_token_input_dto.dart';
import 'package:poruaa_core/data/services/fcm/dto/remove_fcm_token_response_dto.dart';
import 'package:poruaa_core/utils/result.dart';

abstract class FcmService {
  /// Register or update an FCM token for the current user
  ///
  /// [input] - FCM token registration input with token, app, device name, and platform
  Future<Result<RegisterFcmTokenResponseDto>> registerToken(
    RegisterFcmTokenInputDto input,
  );

  /// Remove a specific FCM token or all tokens for the current user
  ///
  /// [input] - Remove token input. If fcmToken is omitted, removes all tokens
  Future<Result<RemoveFcmTokenResponseDto>> removeToken(
    RemoveFcmTokenInputDto input,
  );

  /// Get all registered FCM tokens for the current user
  Future<Result<FcmStatusResponseDto>> getStatus();
}
