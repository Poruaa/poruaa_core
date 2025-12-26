class SendTeacherTopicNotificationResponse {
  final bool success;
  final String message;
  final String topic;

  SendTeacherTopicNotificationResponse({
    required this.success,
    required this.message,
    required this.topic,
  });

  factory SendTeacherTopicNotificationResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return SendTeacherTopicNotificationResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      topic: json['topic'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'message': message, 'topic': topic};
  }
}
