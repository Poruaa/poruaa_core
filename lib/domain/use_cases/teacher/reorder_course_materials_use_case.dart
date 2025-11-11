import 'package:poruaa_core/data/repositories/course_material/course_material_repository.dart';
import 'package:poruaa_core/domain/models/course_material/course_material.dart';
import 'package:poruaa_core/utils/result.dart';

class ReorderCourseMaterialsUseCase {
  final CourseMaterialRepository _courseMaterialRepository;

  ReorderCourseMaterialsUseCase(this._courseMaterialRepository);

  Future<Result<void>> call(int courseId, ReorderMaterialsInput input) async {
    return await _courseMaterialRepository.reorderCourseMaterials(
      courseId,
      input,
    );
  }
}
