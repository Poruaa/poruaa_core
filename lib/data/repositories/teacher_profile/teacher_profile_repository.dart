import 'package:poruaa_core/data/services/teacher_profile/teacher_profile_dto.dart';
import 'package:poruaa_core/utils/result.dart';

abstract class TeacherProfileRepository {
  /// Get teacher profile with all series and courses (public endpoint)
  Future<Result<TeacherProfileWithSeriesDTO>> getTeacherProfile(int teacherId);
}
