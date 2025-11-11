import 'dart:typed_data';

import 'package:poruaa_core/data/dao/exam/exam_dao.dart';
import 'package:poruaa_core/data/dao/free_exam/free_exam_dao.dart';
import 'package:poruaa_core/data/repositories/free_exam/free_exam_repository.dart';
import 'package:poruaa_core/data/repositories/user/user_repository.dart';
import 'package:poruaa_core/data/services/free_exam/free_exam_service.dart';
import 'package:poruaa_core/data/services/free_exam/model/free_exam_result_summary_dto.dart';
import 'package:poruaa_core/data/services/free_exam/model/free_exam_individual_result_dto.dart';
import 'package:poruaa_core/domain/models/exam/exam.dart';
import 'package:poruaa_core/domain/models/pagination/pagination_state.dart';
import 'package:poruaa_core/domain/models/free_exam/free_exam.dart';
import 'package:poruaa_core/domain/models/free_exam_result/free_exam_result.dart';
import 'package:poruaa_core/utils/result.dart';

class FreeExamRepositoryImpl extends FreeExamRepository {
  final FreeExamService _freeExamService;
  final UserRepository _userRepository;
  final FreeExamDao _freeExamDao;
  final ExamDao _examDao;

  FreeExamRepositoryImpl(
    this._freeExamService,
    this._userRepository,
    this._freeExamDao,
    this._examDao,
  );

  @override
  Future<Result<List<FreeExam>>> getFreeExamsOfTeacherByMe() async {
    var result = await _freeExamService.getFreeExamsOfTeacherByMe(
      _userRepository.getCurrentUserId,
    );
    switch (result) {
      case Ok(:final value):
        var freeExams = value.map((e) => FreeExam.fromDTO(e)).toList();
        var teacherId = _userRepository.getCurrentUserId;

        var freeExamCompanions = freeExams.map((e) {
          return e.toCompanion(teacherId);
        });
        var exams = value
            .map((e) => e.exam)
            .nonNulls
            .map((e) => Exam.fromDTO(e));
        var examCompanions = exams.map((e) {
          return e.toCompanion();
        });
        await _examDao.insertAllExams(examCompanions.toList());

        await _freeExamDao.insertAll(freeExamCompanions);
        return Result.ok(freeExams);
      default:
        return Result.error("Something went wrong");
    }
  }

  @override
  Future<Result<FreeExam>> getFreeExamById(int id) async {
    var result = await _freeExamService.getFreeExamById(id);
    switch (result) {
      case Ok(:final value):
        var freeExam = FreeExam.fromDTO(value);
        var teacherId = _userRepository.teacherUser?.id.toInt();
        _freeExamDao.insertExam(freeExam.toCompanion(teacherId ?? 0));
        return Result.ok(freeExam);
      default:
        return Result.error("Something went wrong");
    }
  }

  @override
  Stream<Result<FreeExam>> watchFreeExamById(int id) async* {
    yield* _freeExamDao.watchFreeExamById(id).map((freeExam) {
      if (freeExam != null) {
        return Result.ok(freeExam);
      } else {
        return Result.error("Free exam not found");
      }
    });
  }

  @override
  Stream<Result<List<FreeExam>>> watchAllFreeExamsOfTeacherByMe() async* {
    yield* _freeExamDao
        .watchFreeExamsOfTeacher(_userRepository.getCurrentUserId)
        .map((freeExams) => Result.ok(freeExams));
  }

  @override
  Future<Result<FreeExam>> updateFreeExam(FreeExam freeExam, int id) async {
    var result = await _freeExamService.updateFreeExam(
      _userRepository.getCurrentUserId,
      freeExam.toDTO(),
      id,
    );
    switch (result) {
      case Ok(:final value):
        var freeExam = FreeExam.fromDTO(value);
        var teacherId = _userRepository.teacherUser?.id.toInt();
        _freeExamDao.insertExam(freeExam.toCompanion(teacherId ?? 0));
        return Result.ok(freeExam);
      case Err(:final error):
        return Result.error(error.toString());
    }
  }

  @override
  Future<Result<FreeExam>> uploadFreeExamThumbnail(
    FreeExam freeExam,
    Uint8List thumbnail,
  ) async {
    var result = await _freeExamService.uploadFreeExamThumbnail(
      _userRepository.getCurrentUserId,
      freeExam.id,
      thumbnail,
    );
    switch (result) {
      case Ok(:final value):
        var freeExam = FreeExam.fromDTO(value);
        var teacherId = _userRepository.teacherUser?.id.toInt();
        _freeExamDao.insertExam(freeExam.toCompanion(teacherId ?? 0));
        return Result.ok(freeExam);
      case Err(:final error):
        return Result.error(error.toString());
    }
  }

  @override
  Future<Result<bool>> deleteFreeExam(int id) async {
    var result = await _freeExamService.deleteFreeExam(
      _userRepository.getCurrentUserId,
      id,
    );
    switch (result) {
      case Ok():
        _freeExamDao.deleteFreeExamById(id);
        return Result.ok(true);
      case Err(:final error):
        return Result.error(error.toString());
    }
  }

  @override
  Future<Result<FreeExam>> createFreeExam(FreeExam freeExam) async {
    var result = await _freeExamService.createFreeExam(
      _userRepository.getCurrentUserId,
      freeExam.toDTO(),
    );
    switch (result) {
      case Ok(:final value):
        var freeExam = FreeExam.fromDTO(value);
        var teacherId = _userRepository.teacherUser?.id.toInt();
        _freeExamDao.insertExam(freeExam.toCompanion(teacherId ?? 0));
        return Result.ok(freeExam);
      case Err(:final error):
        return Result.error(error.toString());
    }
  }

  @override
  Future<Result<PaginatedResponse<FreeExam>>>
  getFreeExamsOfStudentByMePaginated(PaginationParams params) async {
    var result = await _freeExamService.getFreeExamsOfStudentByMePaginated(
      params,
    );
    switch (result) {
      case Ok():
        var paginatedResponse = result.value;
        var freeExams = paginatedResponse.items
            .map((e) => FreeExam.fromDTO(e))
            .toList();
        var teacherId = 0;

        var freeExamCompanions = freeExams.map((e) {
          return e.toCompanion(teacherId);
        });
        var exams = paginatedResponse.items
            .map((e) => e.exam)
            .nonNulls
            .map((e) => Exam.fromDTO(e));
        var examCompanions = exams.map((e) {
          return e.toCompanion();
        });
        await _examDao.insertAllExams(examCompanions.toList());

        await _freeExamDao.insertAll(freeExamCompanions);

        // Update pagination state with the last loaded free exam ID
        if (freeExams.isNotEmpty) {
          final lastFreeExam = freeExams.last;
          setLastLoadedFreeExamId(lastFreeExam.id.toString());
        }

        var paginatedFreeExamResponse = PaginatedResponse<FreeExam>(
          items: freeExams,
          nextCursor: paginatedResponse.nextCursor,
          hasMore: paginatedResponse.hasMore,
          total: paginatedResponse.total,
        );

        return Result.ok(paginatedFreeExamResponse);
      default:
        return Result.error("Something went wrong");
    }
  }

  @override
  Future<List<FreeExam>> getAllFreeExamsFromCache() async {
    // Get cached free exams from local database without making an API call
    final freeExamItems = await _freeExamDao.getAllFreeExams();
    return freeExamItems.map((item) => FreeExam.fromItem(item)).toList();
  }

  // Pagination state management
  @override
  String? getLastLoadedFreeExamId() {
    return _freeExamDao.getLastLoadedFreeExamId();
  }

  @override
  void setLastLoadedFreeExamId(String? freeExamId) {
    _freeExamDao.setLastLoadedFreeExamId(freeExamId);
  }

  @override
  void resetPaginationState() {
    _freeExamDao.resetPaginationState();
  }

  @override
  Future<PaginationState<FreeExam>> getPaginationState() async {
    final lastLoadedId = getLastLoadedFreeExamId();
    return PaginationState<FreeExam>(
      nextCursor: lastLoadedId,
      hasMore: true, // This would need to be tracked properly
    );
  }

  @override
  Future<Result<List<FreeExam>>>
  getAllParticipatedFreeExamsOfStudentByMe() async {
    var result = await _freeExamService
        .getAllParticipatedFreeExamsOfStudentByMe();
    switch (result) {
      case Ok(:final value):
        var freeExams = value.map((e) => FreeExam.fromDTO(e)).toList();
        var teacherId = 0;

        var freeExamCompanions = freeExams.map((e) {
          return e.toCompanion(teacherId);
        });
        var exams = value
            .map((e) => e.exam)
            .nonNulls
            .map((e) => Exam.fromDTO(e));
        var examCompanions = exams.map((e) {
          return e.toCompanion();
        });
        await _examDao.insertAllExams(examCompanions.toList());

        await _freeExamDao.insertAll(freeExamCompanions);
        return Result.ok(freeExams);
      default:
        return Result.error("Something went wrong");
    }
  }

  @override
  Future<Result<FreeExam>> getFreeExamOfStudentByMeByExamId(
    int id, {
    bool refresh = false,
  }) async {
    if (refresh) {
      return await getFreeExamOfStudentByMeByExamIdFromServer(id);
    }

    // Try to get from cache first
    final cachedItem = await _freeExamDao.getFreeExamById(id);
    if (cachedItem != null) {
      return Result.ok(FreeExam.fromItem(cachedItem));
    }

    // If not in cache, fetch from server
    return await getFreeExamOfStudentByMeByExamIdFromServer(id);
  }

  @override
  Stream<Result<FreeExam>> watchFreeExamOfStudentByMeByExamId(int id) {
    return _freeExamDao.watchFreeExamById(id).map((freeExam) {
      if (freeExam == null) {
        return Result.error("Free exam not found");
      }
      return Result.ok(freeExam);
    });
  }

  @override
  Future<Result<FreeExam>> getFreeExamOfStudentByMeByExamIdFromServer(
    int id,
  ) async {
    var result = await _freeExamService.getFreeExamOfStudentByMeAndByExamID(id);
    switch (result) {
      case Ok(:final value):
        var freeExam = FreeExam.fromDTO(value);
        var teacherId = 0;
        _freeExamDao.insertExam(freeExam.toCompanion(teacherId));
        return Result.ok(freeExam);
      case Err(:final error):
        return Result.error(error.toString());
    }
  }

  @override
  Stream<Result<List<FreeExam>>> watchAllFreeExamsOfStudentByMe() async* {
    yield* _freeExamDao.watchAllFreeExams().map(
      (freeExams) => Result.ok(freeExams),
    );
  }

  @override
  Stream<Result<List<FreeExam>>>
  watchAllParticipatedFreeExamsOfStudentByMe() async* {
    yield* _freeExamDao.watchAllParticipatedFreeExams().map(
      (freeExams) => Result.ok(freeExams),
    );
  }

  @override
  Future<Result<FreeExam>> startFreeExamOfStudentByMeByFreeExamId(
    int freeExamId,
  ) async {
    var result = await _freeExamService.startFreeExamOfStudentByMeByFreeExamId(
      freeExamId,
    );
    switch (result) {
      case Ok(:final value):
        var freeExam = FreeExam.fromDTO(value);
        var teacherId = 0;
        _freeExamDao.insertExam(freeExam.toCompanion(teacherId));
        return Result.ok(freeExam);
      case Err(:final error):
        return Result.error(error.toString());
    }
  }

  @override
  Future<Result<FreeExamResult>> submitFreeExamOfStudentByMeByFreeExamId(
    int freeExamId,
    Map<int, int> answers,
  ) async {
    var result = await _freeExamService.submitFreeExamOfStudentByMeByFreeExamId(
      freeExamId,
      answers,
    );
    switch (result) {
      case Ok(:final value):
        var freeExamResult = FreeExamResult.fromModel(value);
        return Result.ok(freeExamResult);
      case Err(:final error):
        return Result.error(error.toString());
    }
  }

  @override
  Future<Result<FreeExamResult>> resultFreeExamOfStudentByMeByFreeExamId(
    int freeExamId,
  ) async {
    var result = await _freeExamService.resultFreeExamOfStudentByMeByFreeExamId(
      freeExamId,
    );
    switch (result) {
      case Ok(:final value):
        var freeExamResult = FreeExamResult.fromModel(value);
        return Result.ok(freeExamResult);
      case Err(:final error):
        return Result.error(error.toString());
    }
  }

  @override
  Future<Result<FreeExam>> updateFreeExamScore(
    int freeExamId,
    double score,
  ) async {
    try {
      // Update the participated status in the local cache
      await _freeExamDao.updateFreeExamScore(freeExamId, score);

      // Refresh the data from server to get the updated score
      var serverResult = await getFreeExamOfStudentByMeByExamIdFromServer(
        freeExamId,
      );

      if (serverResult case Ok(value: final freeExam)) {
        return Result.ok(freeExam);
      } else {
        return serverResult;
      }
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  // Public endpoints
  @override
  Future<Result<PaginatedResponse<FreeExam>>> getFreeExamsPaginated(
    PaginationParams params,
  ) async {
    var result = await _freeExamService.getFreeExamsPaginated(params);
    switch (result) {
      case Ok():
        var paginatedResponse = result.value;
        var freeExams = paginatedResponse.items
            .map((e) => FreeExam.fromDTO(e))
            .toList();

        var paginatedFreeExamResponse = PaginatedResponse<FreeExam>(
          items: freeExams,
          nextCursor: paginatedResponse.nextCursor,
          hasMore: paginatedResponse.hasMore,
          total: paginatedResponse.total,
        );

        return Result.ok(paginatedFreeExamResponse);
      default:
        return Result.error("Something went wrong");
    }
  }

  @override
  Future<Result<FreeExam>> getFreeExamByIdPublic(int id) async {
    var result = await _freeExamService.getFreeExamById(id);
    switch (result) {
      case Ok(:final value):
        var freeExam = FreeExam.fromDTO(value);
        return Result.ok(freeExam);
      case Err(:final error):
        return Result.error(error.toString());
    }
  }

  // Teacher results endpoints
  @override
  Future<Result<List<FreeExamResultSummaryDto>>> getFreeExamResults(
    int freeExamId,
  ) async {
    return await _freeExamService.getFreeExamResults(
      _userRepository.getCurrentUserId,
      freeExamId,
    );
  }

  @override
  Future<Result<FreeExamIndividualResultDTO>> getIndividualFreeExamResult(
    int freeExamId,
    int resultId,
  ) async {
    return await _freeExamService.getIndividualFreeExamResult(
      _userRepository.getCurrentUserId,
      freeExamId,
      resultId,
    );
  }
}
