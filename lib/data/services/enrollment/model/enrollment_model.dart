class EnrollmentModel {
  final int id;
  final int studentId;
  final int courseId;

  const EnrollmentModel({
    required this.id,
    required this.studentId,
    required this.courseId,
  });

  static EnrollmentModel fromMap(Map<String, dynamic> map) {
    return EnrollmentModel(
      id: map['id'],
      studentId: map['student_id'],
      courseId: map['course_id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'student_id': studentId,
      'course_id': courseId,
    };
  }

  EnrollmentModel copyWith({
    int? id,
    int? studentId,
    int? courseId,
  }) {
    return EnrollmentModel(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      courseId: courseId ?? this.courseId,
    );
  }
}
