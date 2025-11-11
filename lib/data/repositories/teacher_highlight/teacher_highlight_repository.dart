import 'package:poruaa_core/data/repositories/user/user_repository.dart';
import 'package:poruaa_core/domain/models/teacher_highlight/teacher_highlight.dart';
import 'package:poruaa_core/domain/models/teacher_highlight/create_highlight_request.dart';
import 'package:poruaa_core/domain/models/teacher_highlight/update_highlight_request.dart';
import 'package:poruaa_core/data/services/teacher_highlight/teacher_highlight_service.dart';
import 'package:poruaa_core/utils/result.dart';

abstract class TeacherHighlightRepository {
  Future<Result<TeacherHighlight>> createHighlight(
    CreateHighlightRequest request,
  );
  Future<Result<TeacherHighlight>> updateHighlight(
    int highlightId,
    UpdateHighlightRequest request,
  );
  Future<Result<bool>> deleteHighlight(int highlightId);
  Future<Result<List<TeacherHighlight>>> getTeacherHighlights(int teacherId);
  Future<Result<TeacherHighlight>> getHighlight(int highlightId);
}

class TeacherHighlightRepositoryImpl implements TeacherHighlightRepository {
  final TeacherHighlightService _service;
  final UserRepository _userRepository;

  TeacherHighlightRepositoryImpl(this._service, this._userRepository);

  @override
  Future<Result<TeacherHighlight>> createHighlight(
    CreateHighlightRequest request,
  ) async {
    return await _service.createHighlight(
      _userRepository.getCurrentUserId,
      request,
    );
  }

  @override
  Future<Result<TeacherHighlight>> updateHighlight(
    int highlightId,
    UpdateHighlightRequest request,
  ) async {
    return await _service.updateHighlight(
      _userRepository.getCurrentUserId,
      highlightId,
      request,
    );
  }

  @override
  Future<Result<bool>> deleteHighlight(int highlightId) async {
    return await _service.deleteHighlight(
      _userRepository.getCurrentUserId,
      highlightId,
    );
  }

  @override
  Future<Result<List<TeacherHighlight>>> getTeacherHighlights(
    int teacherId,
  ) async {
    return await _service.getTeacherHighlights(teacherId);
  }

  @override
  Future<Result<TeacherHighlight>> getHighlight(int highlightId) async {
    return await _service.getHighlight(highlightId);
  }
}
