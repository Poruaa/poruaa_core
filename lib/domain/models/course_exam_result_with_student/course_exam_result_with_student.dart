import 'package:poruaa_core/data/services/course_exam/model/course_exam_result_with_student_dto.dart';

class CourseExamResultWithStudent {
  int resultId;
  int studentId;
  int courseExamId;
  String name;
  int? rank;
  double? score;

  CourseExamResultWithStudent({
    required this.resultId,
    required this.studentId,
    required this.courseExamId,
    required this.name,
    this.rank,
    this.score,
  });

  factory CourseExamResultWithStudent.fromDto(
      CourseExamResultWithStudentDto dto) {
    return CourseExamResultWithStudent(
      resultId: dto.resultId,
      studentId: dto.studentId,
      courseExamId: dto.courseExamId,
      name: dto.name,
      rank: dto.rank,
      score: dto.score,
    );
  }
}
