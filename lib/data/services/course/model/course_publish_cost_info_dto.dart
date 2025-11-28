class CoursePublishCostInfoDTO {
  final int courseId;
  final double perExamCost;
  final DateTime publishedAt;
  final DateTime expiresAt;
  final int examCount;
  final int courseDuration;
  final double courseCost;
  final double targetCoursePrice;
  final double currentCoursePrice;
  final bool isPriceValid;
  final bool canPublish;
  final String message;

  CoursePublishCostInfoDTO({
    required this.courseId,
    required this.perExamCost,
    required this.publishedAt,
    required this.expiresAt,
    required this.examCount,
    required this.courseDuration,
    required this.courseCost,
    required this.targetCoursePrice,
    required this.currentCoursePrice,
    required this.isPriceValid,
    required this.canPublish,
    required this.message,
  });

  factory CoursePublishCostInfoDTO.fromJson(Map<String, dynamic> json) {
    return CoursePublishCostInfoDTO(
      courseId: json['course_id'] as int,
      perExamCost: (json['per_exam_cost'] as num).toDouble(),
      publishedAt: DateTime.parse(json['published_at'] as String).toLocal(),
      expiresAt: DateTime.parse(json['expires_at'] as String).toLocal(),
      examCount: json['exam_count'] as int,
      courseDuration: json['course_duration'] as int,
      courseCost: (json['course_cost'] as num).toDouble(),
      targetCoursePrice: (json['target_course_price'] as num).toDouble(),
      currentCoursePrice: (json['current_course_price'] as num).toDouble(),
      isPriceValid: json['is_price_valid'] as bool,
      canPublish: json['can_publish'] as bool,
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'course_id': courseId,
      'per_exam_cost': perExamCost,
      'published_at': publishedAt.toUtc().toIso8601String(),
      'expires_at': expiresAt.toUtc().toIso8601String(),
      'exam_count': examCount,
      'course_duration': courseDuration,
      'course_cost': courseCost,
      'target_course_price': targetCoursePrice,
      'current_course_price': currentCoursePrice,
      'is_price_valid': isPriceValid,
      'can_publish': canPublish,
      'message': message,
    };
  }
}
