import 'package:poruaa_core/data/repositories/user/user_repository.dart';
import 'package:poruaa_core/domain/models/teacher_bookmark/teacher_bookmark.dart';
import 'package:poruaa_core/domain/models/teacher_bookmark/create_bookmark_request.dart';
import 'package:poruaa_core/domain/models/teacher_bookmark/update_bookmark_request.dart';
import 'package:poruaa_core/data/services/teacher_bookmark/teacher_bookmark_service.dart';
import 'package:poruaa_core/utils/result.dart';

abstract class TeacherBookmarkRepository {
  Future<Result<TeacherBookmark>> createBookmark(CreateBookmarkRequest request);
  Future<Result<TeacherBookmark>> updateBookmark(
    int bookmarkId,
    UpdateBookmarkRequest request,
  );
  Future<Result<bool>> deleteBookmark(int bookmarkId);
  Future<Result<List<TeacherBookmark>>> getTeacherBookmarks(int teacherId);
  Future<Result<TeacherBookmark>> getBookmark(int bookmarkId);
}

class TeacherBookmarkRepositoryImpl implements TeacherBookmarkRepository {
  final TeacherBookmarkService _service;
  final UserRepository _userRepository;

  TeacherBookmarkRepositoryImpl(this._service, this._userRepository);

  @override
  Future<Result<TeacherBookmark>> createBookmark(
    CreateBookmarkRequest request,
  ) async {
    return await _service.createBookmark(
      _userRepository.getCurrentUserId,
      request,
    );
  }

  @override
  Future<Result<TeacherBookmark>> updateBookmark(
    int bookmarkId,
    UpdateBookmarkRequest request,
  ) async {
    return await _service.updateBookmark(
      _userRepository.getCurrentUserId,
      bookmarkId,
      request,
    );
  }

  @override
  Future<Result<bool>> deleteBookmark(int bookmarkId) async {
    return await _service.deleteBookmark(
      _userRepository.getCurrentUserId,
      bookmarkId,
    );
  }

  @override
  Future<Result<List<TeacherBookmark>>> getTeacherBookmarks(
    int teacherId,
  ) async {
    return await _service.getTeacherBookmarks(teacherId);
  }

  @override
  Future<Result<TeacherBookmark>> getBookmark(int bookmarkId) async {
    return await _service.getBookmark(bookmarkId);
  }
}
