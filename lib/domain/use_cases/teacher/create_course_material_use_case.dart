import 'package:poruaa_core/data/repositories/course_material/course_material_repository.dart';
import 'package:poruaa_core/domain/models/course_material/course_material.dart';
import 'package:poruaa_core/utils/result.dart';

class CreateCourseMaterialUseCase {
  final CourseMaterialRepository _courseMaterialRepository;

  CreateCourseMaterialUseCase(this._courseMaterialRepository);

  Future<Result<CourseMaterial>> call(
    int courseId,
    CreateCourseMaterialInput input,
  ) async {
    return await _courseMaterialRepository.createCourseMaterial(
      courseId,
      input,
    );
  }
}
