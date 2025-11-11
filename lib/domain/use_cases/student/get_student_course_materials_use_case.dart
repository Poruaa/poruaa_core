import 'package:poruaa_core/data/repositories/course_material/student_course_material_repository.dart';
import 'package:poruaa_core/domain/models/course_material/course_material.dart';
import 'package:poruaa_core/utils/result.dart';

class GetStudentCourseMaterialsUseCase {
  final StudentCourseMaterialRepository _studentCourseMaterialRepository;

  GetStudentCourseMaterialsUseCase(this._studentCourseMaterialRepository);

  Future<Result<List<CourseMaterial>>> call(int courseId) async {
    return await _studentCourseMaterialRepository.getCourseMaterials(courseId);
  }
}
