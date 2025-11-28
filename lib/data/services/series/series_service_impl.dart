import 'dart:convert';

import 'package:poruaa_core/data/services/api/api_service.dart';
import 'package:poruaa_core/data/services/series/series_service.dart';
import 'package:poruaa_core/domain/models/series/series.dart';
import 'package:poruaa_core/utils/result.dart';

class SeriesServiceImpl implements SeriesService {
  final ApiService _apiService;

  SeriesServiceImpl(this._apiService);

  @override
  Future<Result<List<SeriesDTO>>> getAllSeries(int teacherId) async {
    try {
      final result = await _apiService.get('teachers/$teacherId/series');
      return result.fold((response) {
        if (response.statusCode == 200) {
          final List<dynamic> jsonList = jsonDecode(response.body);
          final series = jsonList
              .map((json) => SeriesDTO.fromJson(json as Map<String, dynamic>))
              .toList();
          return Result.ok(series);
        } else {
          return Result.error(
            'Failed to fetch series: ${response.statusCode}',
          );
        }
      }, (error) => Result.error(error));
    } catch (e) {
      return Result.error('Error fetching series: $e');
    }
  }

  @override
  Future<Result<Series>> getSeriesById(int seriesId) async {
    try {
      final result = await _apiService.get('series/$seriesId');
      return result.fold((response) {
        if (response.statusCode == 200) {
          final json = jsonDecode(response.body) as Map<String, dynamic>;
          final series = Series.fromJson(json);
          return Result.ok(series);
        } else {
          return Result.error(
            'Failed to fetch series: ${response.statusCode}',
          );
        }
      }, (error) => Result.error(error));
    } catch (e) {
      return Result.error('Error fetching series: $e');
    }
  }

  @override
  Future<Result<SeriesWithCoursesDTO>> getSeriesWithCourses(
    int seriesId,
  ) async {
    try {
      final result = await _apiService.get('series/$seriesId/with-courses');
      return result.fold((response) {
        if (response.statusCode == 200) {
          final json = jsonDecode(response.body) as Map<String, dynamic>;
          final series = SeriesWithCoursesDTO.fromJson(json);
          return Result.ok(series);
        } else {
          return Result.error(
            'Failed to fetch series with courses: ${response.statusCode}',
          );
        }
      }, (error) => Result.error(error));
    } catch (e) {
      return Result.error('Error fetching series with courses: $e');
    }
  }

  @override
  Future<Result<Series>> createSeries(
    int teacherId,
    CreateSeriesInput input,
  ) async {
    try {
      final body = jsonEncode(input.toJson());
      final result = await _apiService.post(
        'teachers/$teacherId/series',
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      return result.fold((response) {
        if (response.statusCode == 201 || response.statusCode == 200) {
          final json = jsonDecode(response.body) as Map<String, dynamic>;
          final series = Series.fromJson(json);
          return Result.ok(series);
        } else {
          return Result.error(
            'Failed to create series: ${response.statusCode}',
          );
        }
      }, (error) => Result.error(error));
    } catch (e) {
      return Result.error('Error creating series: $e');
    }
  }

  @override
  Future<Result<Series>> updateSeries(
    int teacherId,
    int seriesId,
    UpdateSeriesInput input,
  ) async {
    try {
      final body = jsonEncode(input.toJson());
      final result = await _apiService.put(
        'teachers/$teacherId/series/$seriesId',
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      return result.fold((response) {
        if (response.statusCode == 200) {
          final json = jsonDecode(response.body) as Map<String, dynamic>;
          final series = Series.fromJson(json);
          return Result.ok(series);
        } else {
          return Result.error(
            'Failed to update series: ${response.statusCode}',
          );
        }
      }, (error) => Result.error(error));
    } catch (e) {
      return Result.error('Error updating series: $e');
    }
  }

  @override
  Future<Result<Series>> deleteSeries(int teacherId, int seriesId) async {
    try {
      final result = await _apiService.delete(
        'teachers/$teacherId/series/$seriesId',
      );
      return result.fold((response) {
        if (response.statusCode == 200) {
          final json = jsonDecode(response.body) as Map<String, dynamic>;
          final series = Series.fromJson(json);
          return Result.ok(series);
        } else {
          return Result.error(
            'Failed to delete series: ${response.statusCode}',
          );
        }
      }, (error) => Result.error(error));
    } catch (e) {
      return Result.error('Error deleting series: $e');
    }
  }

  @override
  Future<Result<void>> reorderSeries(
    int teacherId,
    ReorderSeriesInput input,
  ) async {
    try {
      final body = jsonEncode(input.toJson());
      final result = await _apiService.post(
        'teachers/$teacherId/series/reorder',
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      return result.fold((response) {
        if (response.statusCode == 200) {
          return Result.ok(null);
        } else {
          return Result.error(
            'Failed to reorder series: ${response.statusCode}',
          );
        }
      }, (error) => Result.error(error));
    } catch (e) {
      return Result.error('Error reordering series: $e');
    }
  }

  @override
  Future<Result<void>> addCourseToSeries(
    int teacherId,
    int seriesId,
    AddCourseToSeriesInput input,
  ) async {
    try {
      final body = jsonEncode(input.toJson());
      final result = await _apiService.post(
        'teachers/$teacherId/series/$seriesId/courses',
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      return result.fold((response) {
        if (response.statusCode == 200) {
          return Result.ok(null);
        } else {
          return Result.error(
            'Failed to add course to series: ${response.statusCode}',
          );
        }
      }, (error) => Result.error(error));
    } catch (e) {
      return Result.error('Error adding course to series: $e');
    }
  }

  @override
  Future<Result<void>> removeCourseFromSeries(
    int teacherId,
    int seriesId,
    int courseId,
  ) async {
    try {
      final result = await _apiService.delete(
        'teachers/$teacherId/series/$seriesId/courses/$courseId',
      );
      return result.fold((response) {
        if (response.statusCode == 200) {
          return Result.ok(null);
        } else {
          return Result.error(
            'Failed to remove course from series: ${response.statusCode}',
          );
        }
      }, (error) => Result.error(error));
    } catch (e) {
      return Result.error('Error removing course from series: $e');
    }
  }

  @override
  Future<Result<void>> reorderCoursesInSeries(
    int teacherId,
    int seriesId,
    ReorderCoursesInSeriesInput input,
  ) async {
    try {
      final body = jsonEncode(input.toJson());
      final result = await _apiService.post(
        'teachers/$teacherId/series/$seriesId/courses/reorder',
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      return result.fold((response) {
        if (response.statusCode == 200) {
          return Result.ok(null);
        } else {
          return Result.error(
            'Failed to reorder courses in series: ${response.statusCode}',
          );
        }
      }, (error) => Result.error(error));
    } catch (e) {
      return Result.error('Error reordering courses in series: $e');
    }
  }
}

