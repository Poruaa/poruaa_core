import 'dart:convert';
import 'package:poruaa_core/data/services/authorized_api/authorized_api_service.dart';
import 'package:poruaa_core/data/services/api/api_service.dart';
import 'package:poruaa_core/domain/models/teacher_highlight/teacher_highlight.dart';
import 'package:poruaa_core/domain/models/teacher_highlight/create_highlight_request.dart';
import 'package:poruaa_core/domain/models/teacher_highlight/update_highlight_request.dart';
import 'package:poruaa_core/utils/result.dart';

abstract class TeacherHighlightService {
  Future<Result<TeacherHighlight>> createHighlight(
    int teacherId,
    CreateHighlightRequest request,
  );
  Future<Result<TeacherHighlight>> updateHighlight(
    int teacherId,
    int highlightId,
    UpdateHighlightRequest request,
  );
  Future<Result<bool>> deleteHighlight(int teacherId, int highlightId);
  Future<Result<List<TeacherHighlight>>> getTeacherHighlights(int teacherId);
  Future<Result<TeacherHighlight>> getHighlight(int highlightId);
}

class TeacherHighlightServiceImpl implements TeacherHighlightService {
  final AuthorizedApiService _authorizedApiService;
  final ApiService _apiService;

  TeacherHighlightServiceImpl(this._authorizedApiService, this._apiService);

  @override
  Future<Result<TeacherHighlight>> createHighlight(
    int teacherId,
    CreateHighlightRequest request,
  ) async {
    try {
      final response = await _authorizedApiService.post(
        'teachers/$teacherId/highlights',
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(request.toJson()),
      );

      switch (response) {
        case Ok(:final value):
          if (value.statusCode == 201) {
            final highlight = TeacherHighlight.fromJson(
              jsonDecode(value.body) as Map<String, dynamic>,
            );
            return Ok(highlight);
          } else {
            return Err(value.body);
          }
        case Err():
          return Err('Network error while creating highlight');
      }
    } catch (e) {
      return Err('Error creating highlight: $e');
    }
  }

  @override
  Future<Result<TeacherHighlight>> updateHighlight(
    int teacherId,
    int highlightId,
    UpdateHighlightRequest request,
  ) async {
    try {
      final response = await _authorizedApiService.put(
        'teachers/$teacherId/highlights/$highlightId',
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(request.toJson()),
      );

      switch (response) {
        case Ok(:final value):
          if (value.statusCode == 200) {
            final highlight = TeacherHighlight.fromJson(
              jsonDecode(value.body) as Map<String, dynamic>,
            );
            return Ok(highlight);
          } else {
            return Err(value.body);
          }
        case Err():
          return Err('Network error while updating highlight');
      }
    } catch (e) {
      return Err('Error updating highlight: $e');
    }
  }

  @override
  Future<Result<bool>> deleteHighlight(int teacherId, int highlightId) async {
    try {
      final response = await _authorizedApiService.delete(
        'teachers/$teacherId/highlights/$highlightId',
      );

      switch (response) {
        case Ok(:final value):
          if (value.statusCode == 200) {
            return Ok(true);
          } else {
            return Err(value.body);
          }
        case Err():
          return Err('Network error while deleting highlight');
      }
    } catch (e) {
      return Err('Error deleting highlight: $e');
    }
  }

  @override
  Future<Result<List<TeacherHighlight>>> getTeacherHighlights(
    int teacherId,
  ) async {
    try {
      final response = await _apiService.get('teachers/$teacherId/highlights');

      switch (response) {
        case Ok(:final value):
          if (value.statusCode == 200) {
            final List<dynamic> jsonList = jsonDecode(value.body);
            final highlights = jsonList
                .map(
                  (json) =>
                      TeacherHighlight.fromJson(json as Map<String, dynamic>),
                )
                .toList();
            return Ok(highlights);
          } else {
            return Err(value.body);
          }
        case Err():
          return Err('Network error while fetching teacher highlights');
      }
    } catch (e) {
      return Err('Error getting teacher highlights: $e');
    }
  }

  @override
  Future<Result<TeacherHighlight>> getHighlight(int highlightId) async {
    try {
      final response = await _apiService.get('highlights/$highlightId');

      switch (response) {
        case Ok(:final value):
          if (value.statusCode == 200) {
            final highlight = TeacherHighlight.fromJson(
              jsonDecode(value.body) as Map<String, dynamic>,
            );
            return Ok(highlight);
          } else {
            return Err(value.body);
          }
        case Err():
          return Err('Network error while fetching highlight');
      }
    } catch (e) {
      return Err('Error getting highlight: $e');
    }
  }
}
