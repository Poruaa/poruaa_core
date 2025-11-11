import 'dart:convert';

import 'package:poruaa_core/data/services/api/api_service.dart';
import 'package:poruaa_core/data/services/rating/model/rating_model.dart';
import 'package:poruaa_core/data/services/rating/rating_service.dart';
import 'package:poruaa_core/utils/result.dart';

class RatingServiceImpl implements RatingService {
  final ApiService _apiService;

  RatingServiceImpl(this._apiService);

  @override
  Future<Result<CourseRatingModel>> createCourseRating(
    CreateCourseRatingInput input,
  ) async {
    try {
      final response = await _apiService.post(
        'students/me/courses/${input.courseId}/rating',
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(input.toJson()),
      );

      return response.map((response) {
        if (response.statusCode == 201) {
          try {
            final jsonBody = jsonDecode(response.body);
            final rating = CourseRatingModel.fromJson(jsonBody);
            return rating;
          } catch (jsonError) {
            throw Exception('Failed to parse response JSON: $jsonError');
          }
        } else {
          throw Exception('Failed to create rating: ${response.body}');
        }
      });
    } catch (e) {
      return Result.error('Error creating rating: $e');
    }
  }

  @override
  Future<Result<CourseRatingModel>> getCourseRatingByStudent(
    int courseId,
  ) async {
    try {
      final response = await _apiService.get(
        'students/me/courses/$courseId/rating',
      );

      return response.map((response) {
        if (response.statusCode == 200) {
          final jsonBody = jsonDecode(response.body);
          final rating = CourseRatingModel.fromJson(jsonBody);
          return rating;
        } else if (response.statusCode == 404) {
          throw Exception('No rating found');
        } else {
          throw Exception('Failed to get rating: ${response.body}');
        }
      });
    } catch (e) {
      return Result.error('Error getting rating: $e');
    }
  }

  @override
  Future<Result<CourseRatingModel>> updateCourseRating(
    int courseId,
    UpdateRatingInput input,
  ) async {
    try {
      final response = await _apiService.put(
        'students/me/courses/$courseId/rating',
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(input.toJson()),
      );

      return response.map((response) {
        if (response.statusCode == 200) {
          final jsonBody = jsonDecode(response.body);
          final rating = CourseRatingModel.fromJson(jsonBody);
          return rating;
        } else {
          throw Exception('Failed to update rating: ${response.body}');
        }
      });
    } catch (e) {
      return Result.error('Error updating rating: $e');
    }
  }

  @override
  Future<Result<bool>> deleteCourseRating(int courseId) async {
    try {
      final response = await _apiService.delete(
        'students/me/courses/$courseId/rating',
      );

      return response.map((response) {
        if (response.statusCode == 200) {
          return true;
        } else {
          throw Exception('Failed to delete rating: ${response.body}');
        }
      });
    } catch (e) {
      return Result.error('Error deleting rating: $e');
    }
  }

  @override
  Future<Result<List<CourseRatingWithStudentModel>>>
  getCourseRatingsWithStudents(int courseId) async {
    try {
      final response = await _apiService.get('courses/$courseId/ratings');

      return response.map((response) {
        if (response.statusCode == 200) {
          final jsonBody = jsonDecode(response.body);
          final List<dynamic> ratingsJson = jsonBody;
          final ratings = ratingsJson
              .map((json) => CourseRatingWithStudentModel.fromJson(json))
              .toList();
          return ratings;
        } else {
          throw Exception('Failed to get ratings: ${response.body}');
        }
      });
    } catch (e) {
      return Result.error('Error getting ratings: $e');
    }
  }

  @override
  Future<Result<ShortExamRatingModel>> createShortExamRating(
    CreateShortExamRatingInput input,
  ) async {
    try {
      final response = await _apiService.post(
        'students/me/short-exams/${input.shortExamId}/rating',
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(input.toJson()),
      );

      return response.map((response) {
        if (response.statusCode == 201) {
          try {
            final jsonBody = jsonDecode(response.body);
            final rating = ShortExamRatingModel.fromJson(jsonBody);
            return rating;
          } catch (jsonError) {
            throw Exception('Failed to parse response JSON: $jsonError');
          }
        } else {
          throw Exception('Failed to create rating: ${response.body}');
        }
      });
    } catch (e) {
      return Result.error('Error creating rating: $e');
    }
  }

  @override
  Future<Result<ShortExamRatingModel>> getShortExamRatingByStudent(
    int shortExamId,
  ) async {
    try {
      final response = await _apiService.get(
        'students/me/short-exams/$shortExamId/rating',
      );

      return response.map((response) {
        if (response.statusCode == 200) {
          final jsonBody = jsonDecode(response.body);
          final rating = ShortExamRatingModel.fromJson(jsonBody);
          return rating;
        } else if (response.statusCode == 404) {
          throw Exception('No rating found');
        } else {
          throw Exception('Failed to get rating: ${response.body}');
        }
      });
    } catch (e) {
      return Result.error('Error getting rating: $e');
    }
  }

  @override
  Future<Result<ShortExamRatingModel>> updateShortExamRating(
    int shortExamId,
    UpdateRatingInput input,
  ) async {
    try {
      final response = await _apiService.put(
        'students/me/short-exams/$shortExamId/rating',
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(input.toJson()),
      );

      return response.map((response) {
        if (response.statusCode == 200) {
          final jsonBody = jsonDecode(response.body);
          final rating = ShortExamRatingModel.fromJson(jsonBody);
          return rating;
        } else {
          throw Exception('Failed to update rating: ${response.body}');
        }
      });
    } catch (e) {
      return Result.error('Error updating rating: $e');
    }
  }

  @override
  Future<Result<bool>> deleteShortExamRating(int shortExamId) async {
    try {
      final response = await _apiService.delete(
        'students/me/short-exams/$shortExamId/rating',
      );

      return response.map((response) {
        if (response.statusCode == 200) {
          return true;
        } else {
          throw Exception('Failed to delete rating: ${response.body}');
        }
      });
    } catch (e) {
      return Result.error('Error deleting rating: $e');
    }
  }

  @override
  Future<Result<List<ShortExamRatingWithStudentModel>>>
  getShortExamRatingsWithStudents(int shortExamId) async {
    try {
      final response = await _apiService.get(
        'short-exams/$shortExamId/ratings',
      );

      return response.map((response) {
        if (response.statusCode == 200) {
          final jsonBody = jsonDecode(response.body);
          final List<dynamic> ratingsJson = jsonBody;
          final ratings = ratingsJson
              .map((json) => ShortExamRatingWithStudentModel.fromJson(json))
              .toList();
          return ratings;
        } else {
          throw Exception('Failed to get ratings: ${response.body}');
        }
      });
    } catch (e) {
      return Result.error('Error getting ratings: $e');
    }
  }
}
