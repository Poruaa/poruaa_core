class RemoveFcmTokenInputDto {
  final String? fcmToken;
  final String? app;

  RemoveFcmTokenInputDto({this.fcmToken, this.app});

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (fcmToken != null) {
      json['fcm_token'] = fcmToken;
    }
    if (app != null) {
      json['app'] = app;
    }
    return json;
  }
}
