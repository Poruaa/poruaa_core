import 'package:poruaa_core/data/repositories/course_material/course_material_repository.dart';
import 'package:poruaa_core/data/repositories/user/user_repository.dart';
import 'package:poruaa_core/data/services/course_material/course_material_service.dart';
import 'package:poruaa_core/domain/models/course_material/course_material.dart';
import 'package:poruaa_core/utils/result.dart';

class CourseMaterialRepositoryImpl implements CourseMaterialRepository {
  final CourseMaterialService _courseMaterialService;
  final UserRepository _userRepository;

  CourseMaterialRepositoryImpl(
    this._courseMaterialService,
    this._userRepository,
  );

  @override
  Future<Result<List<CourseMaterial>>> getCourseMaterials(int courseId) async {
    return await _courseMaterialService.getCourseMaterials(
      _userRepository.getCurrentUserId,
      courseId,
    );
  }

  @override
  Future<Result<CourseMaterial>> getCourseMaterial(
    int courseId,
    int materialId,
  ) async {
    return await _courseMaterialService.getCourseMaterial(
      _userRepository.getCurrentUserId,
      courseId,
      materialId,
    );
  }

  @override
  Future<Result<CourseMaterial>> createCourseMaterial(
    int courseId,
    CreateCourseMaterialInput input,
  ) async {
    return await _courseMaterialService.createCourseMaterial(
      _userRepository.getCurrentUserId,
      courseId,
      input,
    );
  }

  @override
  Future<Result<CourseMaterial>> updateCourseMaterial(
    int courseId,
    int materialId,
    UpdateCourseMaterialInput input,
  ) async {
    return await _courseMaterialService.updateCourseMaterial(
      _userRepository.getCurrentUserId,
      courseId,
      materialId,
      input,
    );
  }

  @override
  Future<Result<void>> deleteCourseMaterial(
    int courseId,
    int materialId,
  ) async {
    return await _courseMaterialService.deleteCourseMaterial(
      _userRepository.getCurrentUserId,
      courseId,
      materialId,
    );
  }

  @override
  Future<Result<void>> reorderCourseMaterials(
    int courseId,
    ReorderMaterialsInput input,
  ) async {
    return await _courseMaterialService.reorderCourseMaterials(
      _userRepository.getCurrentUserId,
      courseId,
      input,
    );
  }
}
