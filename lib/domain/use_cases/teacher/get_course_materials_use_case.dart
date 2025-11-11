import 'package:poruaa_core/data/repositories/course_material/course_material_repository.dart';
import 'package:poruaa_core/domain/models/course_material/course_material.dart';
import 'package:poruaa_core/utils/result.dart';

class GetCourseMaterialsUseCase {
  final CourseMaterialRepository _courseMaterialRepository;

  GetCourseMaterialsUseCase(this._courseMaterialRepository);

  Future<Result<List<CourseMaterial>>> call(int courseId) async {
    return await _courseMaterialRepository.getCourseMaterials(courseId);
  }
}
