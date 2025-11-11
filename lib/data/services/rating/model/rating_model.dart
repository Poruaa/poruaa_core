class CourseRatingModel {
  final int? id;
  final int courseId;
  final int studentId;
  final int rating;
  final String? review;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CourseRatingModel({
    this.id,
    required this.courseId,
    required this.studentId,
    required this.rating,
    this.review,
    this.createdAt,
    this.updatedAt,
  });

  factory CourseRatingModel.fromJson(Map<String, dynamic> json) {
    return CourseRatingModel(
      id: json['id'] is int
          ? json['id']
          : int.tryParse(json['id']?.toString() ?? ''),
      courseId: json['course_id'] is int
          ? json['course_id']
          : int.parse(json['course_id'].toString()),
      studentId: json['student_id'] is int
          ? json['student_id']
          : int.parse(json['student_id'].toString()),
      rating: json['rating'] is int
          ? json['rating']
          : int.parse(json['rating'].toString()),
      review: json['review'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'course_id': courseId,
      'student_id': studentId,
      'rating': rating,
      'review': review,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}

class ShortExamRatingModel {
  final int? id;
  final int shortExamId;
  final int studentId;
  final int rating;
  final String? review;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ShortExamRatingModel({
    this.id,
    required this.shortExamId,
    required this.studentId,
    required this.rating,
    this.review,
    this.createdAt,
    this.updatedAt,
  });

  factory ShortExamRatingModel.fromJson(Map<String, dynamic> json) {
    return ShortExamRatingModel(
      id: json['id'] is int
          ? json['id']
          : int.tryParse(json['id']?.toString() ?? ''),
      shortExamId: json['short_exam_id'] is int
          ? json['short_exam_id']
          : int.parse(json['short_exam_id'].toString()),
      studentId: json['student_id'] is int
          ? json['student_id']
          : int.parse(json['student_id'].toString()),
      rating: json['rating'] is int
          ? json['rating']
          : int.parse(json['rating'].toString()),
      review: json['review'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'short_exam_id': shortExamId,
      'student_id': studentId,
      'rating': rating,
      'review': review,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}

class CourseRatingWithStudentModel {
  final int id;
  final int courseId;
  final int studentId;
  final int rating;
  final String? review;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String studentName;
  final String? studentPhone;

  CourseRatingWithStudentModel({
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

  factory CourseRatingWithStudentModel.fromJson(Map<String, dynamic> json) {
    return CourseRatingWithStudentModel(
      id: json['id'] is int ? json['id'] : int.parse(json['id'].toString()),
      courseId: json['course_id'] is int
          ? json['course_id']
          : int.parse(json['course_id'].toString()),
      studentId: json['student_id'] is int
          ? json['student_id']
          : int.parse(json['student_id'].toString()),
      rating: json['rating'] is int
          ? json['rating']
          : int.parse(json['rating'].toString()),
      review: json['review'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      studentName: json['student_name'],
      studentPhone: json['student_phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'course_id': courseId,
      'student_id': studentId,
      'rating': rating,
      'review': review,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'student_name': studentName,
      'student_phone': studentPhone,
    };
  }
}

class ShortExamRatingWithStudentModel {
  final int id;
  final int shortExamId;
  final int studentId;
  final int rating;
  final String? review;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String studentName;
  final String? studentPhone;

  ShortExamRatingWithStudentModel({
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

  factory ShortExamRatingWithStudentModel.fromJson(Map<String, dynamic> json) {
    return ShortExamRatingWithStudentModel(
      id: json['id'] is int ? json['id'] : int.parse(json['id'].toString()),
      shortExamId: json['short_exam_id'] is int
          ? json['short_exam_id']
          : int.parse(json['short_exam_id'].toString()),
      studentId: json['student_id'] is int
          ? json['student_id']
          : int.parse(json['student_id'].toString()),
      rating: json['rating'] is int
          ? json['rating']
          : int.parse(json['rating'].toString()),
      review: json['review'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      studentName: json['student_name'],
      studentPhone: json['student_phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'short_exam_id': shortExamId,
      'student_id': studentId,
      'rating': rating,
      'review': review,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'student_name': studentName,
      'student_phone': studentPhone,
    };
  }
}

// Input models for creating/updating ratings
class CreateCourseRatingInput {
  final int courseId;
  final int rating;
  final String? review;

  CreateCourseRatingInput({
    required this.courseId,
    required this.rating,
    this.review,
  });

  Map<String, dynamic> toJson() {
    return {
      'course_id': courseId,
      'rating': rating,
      'review': review,
    };
  }
}

class CreateShortExamRatingInput {
  final int shortExamId;
  final int rating;
  final String? review;

  CreateShortExamRatingInput({
    required this.shortExamId,
    required this.rating,
    this.review,
  });

  Map<String, dynamic> toJson() {
    return {
      'short_exam_id': shortExamId,
      'rating': rating,
      'review': review,
    };
  }
}

class UpdateRatingInput {
  final int rating;
  final String? review;

  UpdateRatingInput({
    required this.rating,
    this.review,
  });

  Map<String, dynamic> toJson() {
    return {
      'rating': rating,
      'review': review,
    };
  }
}
