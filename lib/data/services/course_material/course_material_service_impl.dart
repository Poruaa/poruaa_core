import 'dart:convert';

import 'package:poruaa_core/data/services/api/api_service.dart';
import 'package:poruaa_core/data/services/course_material/course_material_service.dart';
import 'package:poruaa_core/domain/models/course_material/course_material.dart';
import 'package:poruaa_core/utils/result.dart';

class CourseMaterialServiceImpl implements CourseMaterialService {
  final ApiService _apiService;

  CourseMaterialServiceImpl(this._apiService);

  @override
  Future<Result<List<CourseMaterial>>> getCourseMaterials(
    int teacherId,
    int courseId,
  ) async {
    try {
      final result = await _apiService.get(
        'teachers/$teacherId/courses/$courseId/materials',
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
    int teacherId,
    int courseId,
    int materialId,
  ) async {
    try {
      final result = await _apiService.get(
        'teachers/$teacherId/courses/$courseId/materials/$materialId',
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

  @override
  Future<Result<CourseMaterial>> createCourseMaterial(
    int teacherId,
    int courseId,
    CreateCourseMaterialInput input,
  ) async {
    try {
      final body = jsonEncode(input.toJson());
      final result = await _apiService.post(
        'teachers/$teacherId/courses/$courseId/materials',
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      return result.fold((response) {
        if (response.statusCode == 201 || response.statusCode == 200) {
          final json = jsonDecode(response.body) as Map<String, dynamic>;
          final material = CourseMaterial.fromJson(json);
          return Result.ok(material);
        } else {
          return Result.error(
            'Failed to create course material: ${response.statusCode}',
          );
        }
      }, (error) => Result.error(error));
    } catch (e) {
      return Result.error('Error creating course material: $e');
    }
  }

  @override
  Future<Result<CourseMaterial>> updateCourseMaterial(
    int teacherId,
    int courseId,
    int materialId,
    UpdateCourseMaterialInput input,
  ) async {
    try {
      final body = jsonEncode(input.toJson());
      final result = await _apiService.put(
        'teachers/$teacherId/courses/$courseId/materials/$materialId',
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      return result.fold((response) {
        if (response.statusCode == 200) {
          final json = jsonDecode(response.body) as Map<String, dynamic>;
          final material = CourseMaterial.fromJson(json);
          return Result.ok(material);
        } else {
          return Result.error(
            'Failed to update course material: ${response.statusCode}',
          );
        }
      }, (error) => Result.error(error));
    } catch (e) {
      return Result.error('Error updating course material: $e');
    }
  }

  @override
  Future<Result<void>> deleteCourseMaterial(
    int teacherId,
    int courseId,
    int materialId,
  ) async {
    try {
      final result = await _apiService.delete(
        'teachers/$teacherId/courses/$courseId/materials/$materialId',
      );
      return result.fold((response) {
        if (response.statusCode == 200 || response.statusCode == 204) {
          return Result.ok(null);
        } else {
          return Result.error(
            'Failed to delete course material: ${response.statusCode}',
          );
        }
      }, (error) => Result.error(error));
    } catch (e) {
      return Result.error('Error deleting course material: $e');
    }
  }

  @override
  Future<Result<void>> reorderCourseMaterials(
    int teacherId,
    int courseId,
    ReorderMaterialsInput input,
  ) async {
    try {
      final body = jsonEncode(input.toJson());
      final result = await _apiService.post(
        'teachers/$teacherId/courses/$courseId/materials/reorder',
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      return result.fold((response) {
        if (response.statusCode == 200) {
          return Result.ok(null);
        } else {
          return Result.error(
            'Failed to reorder course materials: ${response.statusCode}',
          );
        }
      }, (error) => Result.error(error));
    } catch (e) {
      return Result.error('Error reordering course materials: $e');
    }
  }
}
