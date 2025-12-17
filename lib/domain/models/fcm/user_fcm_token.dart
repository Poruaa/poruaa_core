import 'package:poruaa_core/data/services/fcm/dto/user_fcm_token_dto.dart';

class UserFcmToken {
  final int id;
  final int userId;
  final String fcmToken;
  final String app;
  final String? deviceName;
  final String? platform;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? lastUsedAt;

  UserFcmToken({
    required this.id,
    required this.userId,
    required this.fcmToken,
    required this.app,
    this.deviceName,
    this.platform,
    required this.createdAt,
    required this.updatedAt,
    this.lastUsedAt,
  });

  factory UserFcmToken.fromDto(UserFcmTokenDto dto) {
    return UserFcmToken(
      id: dto.id,
      userId: dto.userId,
      fcmToken: dto.fcmToken,
      app: dto.app,
      deviceName: dto.deviceName,
      platform: dto.platform,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
      lastUsedAt: dto.lastUsedAt,
    );
  }

  UserFcmTokenDto toDto() {
    return UserFcmTokenDto(
      id: id,
      userId: userId,
      fcmToken: fcmToken,
      app: app,
      deviceName: deviceName,
      platform: platform,
      createdAt: createdAt,
      updatedAt: updatedAt,
      lastUsedAt: lastUsedAt,
    );
  }

  UserFcmToken copyWith({
    int? id,
    int? userId,
    String? fcmToken,
    String? app,
    String? deviceName,
    String? platform,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? lastUsedAt,
  }) {
    return UserFcmToken(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      fcmToken: fcmToken ?? this.fcmToken,
      app: app ?? this.app,
      deviceName: deviceName ?? this.deviceName,
      platform: platform ?? this.platform,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lastUsedAt: lastUsedAt ?? this.lastUsedAt,
    );
  }
}
