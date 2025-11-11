import 'package:poruaa_core/data/repositories/course_material/course_material_repository.dart';
import 'package:poruaa_core/domain/models/course_material/course_material.dart';
import 'package:poruaa_core/utils/result.dart';

class UpdateCourseMaterialUseCase {
  final CourseMaterialRepository _courseMaterialRepository;

  UpdateCourseMaterialUseCase(this._courseMaterialRepository);

  Future<Result<CourseMaterial>> call(
    int courseId,
    int materialId,
    UpdateCourseMaterialInput input,
  ) async {
    return await _courseMaterialRepository.updateCourseMaterial(
      courseId,
      materialId,
      input,
    );
  }
}
