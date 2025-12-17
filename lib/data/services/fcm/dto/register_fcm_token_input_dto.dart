class RegisterFcmTokenInputDto {
  final String fcmToken;
  final String? app;
  final String? deviceName;
  final String? platform;

  RegisterFcmTokenInputDto({
    required this.fcmToken,
    this.app,
    this.deviceName,
    this.platform,
  });

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{'fcm_token': fcmToken};
    if (app != null) {
      json['app'] = app;
    }
    if (deviceName != null) {
      json['device_name'] = deviceName;
    }
    if (platform != null) {
      json['platform'] = platform;
    }
    return json;
  }
}
