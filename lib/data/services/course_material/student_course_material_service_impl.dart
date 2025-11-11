import 'dart:convert';

import 'package:poruaa_core/data/services/api/api_service.dart';
import 'package:poruaa_core/data/services/course_material/student_course_material_service.dart';
import 'package:poruaa_core/domain/models/course_material/course_material.dart';
import 'package:poruaa_core/utils/result.dart';

class StudentCourseMaterialServiceImpl implements StudentCourseMaterialService {
  final ApiService _apiService;

  StudentCourseMaterialServiceImpl(this._apiService);

  @override
  Future<Result<List<CourseMaterial>>> getCourseMaterials(int courseId) async {
    try {
      final result = await _apiService.get(
        'students/me/courses/$courseId/materials',
      );
      return result.fold((response) {
        if (response.statusCode == 200) {
          final List<dynamic> jsonList = jsonDecode(response.body);
          final materials = jsonList
              .map(
                (json) => CourseMaterial.fromJson(json as Map<String, dynamic>),
              )
              .toList();
          return Result.ok(materials);
        } else {
          return Result.error(
            'Failed to fetch course materials: ${response.statusCode}',
          );
        }
      }, (error) => Result.error(error));
    } catch (e) {
      return Result.error('Error fetching course materials: $e');
    }
  }

  @override
  Future<Result<CourseMaterial>> getCourseMaterial(
    int courseId,
    int materialId,
  ) async {
    try {
      final result = await _apiService.get(
        'students/me/courses/$courseId/materials/$materialId',
      );
      return result.fold((response) {
        if (response.statusCode == 200) {
          final json = jsonDecode(response.body) as Map<String, dynamic>;
          final material = CourseMaterial.fromJson(json);
          return Result.ok(material);
        } else {
          return Result.error(
            'Failed to fetch course material: ${response.statusCode}',
          );
        }
      }, (error) => Result.error(error));
    } catch (e) {
      return Result.error('Error fetching course material: $e');
    }
  }
}
