class SendCourseNotificationInputDto {
  final String title;
  final String body;
  final Map<String, dynamic>? data;

  SendCourseNotificationInputDto({
    required this.title,
    required this.body,
    this.data,
  });

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{'title': title, 'body': body};
    if (data != null) {
      json['data'] = data;
    }
    return json;
  }
}
