import 'package:poruaa_core/domain/models/course_material/course_material.dart';
import 'package:poruaa_core/utils/result.dart';

abstract class CourseMaterialService {
  Future<Result<List<CourseMaterial>>> getCourseMaterials(
    int teacherId,
    int courseId,
  );
  Future<Result<CourseMaterial>> getCourseMaterial(
    int teacherId,
    int courseId,
    int materialId,
  );
  Future<Result<CourseMaterial>> createCourseMaterial(
    int teacherId,
    int courseId,
    CreateCourseMaterialInput input,
  );
  Future<Result<CourseMaterial>> updateCourseMaterial(
    int teacherId,
    int courseId,
    int materialId,
    UpdateCourseMaterialInput input,
  );
  Future<Result<void>> deleteCourseMaterial(
    int teacherId,
    int courseId,
    int materialId,
  );
  Future<Result<void>> reorderCourseMaterials(
    int teacherId,
    int courseId,
    ReorderMaterialsInput input,
  );
}
