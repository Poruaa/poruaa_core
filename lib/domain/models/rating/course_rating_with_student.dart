class CourseRatingWithStudent {
  final int id;
  final int courseId;
  final int studentId;
  final int rating;
  final String? review;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String studentName;
  final String? studentPhone;

  CourseRatingWithStudent({
    required this.id,
    required this.courseId,
    required this.studentId,
    required this.rating,
    this.review,
    required this.createdAt,
    required this.updatedAt,
    required this.studentName,
    this.studentPhone,
  });

  factory CourseRatingWithStudent.zero() {
    final now = DateTime.now();
    return CourseRatingWithStudent(
      id: 0,
      courseId: 0,
      studentId: 0,
      rating: 0,
      review: null,
      createdAt: now,
      updatedAt: now,
      studentName: '',
      studentPhone: null,
    );
  }

  CourseRatingWithStudent copyWith({
    int? id,
    int? courseId,
    int? studentId,
    int? rating,
    String? review,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? studentName,
    String? studentPhone,
  }) {
    return CourseRatingWithStudent(
      id: id ?? this.id,
      courseId: courseId ?? this.courseId,
      studentId: studentId ?? this.studentId,
      rating: rating ?? this.rating,
      review: review ?? this.review,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      studentName: studentName ?? this.studentName,
      studentPhone: studentPhone ?? this.studentPhone,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CourseRatingWithStudent &&
        other.id == id &&
        other.courseId == courseId &&
        other.studentId == studentId &&
        other.rating == rating &&
        other.review == review &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.studentName == studentName &&
        other.studentPhone == studentPhone;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      courseId,
      studentId,
      rating,
      review,
      createdAt,
      updatedAt,
      studentName,
      studentPhone,
    );
  }
}
