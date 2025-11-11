class CourseRating {
  final int id;
  final int courseId;
  final int studentId;
  final int rating;
  final String? review;
  final DateTime createdAt;
  final DateTime updatedAt;

  CourseRating({
    required this.id,
    required this.courseId,
    required this.studentId,
    required this.rating,
    this.review,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CourseRating.zero() {
    final now = DateTime.now();
    return CourseRating(
      id: 0,
      courseId: 0,
      studentId: 0,
      rating: 0,
      review: null,
      createdAt: now,
      updatedAt: now,
    );
  }

  CourseRating copyWith({
    int? id,
    int? courseId,
    int? studentId,
    int? rating,
    String? review,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CourseRating(
      id: id ?? this.id,
      courseId: courseId ?? this.courseId,
      studentId: studentId ?? this.studentId,
      rating: rating ?? this.rating,
      review: review ?? this.review,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CourseRating &&
        other.id == id &&
        other.courseId == courseId &&
        other.studentId == studentId &&
        other.rating == rating &&
        other.review == review &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
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
    );
  }
}
