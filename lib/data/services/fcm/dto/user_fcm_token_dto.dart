class UserFcmTokenDto {
  final int id;
  final int userId;
  final String fcmToken;
  final String app;
  final String? deviceName;
  final String? platform;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? lastUsedAt;

  UserFcmTokenDto({
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

  factory UserFcmTokenDto.fromJson(Map<String, dynamic> json) {
    return UserFcmTokenDto(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      fcmToken: json['fcm_token'] as String,
      app: json['app'] as String,
      deviceName: json['device_name'] as String?,
      platform: json['platform'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String).toLocal(),
      updatedAt: DateTime.parse(json['updated_at'] as String).toLocal(),
      lastUsedAt: json['last_used_at'] != null
          ? DateTime.parse(json['last_used_at'] as String).toLocal()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      'id': id,
      'user_id': userId,
      'fcm_token': fcmToken,
      'app': app,
      'created_at': createdAt.toUtc().toIso8601String(),
      'updated_at': updatedAt.toUtc().toIso8601String(),
    };
    if (deviceName != null) {
      json['device_name'] = deviceName;
    }
    if (platform != null) {
      json['platform'] = platform;
    }
    if (lastUsedAt != null) {
      json['last_used_at'] = lastUsedAt!.toUtc().toIso8601String();
    }
    return json;
  }
}
