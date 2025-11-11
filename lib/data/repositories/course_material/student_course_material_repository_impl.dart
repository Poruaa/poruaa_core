import 'package:poruaa_core/data/repositories/course_material/student_course_material_repository.dart';
import 'package:poruaa_core/data/services/course_material/student_course_material_service.dart';
import 'package:poruaa_core/domain/models/course_material/course_material.dart';
import 'package:poruaa_core/utils/result.dart';

class StudentCourseMaterialRepositoryImpl
    implements StudentCourseMaterialRepository {
  final StudentCourseMaterialService _studentCourseMaterialService;

  StudentCourseMaterialRepositoryImpl(this._studentCourseMaterialService);

  @override
  Future<Result<List<CourseMaterial>>> getCourseMaterials(int courseId) async {
    return await _studentCourseMaterialService.getCourseMaterials(courseId);
  }

  @override
  Future<Result<CourseMaterial>> getCourseMaterial(
    int courseId,
    int materialId,
  ) async {
    return await _studentCourseMaterialService.getCourseMaterial(
      courseId,
      materialId,
    );
  }
}
