class ShortExamRating {
  final int id;
  final int shortExamId;
  final int studentId;
  final int rating;
  final String? review;
  final DateTime createdAt;
  final DateTime updatedAt;

  ShortExamRating({
    required this.id,
    required this.shortExamId,
    required this.studentId,
    required this.rating,
    this.review,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ShortExamRating.zero() {
    final now = DateTime.now();
    return ShortExamRating(
      id: 0,
      shortExamId: 0,
      studentId: 0,
      rating: 0,
      review: null,
      createdAt: now,
      updatedAt: now,
    );
  }

  ShortExamRating copyWith({
    int? id,
    int? shortExamId,
    int? studentId,
    int? rating,
    String? review,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ShortExamRating(
      id: id ?? this.id,
      shortExamId: shortExamId ?? this.shortExamId,
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
    return other is ShortExamRating &&
        other.id == id &&
        other.shortExamId == shortExamId &&
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
      shortExamId,
      studentId,
      rating,
      review,
      createdAt,
      updatedAt,
    );
  }
}
