import 'package:poruaa_core/data/repositories/course/course_repository.dart';

class GetCoursesOfTeacherUseCase {
  final CourseRepository _courseRepository;

  GetCoursesOfTeacherUseCase(this._courseRepository);
  bool _loaded = false;

  Future<void> call(int teacherId) async {
    if (_loaded) {
      return;
    }
    _loaded = true;
    await _courseRepository.getCoursesOfTeacher(teacherId);
  }
}
