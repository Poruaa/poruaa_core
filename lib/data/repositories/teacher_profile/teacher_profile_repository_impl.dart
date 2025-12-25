import 'package:poruaa_core/data/repositories/teacher_profile/teacher_profile_repository.dart';
import 'package:poruaa_core/data/services/teacher_profile/teacher_profile_dto.dart';
import 'package:poruaa_core/data/services/teacher_profile/teacher_profile_service.dart';
import 'package:poruaa_core/utils/result.dart';

class TeacherProfileRepositoryImpl implements TeacherProfileRepository {
  final TeacherProfileService _teacherProfileService;

  TeacherProfileRepositoryImpl(this._teacherProfileService);

  @override
  Future<Result<EnhancedTeacherProfileWithSeriesDTO>> getTeacherProfile(
    int teacherId,
  ) async {
    return await _teacherProfileService.getTeacherProfile(teacherId);
  }
}
