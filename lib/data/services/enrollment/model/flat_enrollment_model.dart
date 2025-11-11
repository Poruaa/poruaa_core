class FlatEnrollmentModel {
  final int id;
  final int studentId;
  final int courseId;
  final String name;
  final String subTitle;
  final String thumbnail;
  final num price;
  final num regularPrice;
  final int teacherId;

  const FlatEnrollmentModel({
    required this.id,
    required this.studentId,
    required this.courseId,
    required this.name,
    required this.subTitle,
    required this.thumbnail,
    required this.price,
    required this.regularPrice,
    required this.teacherId,
  });

  static FlatEnrollmentModel fromMap(Map<String, dynamic> map) {
    return FlatEnrollmentModel(
      id: map['id'],
      studentId: map['student_id'],
      courseId: map['course_id'],
      name: map['name'],
      subTitle: map['sub_title'],
      thumbnail: map['thumbnail'] ?? '',
      price: map['price'],
      regularPrice: map['regular_price'],
      teacherId: map['teacher_id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'student_id': studentId,
      'course_id': courseId,
      'name': name,
      'sub_title': subTitle,
      'thumbnail': thumbnail,
      'price': price,
      'regular_price': regularPrice,
      'teacher_id': teacherId,
    };
  }

  FlatEnrollmentModel copyWith({
    int? id,
    int? studentId,
    int? courseId,
    String? name,
    String? subTitle,
    String? thumbnail,
    num? price,
    num? regularPrice,
    int? teacherId,
  }) {
    return FlatEnrollmentModel(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      courseId: courseId ?? this.courseId,
      name: name ?? this.name,
      subTitle: subTitle ?? this.subTitle,
      thumbnail: thumbnail ?? this.thumbnail,
      price: price ?? this.price,
      regularPrice: regularPrice ?? this.regularPrice,
      teacherId: teacherId ?? this.teacherId,
    );
  }
}
