class SendCourseNotificationResponseDto {
  final bool success;
  final String message;
  final String topic;

  SendCourseNotificationResponseDto({
    required this.success,
    required this.message,
    required this.topic,
  });

  factory SendCourseNotificationResponseDto.fromJson(
    Map<String, dynamic> json,
  ) {
    return SendCourseNotificationResponseDto(
      success: json['success'] as bool,
      message: json['message'] as String,
      topic: json['topic'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'message': message, 'topic': topic};
  }
}
