class ShortExamRatingWithStudent {
  final int id;
  final int shortExamId;
  final int studentId;
  final int rating;
  final String? review;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String studentName;
  final String? studentPhone;

  ShortExamRatingWithStudent({
    required this.id,
    required this.shortExamId,
    required this.studentId,
    required this.rating,
    this.review,
    required this.createdAt,
    required this.updatedAt,
    required this.studentName,
    this.studentPhone,
  });

  factory ShortExamRatingWithStudent.zero() {
    final now = DateTime.now();
    return ShortExamRatingWithStudent(
      id: 0,
      shortExamId: 0,
      studentId: 0,
      rating: 0,
      review: null,
      createdAt: now,
      updatedAt: now,
      studentName: '',
      studentPhone: null,
    );
  }

  ShortExamRatingWithStudent copyWith({
    int? id,
    int? shortExamId,
    int? studentId,
    int? rating,
    String? review,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? studentName,
    String? studentPhone,
  }) {
    return ShortExamRatingWithStudent(
      id: id ?? this.id,
      shortExamId: shortExamId ?? this.shortExamId,
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
    return other is ShortExamRatingWithStudent &&
        other.id == id &&
        other.shortExamId == shortExamId &&
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
      shortExamId,
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
