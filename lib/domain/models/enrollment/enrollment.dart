import 'package:poruaa_core/data/services/enrollment/model/flat_enrollment_model.dart';

class Enrollment {
  final int id;
  final int courseId;
  final int studentId;
  Enrollment({
    required this.id,
    required this.courseId,
    required this.studentId,
  });

  factory Enrollment.zero() {
    return Enrollment(
      id: 0,
      courseId: 0,
      studentId: 0,
    );
  }

  Enrollment copyWith({
    int? id,
    int? courseId,
    int? studentId,
  }) {
    return Enrollment(
      id: id ?? this.id,
      courseId: courseId ?? this.courseId,
      studentId: studentId ?? this.studentId,
    );
  }

  static Enrollment fromModel(FlatEnrollmentModel model) {
    return Enrollment(
      id: model.id,
      courseId: model.courseId,
      studentId: model.studentId,
    );
  }
}
