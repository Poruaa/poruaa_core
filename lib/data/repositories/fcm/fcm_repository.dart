import 'package:poruaa_core/domain/models/fcm/fcm_token_info.dart';
import 'package:poruaa_core/domain/models/fcm/user_fcm_token.dart';
import 'package:poruaa_core/utils/result.dart';

class FcmStatusResult {
  final bool hasToken;
  final int tokenCount;
  final List<FcmTokenInfo> tokens;

  FcmStatusResult({
    required this.hasToken,
    required this.tokenCount,
    required this.tokens,
  });
}

abstract class FcmRepository {
  /// Register or update an FCM token for the current user
  ///
  /// [fcmToken] - Required: FCM token from Firebase
  /// [app] - Optional: App identifier (defaults to "poruaa")
  /// [deviceName] - Optional: Device name (e.g., "iPhone 13 Pro")
  /// [platform] - Optional: "ios", "android", or "web"
  Future<Result<UserFcmToken>> registerToken({
    required String fcmToken,
    String? app,
    String? deviceName,
    String? platform,
  });

  /// Remove a specific FCM token or all tokens for the current user
  ///
  /// [fcmToken] - Optional: If omitted, removes all tokens
  /// [app] - Optional: App identifier (defaults to "poruaa")
  Future<Result<String>> removeToken({
    String? fcmToken,
    String? app,
  });

  /// Get all registered FCM tokens for the current user
  Future<Result<FcmStatusResult>> getStatus();
}

