import 'package:poruaa_core/domain/models/course_material/course_material.dart';
import 'package:poruaa_core/utils/result.dart';

abstract class CourseMaterialRepository {
  Future<Result<List<CourseMaterial>>> getCourseMaterials(int courseId);
  Future<Result<CourseMaterial>> getCourseMaterial(
    int courseId,
    int materialId,
  );
  Future<Result<CourseMaterial>> createCourseMaterial(
    int courseId,
    CreateCourseMaterialInput input,
  );
  Future<Result<CourseMaterial>> updateCourseMaterial(
    int courseId,
    int materialId,
    UpdateCourseMaterialInput input,
  );
  Future<Result<void>> deleteCourseMaterial(int courseId, int materialId);
  Future<Result<void>> reorderCourseMaterials(
    int courseId,
    ReorderMaterialsInput input,
  );
}
