import 'package:poruaa_core/data/services/fcm/dto/fcm_token_info_dto.dart';

class FcmTokenInfo {
  final int id;
  final String fcmToken;
  final String app;
  final String? deviceName;
  final String? platform;
  final DateTime createdAt;
  final DateTime? lastUsedAt;

  FcmTokenInfo({
    required this.id,
    required this.fcmToken,
    required this.app,
    this.deviceName,
    this.platform,
    required this.createdAt,
    this.lastUsedAt,
  });

  factory FcmTokenInfo.fromDto(FcmTokenInfoDto dto) {
    return FcmTokenInfo(
      id: dto.id,
      fcmToken: dto.fcmToken,
      app: dto.app,
      deviceName: dto.deviceName,
      platform: dto.platform,
      createdAt: dto.createdAt,
      lastUsedAt: dto.lastUsedAt,
    );
  }

  FcmTokenInfoDto toDto() {
    return FcmTokenInfoDto(
      id: id,
      fcmToken: fcmToken,
      app: app,
      deviceName: deviceName,
      platform: platform,
      createdAt: createdAt,
      lastUsedAt: lastUsedAt,
    );
  }

  FcmTokenInfo copyWith({
    int? id,
    String? fcmToken,
    String? app,
    String? deviceName,
    String? platform,
    DateTime? createdAt,
    DateTime? lastUsedAt,
  }) {
    return FcmTokenInfo(
      id: id ?? this.id,
      fcmToken: fcmToken ?? this.fcmToken,
      app: app ?? this.app,
      deviceName: deviceName ?? this.deviceName,
      platform: platform ?? this.platform,
      createdAt: createdAt ?? this.createdAt,
      lastUsedAt: lastUsedAt ?? this.lastUsedAt,
    );
  }
}
