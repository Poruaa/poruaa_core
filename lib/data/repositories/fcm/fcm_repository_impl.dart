import 'package:poruaa_core/data/repositories/fcm/fcm_repository.dart';
import 'package:poruaa_core/data/services/fcm/dto/register_fcm_token_input_dto.dart';
import 'package:poruaa_core/data/services/fcm/dto/remove_fcm_token_input_dto.dart';
import 'package:poruaa_core/data/services/fcm/fcm_service.dart';
import 'package:poruaa_core/domain/models/fcm/fcm_token_info.dart';
import 'package:poruaa_core/domain/models/fcm/user_fcm_token.dart';
import 'package:poruaa_core/utils/result.dart';

class FcmRepositoryImpl extends FcmRepository {
  final FcmService _fcmService;

  FcmRepositoryImpl(FcmService fcmService) : _fcmService = fcmService;

  @override
  Future<Result<UserFcmToken>> registerToken({
    required String fcmToken,
    String? app,
    String? deviceName,
    String? platform,
  }) async {
    var input = RegisterFcmTokenInputDto(
      fcmToken: fcmToken,
      app: app,
      deviceName: deviceName,
      platform: platform,
    );
    var result = await _fcmService.registerToken(input);
    switch (result) {
      case Ok():
        var userFcmToken = UserFcmToken.fromDto(result.value.token);
        return Result.ok(userFcmToken);
      case Err():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<String>> removeToken({String? fcmToken, String? app}) async {
    var input = RemoveFcmTokenInputDto(fcmToken: fcmToken, app: app);
    var result = await _fcmService.removeToken(input);
    switch (result) {
      case Ok():
        return Result.ok(result.value.message);
      case Err():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<FcmStatusResult>> getStatus() async {
    var result = await _fcmService.getStatus();
    switch (result) {
      case Ok():
        var response = result.value;
        var tokens = response.tokens
            .map((dto) => FcmTokenInfo.fromDto(dto))
            .toList();
        return Result.ok(
          FcmStatusResult(
            hasToken: response.hasToken,
            tokenCount: response.tokenCount,
            tokens: tokens,
          ),
        );
      case Err():
        return Result.error(result.error);
    }
  }
}
