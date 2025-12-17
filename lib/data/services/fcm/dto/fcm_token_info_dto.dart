class FcmTokenInfoDto {
  final int id;
  final String fcmToken;
  final String app;
  final String? deviceName;
  final String? platform;
  final DateTime createdAt;
  final DateTime? lastUsedAt;

  FcmTokenInfoDto({
    required this.id,
    required this.fcmToken,
    required this.app,
    this.deviceName,
    this.platform,
    required this.createdAt,
    this.lastUsedAt,
  });

  factory FcmTokenInfoDto.fromJson(Map<String, dynamic> json) {
    return FcmTokenInfoDto(
      id: json['id'] as int,
      fcmToken: json['fcm_token'] as String,
      app: json['app'] as String,
      deviceName: json['device_name'] as String?,
      platform: json['platform'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String).toLocal(),
      lastUsedAt: json['last_used_at'] != null
          ? DateTime.parse(json['last_used_at'] as String).toLocal()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      'id': id,
      'fcm_token': fcmToken,
      'app': app,
      'created_at': createdAt.toUtc().toIso8601String(),
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
