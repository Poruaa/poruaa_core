class FlatCourseEnrollmentModel {
  final int id;
  final int? studentId;
  final int? enrollmentId;
  final String name;
  final String subTitle;
  final String thumbnail;
  final num price;
  final num regularPrice;
  final int teacherId;
  final int enrollmentCount;
  final double rating;
  final int star1Count;
  final int star2Count;
  final int star3Count;
  final int star4Count;
  final int star5Count;

  const FlatCourseEnrollmentModel({
    required this.id,
    required this.studentId,
    required this.enrollmentId,
    required this.name,
    required this.subTitle,
    required this.thumbnail,
    required this.price,
    required this.regularPrice,
    required this.teacherId,
    required this.enrollmentCount,
    required this.rating,
    required this.star1Count,
    required this.star2Count,
    required this.star3Count,
    required this.star4Count,
    required this.star5Count,
  });

  static FlatCourseEnrollmentModel fromMap(Map<String, dynamic> map) {
    return FlatCourseEnrollmentModel(
      id: map['id'],
      studentId: map['student_id'],
      enrollmentId: map['enrollment_id'],
      name: map['name'],
      subTitle: map['sub_title'] ?? "",
      thumbnail: map['thumbnail'] ?? "",
      price: map['price'],
      regularPrice: map['regular_price'] ?? map['price'],
      teacherId: map['teacher_id'],
      enrollmentCount: map['enrollment_count'],
      rating: map['rating'],
      star1Count: map['star_1_count'] ?? 0,
      star2Count: map['star_2_count'] ?? 0,
      star3Count: map['star_3_count'] ?? 0,
      star4Count: map['star_4_count'] ?? 0,
      star5Count: map['star_5_count'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'student_id': studentId,
      'enrollment_id': enrollmentId,
      'name': name,
      'sub_title': subTitle,
      'price': price,
      'regular_price': regularPrice,
      'teacher_id': teacherId,
    };
  }

  FlatCourseEnrollmentModel copyWith({
    int? id,
    int? studentId,
    int? enrollmentId,
    String? name,
    String? subTitle,
    String? thumbnail,
    num? price,
    num? regularPrice,
    int? teacherId,
    int? enrollmentCount,
    double? rating,
    int? star1Count,
    int? star2Count,
    int? star3Count,
    int? star4Count,
    int? star5Count,
  }) {
    return FlatCourseEnrollmentModel(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      enrollmentId: enrollmentId ?? this.enrollmentId,
      name: name ?? this.name,
      subTitle: subTitle ?? this.subTitle,
      thumbnail: thumbnail ?? this.thumbnail,
      price: price ?? this.price,
      regularPrice: regularPrice ?? this.regularPrice,
      teacherId: teacherId ?? this.teacherId,
      enrollmentCount: enrollmentCount ?? this.enrollmentCount,
      rating: rating ?? this.rating,
      star1Count: star1Count ?? this.star1Count,
      star2Count: star2Count ?? this.star2Count,
      star3Count: star3Count ?? this.star3Count,
      star4Count: star4Count ?? this.star4Count,
      star5Count: star5Count ?? this.star5Count,
    );
  }
}
