import 'dart:convert';
import 'package:poruaa_core/data/services/authorized_api/authorized_api_service.dart';
import 'package:poruaa_core/data/services/api/api_service.dart';
import 'package:poruaa_core/domain/models/teacher_bookmark/teacher_bookmark.dart';
import 'package:poruaa_core/domain/models/teacher_bookmark/create_bookmark_request.dart';
import 'package:poruaa_core/domain/models/teacher_bookmark/update_bookmark_request.dart';
import 'package:poruaa_core/utils/result.dart';

abstract class TeacherBookmarkService {
  Future<Result<TeacherBookmark>> createBookmark(
    int teacherId,
    CreateBookmarkRequest request,
  );
  Future<Result<TeacherBookmark>> updateBookmark(
    int teacherId,
    int bookmarkId,
    UpdateBookmarkRequest request,
  );
  Future<Result<bool>> deleteBookmark(int teacherId, int bookmarkId);
  Future<Result<List<TeacherBookmark>>> getTeacherBookmarks(int teacherId);
  Future<Result<TeacherBookmark>> getBookmark(int bookmarkId);
}

class TeacherBookmarkServiceImpl implements TeacherBookmarkService {
  final AuthorizedApiService _authorizedApiService;
  final ApiService _apiService;

  TeacherBookmarkServiceImpl(this._authorizedApiService, this._apiService);

  @override
  Future<Result<TeacherBookmark>> createBookmark(
    int teacherId,
    CreateBookmarkRequest request,
  ) async {
    try {
      final response = await _authorizedApiService.post(
        'teachers/$teacherId/bookmarks',
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(request.toJson()),
      );

      switch (response) {
        case Ok(:final value):
          if (value.statusCode == 201) {
            final bookmark = TeacherBookmark.fromJson(
              jsonDecode(value.body) as Map<String, dynamic>,
            );
            return Ok(bookmark);
          } else {
            return Err(value.body);
          }
        case Err():
          return Err('Network error while creating bookmark');
      }
    } catch (e) {
      return Err('Error creating bookmark: $e');
    }
  }

  @override
  Future<Result<TeacherBookmark>> updateBookmark(
    int teacherId,
    int bookmarkId,
    UpdateBookmarkRequest request,
  ) async {
    try {
      final response = await _authorizedApiService.put(
        'teachers/$teacherId/bookmarks/$bookmarkId',
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(request.toJson()),
      );

      switch (response) {
        case Ok(:final value):
          if (value.statusCode == 200) {
            final bookmark = TeacherBookmark.fromJson(
              jsonDecode(value.body) as Map<String, dynamic>,
            );
            return Ok(bookmark);
          } else {
            return Err(value.body);
          }
        case Err():
          return Err('Network error while updating bookmark');
      }
    } catch (e) {
      return Err('Error updating bookmark: $e');
    }
  }

  @override
  Future<Result<bool>> deleteBookmark(int teacherId, int bookmarkId) async {
    try {
      final response = await _authorizedApiService.delete(
        'teachers/$teacherId/bookmarks/$bookmarkId',
      );

      switch (response) {
        case Ok(:final value):
          if (value.statusCode == 200) {
            return Ok(true);
          } else {
            return Err(value.body);
          }
        case Err():
          return Err('Network error while deleting bookmark');
      }
    } catch (e) {
      return Err('Error deleting bookmark: $e');
    }
  }

  @override
  Future<Result<List<TeacherBookmark>>> getTeacherBookmarks(
    int teacherId,
  ) async {
    try {
      final response = await _apiService.get('teachers/$teacherId/bookmarks');

      switch (response) {
        case Ok(:final value):
          if (value.statusCode == 200) {
            final List<dynamic> jsonList = jsonDecode(value.body);
            final bookmarks = jsonList
                .map(
                  (json) =>
                      TeacherBookmark.fromJson(json as Map<String, dynamic>),
                )
                .toList();
            return Ok(bookmarks);
          } else {
            return Err(value.body);
          }
        case Err():
          return Err('Network error while fetching teacher bookmarks');
      }
    } catch (e) {
      return Err('Error getting teacher bookmarks: $e');
    }
  }

  @override
  Future<Result<TeacherBookmark>> getBookmark(int bookmarkId) async {
    try {
      final response = await _apiService.get('bookmarks/$bookmarkId');

      switch (response) {
        case Ok(:final value):
          if (value.statusCode == 200) {
            final bookmark = TeacherBookmark.fromJson(
              jsonDecode(value.body) as Map<String, dynamic>,
            );
            return Ok(bookmark);
          } else {
            return Err(value.body);
          }
        case Err():
          return Err('Network error while fetching bookmark');
      }
    } catch (e) {
      return Err('Error getting bookmark: $e');
    }
  }
}
