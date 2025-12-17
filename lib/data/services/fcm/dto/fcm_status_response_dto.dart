import 'package:poruaa_core/data/services/fcm/dto/fcm_token_info_dto.dart';

class FcmStatusResponseDto {
  final bool hasToken;
  final int tokenCount;
  final List<FcmTokenInfoDto> tokens;

  FcmStatusResponseDto({
    required this.hasToken,
    required this.tokenCount,
    required this.tokens,
  });

  factory FcmStatusResponseDto.fromJson(Map<String, dynamic> json) {
    return FcmStatusResponseDto(
      hasToken: json['has_token'] as bool,
      tokenCount: json['token_count'] as int,
      tokens: (json['tokens'] as List)
          .map((e) => FcmTokenInfoDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'has_token': hasToken,
      'token_count': tokenCount,
      'tokens': tokens.map((e) => e.toJson()).toList(),
    };
  }
}

