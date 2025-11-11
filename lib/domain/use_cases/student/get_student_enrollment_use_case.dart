import 'package:poruaa_core/data/repositories/course/course_repository.dart';
import 'package:poruaa_core/utils/result.dart';
import 'package:poruaa_core/utils/result_loading_use_case_mixin.dart';

class GetAllEnrolledCoursesOfStudentCase with ResultLoadingUseCaseMixin {
  final CourseRepository _courseRepository;

  GetAllEnrolledCoursesOfStudentCase(this._courseRepository);

  Future<Result> call() async {
    return execute(
      () => _courseRepository.getAllEnrolledCoursesOfStudentByMe(),
    );
  }
}
