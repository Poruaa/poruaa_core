import 'package:poruaa_core/domain/models/course_material/course_material.dart';
import 'package:poruaa_core/utils/result.dart';

abstract class StudentCourseMaterialRepository {
  Future<Result<List<CourseMaterial>>> getCourseMaterials(int courseId);
  Future<Result<CourseMaterial>> getCourseMaterial(
    int courseId,
    int materialId,
  );
}
