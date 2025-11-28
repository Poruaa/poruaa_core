import 'dart:convert';

import 'package:poruaa_core/data/services/api/api_service.dart';
import 'package:poruaa_core/data/services/teacher_profile/teacher_profile_dto.dart';
import 'package:poruaa_core/data/services/teacher_profile/teacher_profile_service.dart';
import 'package:poruaa_core/utils/result.dart';

class TeacherProfileServiceImpl implements TeacherProfileService {
  final ApiService _apiService;

  TeacherProfileServiceImpl(this._apiService);

  @override
  Future<Result<TeacherProfileWithSeriesDTO>> getTeacherProfile(
    int teacherId,
  ) async {
    try {
      final result = await _apiService.get('teacher-profile/$teacherId/');

      return result.fold((response) {
        if (response.statusCode == 200) {
          final json = jsonDecode(response.body) as Map<String, dynamic>;
          final profile = TeacherProfileWithSeriesDTO.fromJson(json);
          return Result.ok(profile);
        } else if (response.statusCode == 404) {
          return Result.error('Teacher not found');
        } else {
          return Result.error(
            'Failed to fetch teacher profile: ${response.statusCode}',
          );
        }
      }, (error) => Result.error(error));
    } catch (e) {
      return Result.error('Error fetching teacher profile: $e');
    }
  }
}
