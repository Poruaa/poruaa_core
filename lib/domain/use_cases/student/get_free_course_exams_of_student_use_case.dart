import 'package:poruaa_core/data/repositories/course_exam/course_exam_repository.dart';
import 'package:poruaa_core/domain/models/course_exam/course_exam.dart';
import 'package:poruaa_core/utils/result.dart';

class GetFreeCourseExamsOfStudentUseCase {
  final CourseExamRepository _courseExamRepository;

  GetFreeCourseExamsOfStudentUseCase(this._courseExamRepository);

  Future<Result<List<CourseExam>>> call(int courseId) async {
    return await _courseExamRepository.getFreeCourseExamsOfStudentByMe(
      courseId,
    );
  }
}
