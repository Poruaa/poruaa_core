import 'package:drift/drift.dart';
import 'package:poruaa_core/data/dao/db/database.dart';
import 'package:poruaa_core/data/services/course/model/course_enrollment_model.dart';
import 'package:poruaa_core/data/services/course/model/course_model.dart';

class Course {
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
  final DateTime expiresAt;
  final int? examCount;
  final int? materialCount;

  Course({
    required this.id,
    required this.name,
    required this.subTitle,
    required this.thumbnail,
    required this.price,
    required this.regularPrice,
    required this.enrollmentCount,
    required this.rating,
    required this.star1Count,
    required this.star2Count,
    required this.star3Count,
    required this.star4Count,
    required this.star5Count,
    required this.teacherId,
    this.teacherName,
    required this.isUnlisted,
    this.isEnrolled,
    required this.expiresAt,
    required this.examCount,
    this.materialCount,
  });

  factory Course.fromModel(CourseModel courseModel) {
    return Course(
      id: courseModel.id,
      name: courseModel.name,
      subTitle: courseModel.subTitle,
      thumbnail: courseModel.thumbnail,
      price: courseModel.price,
      regularPrice: courseModel.regularPrice,
      enrollmentCount: courseModel.enrollmentCount,
      rating: courseModel.rating,
      star1Count: courseModel.star1Count,
      star2Count: courseModel.star2Count,
      star3Count: courseModel.star3Count,
      star4Count: courseModel.star4Count,
      star5Count: courseModel.star5Count,
      teacherId: courseModel.teacherId,
      teacherName: courseModel.teacherName,
      isEnrolled: courseModel.isEnrolled,
      isUnlisted: courseModel.isUnlisted,
      expiresAt: courseModel.expiresAt,
      examCount: courseModel.examCount ?? 0, // Default to 0 if not provided
      materialCount:
          courseModel.materialCount ?? 0, // Default to 0 if not provided
    );
  }

  factory Course.zero() {
    return Course(
      id: 0,
      name: "",
      subTitle: "",
      thumbnail: "",
      price: 0,
      regularPrice: 0,
      enrollmentCount: 0,
      rating: 0,
      star1Count: 0,
      star2Count: 0,
      star3Count: 0,
      star4Count: 0,
      star5Count: 0,
      teacherId: 0,
      teacherName: null,
      isUnlisted: false,
      isEnrolled: false,
      examCount: 0,
      materialCount: 0,
      expiresAt: DateTime.now().add(const Duration(days: 365)), // Default to
    );
  }

  Course copyWith({
    int? id,
    String? name,
    String? subTitle,
    String? thumbnail,
    num? price,
    num? regularPrice,
    int? enrollmentCount,
    double? rating,
    int? star1Count,
    int? star2Count,
    int? star3Count,
    int? star4Count,
    int? star5Count,
    int? teacherId,
    String? teacherName,
    bool? isEnrolled,
    bool? isUnlisted,
    DateTime? expiresAt,
    int? examCount,
    int? materialCount,
  }) {
    return Course(
      id: id ?? this.id,
      name: name ?? this.name,
      subTitle: subTitle ?? this.subTitle,
      thumbnail: thumbnail ?? this.thumbnail,
      price: price ?? this.price,
      regularPrice: regularPrice ?? this.regularPrice,
      enrollmentCount: enrollmentCount ?? this.enrollmentCount,
      rating: rating ?? this.rating,
      star1Count: star1Count ?? this.star1Count,
      star2Count: star2Count ?? this.star2Count,
      star3Count: star3Count ?? this.star3Count,
      star4Count: star4Count ?? this.star4Count,
      star5Count: star5Count ?? this.star5Count,
      teacherId: teacherId ?? this.teacherId,
      teacherName: teacherName ?? this.teacherName,
      isEnrolled: isEnrolled ?? this.isEnrolled,
      examCount: examCount ?? this.examCount, // Exam count is not copied
      materialCount:
          materialCount ?? this.materialCount, // Material count is not copied
      isUnlisted:
          isUnlisted ?? this.isUnlisted, // Unlisted status is not copied
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }

  factory Course.fromCourseEnrollmentModel(
      FlatCourseEnrollmentModel courseModel) {
    // Enrollment? enrollment = switch (courseModel) {
    //   FlatCourseEnrollmentModel(
    //     id: var courseId,
    //     studentId: var studentId?,
    //     enrollmentId: var id?
    //   ) =>
    //     Enrollment(id: id, courseId: courseId, studentId: studentId),
    //   _ => null,
    // };

    return Course(
      id: courseModel.id,
      name: courseModel.name,
      subTitle: courseModel.subTitle,
      thumbnail: courseModel.thumbnail,
      price: courseModel.price,
      regularPrice: courseModel.regularPrice,
      enrollmentCount: courseModel.enrollmentCount,
      rating: courseModel.rating,
      star1Count: courseModel.star1Count,
      star2Count: courseModel.star2Count,
      star3Count: courseModel.star3Count,
      star4Count: courseModel.star4Count,
      star5Count: courseModel.star5Count,
      teacherId: courseModel.teacherId,
      teacherName: null, // Default empty string for enrollment model
      isUnlisted: false,
      examCount: 0,
      materialCount: 0,
      expiresAt: DateTime.now().add(const Duration(days: 365)),
      // isUnlisted: courseModel.isUnlisted,
      // isEnrolled: courseModel.
    );
  }

  static Course fromItem(CourseItem item) {
    return Course(
      id: item.id,
      name: item.name,
      subTitle: item.subTitle ?? "",
      thumbnail: item.thumbnail ?? "",
      price: item.price,
      regularPrice: item.regularPrice ?? item.price,
      enrollmentCount: item.enrollmentCount,
      rating: item.rating,
      star1Count: item.star1Count,
      star2Count: item.star2Count,
      star3Count: item.star3Count,
      star4Count: item.star4Count,
      star5Count: item.star5Count,
      teacherId: item.teacherId,
      teacherName: item.teacherName, // Use the teacher name from the database
      isEnrolled: item.isEnrolled,
      isUnlisted: item.isUnlisted,
      expiresAt: item.expiresAt,
      examCount: item.examCount, // Default to 0 if not provided
      materialCount: item.materialCount, // Default to 0 if not provided
      // expiresAt:
    );
  }

  CourseItemsCompanion toCourseItemCompanion() {
    return CourseItemsCompanion(
      id: Value(id),
      name: Value(name),
      subTitle: Value(subTitle),
      thumbnail: Value(thumbnail),
      price: Value(price.toDouble()),
      regularPrice: Value(regularPrice.toDouble()),
      teacherId: Value(teacherId),
      teacherName: Value(teacherName),
      isEnrolled: Value(isEnrolled ?? false),
      rating: Value(rating),
      enrollmentCount: Value(enrollmentCount),
      star1Count: Value(star1Count),
      star2Count: Value(star2Count),
      star3Count: Value(star3Count),
      star4Count: Value(star4Count),
      star5Count: Value(star5Count),
      isUnlisted: Value(isUnlisted),
      expiresAt: Value(expiresAt),
      createdAt: Value(DateTime.now()), // Assuming createdAt is now
      examCount: Value(examCount ?? 0), // Default to 0 if not provided
      materialCount: Value(materialCount ?? 0), // Default to 0 if not provided
    );
  }

  CourseModel toModel() {
    return CourseModel(
      id,
      name,
      subTitle,
      thumbnail,
      price,
      regularPrice,
      teacherId,
      teacherName,
      isEnrolled,
      enrollmentCount,
      rating,
      star1Count,
      star2Count,
      star3Count,
      star4Count,
      star5Count,
      isUnlisted,
      expiresAt: expiresAt,
      examCount: examCount ?? 0, // Default to 0 if not provided
      materialCount: materialCount ?? 0, // Default to 0 if not provided
    );
  }
}
