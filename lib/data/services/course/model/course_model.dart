class CourseModel {
  final int id;
  final String name;
  final String subTitle;
  final String thumbnail;
  final num price;
  final num regularPrice;
  final int teacherId;
  final String? teacherName;
  final int enrollmentCount;
  final double rating;
  final int star1Count;
  final int star2Count;
  final int star3Count;
  final int star4Count;
  final int star5Count;
  final bool? isEnrolled;
  final bool isUnlisted;
  final DateTime? createdAt;
  final DateTime? publishedAt;
  final DateTime expiresAt;
  final int? examCount;
  final int? materialCount;

  CourseModel(
    this.id,
    this.name,
    this.subTitle,
    this.thumbnail,
    this.price,
    this.regularPrice,
    this.teacherId,
    this.teacherName,
    this.isEnrolled,
    this.enrollmentCount,
    this.rating,
    this.star1Count,
    this.star2Count,
    this.star3Count,
    this.star4Count,
    this.star5Count,
    this.isUnlisted, {
    this.createdAt,
    this.publishedAt,
    required this.examCount,
    this.materialCount,
    required this.expiresAt,
  });

  static CourseModel fromJson(Map<String, dynamic> json) {
    return CourseModel(
      json["id"],
      json["name"],
      json["sub_title"] ?? "",
      json["thumbnail"] ?? "",
      json["price"],
      json["regular_price"] ?? json["price"],
      json["teacher_id"],
      json["teacher_name"],
      json["is_enrolled"],
      json["enrollment_count"],
      json["rating"],
      json["star_1_count"] ?? 0,
      json["star_2_count"] ?? 0,
      json["star_3_count"] ?? 0,
      json["star_4_count"] ?? 0,
      json["star_5_count"] ?? 0,
      json["is_unlisted"] ?? false,
      publishedAt: json["published_at"] != null
          ? DateTime.parse(json["published_at"]).toLocal()
          : null,
      examCount: json["exam_count"] ?? 0,
      materialCount: json["material_count"] ?? 0,
      expiresAt: DateTime.parse(json["expires_at"]).toLocal(),
    );
  }
}
