import 'package:poruaa_core/data/services/fcm/dto/user_fcm_token_dto.dart';

class RegisterFcmTokenResponseDto {
  final bool success;
  final UserFcmTokenDto token;

  RegisterFcmTokenResponseDto({required this.success, required this.token});

  factory RegisterFcmTokenResponseDto.fromJson(Map<String, dynamic> json) {
    return RegisterFcmTokenResponseDto(
      success: json['success'] as bool,
      token: UserFcmTokenDto.fromJson(json['token'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'token': token.toJson()};
  }
}
