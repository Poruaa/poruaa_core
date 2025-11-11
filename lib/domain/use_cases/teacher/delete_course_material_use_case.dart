import 'package:poruaa_core/data/repositories/course_material/course_material_repository.dart';
import 'package:poruaa_core/utils/result.dart';

class DeleteCourseMaterialUseCase {
  final CourseMaterialRepository _courseMaterialRepository;

  DeleteCourseMaterialUseCase(this._courseMaterialRepository);

  Future<Result<void>> call(int courseId, int materialId) async {
    return await _courseMaterialRepository.deleteCourseMaterial(
      courseId,
      materialId,
    );
  }
}
