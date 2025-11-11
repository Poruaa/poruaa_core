import 'dart:typed_data';

import 'package:poruaa_core/data/dao/exam/exam_dao.dart';
import 'package:poruaa_core/data/dao/short_exam/short_exam_dao.dart';
import 'package:poruaa_core/data/repositories/short_exam/short_exam_repository.dart';
import 'package:poruaa_core/data/repositories/user/user_repository.dart';
import 'package:poruaa_core/data/services/short_exam/short_exam_service.dart';
import 'package:poruaa_core/domain/models/exam/exam.dart';
import 'package:poruaa_core/domain/models/pagination/pagination_state.dart';
import 'package:poruaa_core/domain/models/short_exam/short_exam.dart';
import 'package:poruaa_core/domain/models/short_exam_result/short_exam_result.dart';
import 'package:poruaa_core/utils/result.dart';

class ShortExamRepositoryImpl extends ShortExamRepository {
  final ShortExamService _shortExamService;
  final UserRepository _userRepository;
  final ShortExamDao _shortExamDao;
  final ExamDao _examDao;

  ShortExamRepositoryImpl(
    this._shortExamService,
    this._userRepository,
    this._shortExamDao,
    this._examDao,
  );

  @override
  Future<Result<List<ShortExam>>> getShortExamsOfTeacherByMe() async {
    var teacherId = _userRepository.teacherUser?.id.toInt();
    if (teacherId == null) {
      return Result.error("Something went wrong");
    }
    var result = await _shortExamService.getShortExamsOfTeacherByMe(
      _userRepository.getCurrentUserId,
    );
    switch (result) {
      case Ok(:final value):
        var shortExams = value.map((e) => ShortExam.fromDTO(e)).toList();

        var shortExamCompanions = shortExams.map((e) {
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

        await _shortExamDao.insertAll(shortExamCompanions);
        return Result.ok(shortExams);
      default:
        return Result.error("Something went wrong");
    }
  }

  @override
  Future<Result<ShortExam>> getShortExamById(int id) async {
    var shortExam = await _shortExamDao.getShortExamByIdWithExam(id);
    if (shortExam != null) {
      return Result.ok(shortExam);
    }

    var result = await _shortExamService.getShortExamByExamId(id);
    switch (result) {
      case Ok(:final value):
        var shortExam = ShortExam.fromDTO(value);

        var examDto = value.exam;
        if (examDto == null) {
          return Result.error("Something went wrong");
        }
        var shortExamCompanions = shortExam.toCompanion(examDto.teacherId);

        await _shortExamDao.insertExam(shortExamCompanions);
        return Result.ok(shortExam);
      default:
        return Result.error("Something went wrong");
    }
  }

  @override
  Stream<Result<ShortExam>> watchShortExamById(int id) async* {
    await getShortExamById(id);
    yield* _shortExamDao.watchShortExamByIdWithExam(id).map((e) {
      if (e == null) {
        return Result.error("Something went wrong");
      }
      return Result.ok(e);
    });
  }

  @override
  Stream<Result<List<ShortExam>>> watchAllShortExamsOfTeacherByMe() async* {
    var teacherId = _userRepository.currentUser?.id.toInt();
    if (teacherId == null) {
      return;
    }
    yield* _shortExamDao
        .watchAllShortExamsOfTeacher(teacherId)
        .map((e) => Result.ok(e));
  }

  @override
  Future<Result<ShortExam>> updateShortExam(ShortExam shortExam, int id) async {
    var result = await _shortExamService.updateShortExam(
      _userRepository.getCurrentUserId,
      shortExam.toDTO(),
      id,
    );
    switch (result) {
      case Ok(:final value):
        var shortExam = ShortExam.fromDTO(value);
        var teacherId = _userRepository.teacherUser?.id.toInt();
        _shortExamDao.insertExam(shortExam.toCompanion(teacherId ?? 0));
        return Result.ok(shortExam);
      default:
        return Result.error("Something went wrong");
    }
  }

  @override
  Future<Result<ShortExam>> uploadShortExamThumbnail(
    ShortExam shortExam,
    Uint8List thumbnail,
  ) async {
    if (thumbnail.length > 100 * 1024) {
      return Result.error("Image size should be less than 100kb");
    }
    var result = await _shortExamService.uploadShortExamThumbnail(
      _userRepository.getCurrentUserId,
      shortExam.id,
      thumbnail,
    );
    switch (result) {
      case Ok(:final value):
        var shortExam = ShortExam.fromDTO(value);
        _shortExamDao.updateThumbnail(shortExam.id, shortExam.thumbnail ?? "");
        return Result.ok(shortExam);
      default:
        return Result.error("Something went wrong");
    }
  }

  @override
  Future<Result<ShortExam>> deleteShortExam(int id) async {
    var result = await _shortExamService.deleteShortExam(
      _userRepository.getCurrentUserId,
      id,
    );
    switch (result) {
      case Ok(:final value):
        var shortExam = ShortExam.fromDTO(value);
        _shortExamDao.deleteShortExamById(id);
        return Result.ok(shortExam);
      case Err(:final error):
        return Result.error(error.toString());
    }
  }

  @override
  Future<Result<ShortExam>> createShortExam(ShortExam shortExam) async {
    var result = await _shortExamService.createShortExam(
      _userRepository.getCurrentUserId,
      shortExam.toDTO(),
    );
    switch (result) {
      case Ok(:final value):
        var shortExam = ShortExam.fromDTO(value);
        var teacherId = _userRepository.teacherUser?.id.toInt();
        _shortExamDao.insertExam(shortExam.toCompanion(teacherId ?? 0));
        return Result.ok(shortExam);
      case Err(:final error):
        return Result.error(error.toString());
    }
  }

  // @override
  // Future<Result<List<ShortExam>>> getAllShortExamsOfStudentByMe() async {
  //   var result = await _shortExamService.getAllShortExamsOfStudentByMe();
  //   switch (result) {
  //     case Ok(:final value):
  //       var shortExams = value.map((e) => ShortExam.fromDTO(e)).toList();
  //       var teacherId = 0;

  //       var shortExamCompanions = shortExams.map((e) {
  //         return e.toCompanion(teacherId);
  //       });
  //       var exams =
  //           value.map((e) => e.exam).nonNulls.map((e) => Exam.fromDTO(e));
  //       var examCompanions = exams.map((e) {
  //         return e.toCompanion();
  //       });
  //       await _examDao.insertAllExams(examCompanions.toList());

  //       await _shortExamDao.insertAll(shortExamCompanions);
  //       return Result.ok(shortExams);
  //     default:
  //       return Result.error("Something went wrong");
  //   }
  // }

  @override
  Future<Result<PaginatedResponse<ShortExam>>>
  getShortExamsOfStudentByMePaginated(PaginationParams params) async {
    var result = await _shortExamService.getShortExamsOfStudentByMePaginated(
      params,
    );
    switch (result) {
      case Ok():
        var paginatedResponse = result.value;
        var shortExams = paginatedResponse.items
            .map((e) => ShortExam.fromDTO(e))
            .toList();
        var teacherId = 0;

        var shortExamCompanions = shortExams.map((e) {
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

        await _shortExamDao.insertAll(shortExamCompanions);

        // Update pagination state with the last loaded short exam ID
        if (shortExams.isNotEmpty) {
          final lastShortExam = shortExams.last;
          setLastLoadedShortExamId(lastShortExam.id.toString());
        }

        var paginatedShortExamResponse = PaginatedResponse<ShortExam>(
          items: shortExams,
          nextCursor: paginatedResponse.nextCursor,
          hasMore: paginatedResponse.hasMore,
          total: paginatedResponse.total,
        );

        return Result.ok(paginatedShortExamResponse);
      default:
        return Result.error("Something went wrong");
    }
  }

  @override
  Future<List<ShortExam>> getAllShortExamsFromCache() async {
    // Get cached short exams from local database without making an API call
    final shortExamItems = await _shortExamDao.getAllShortExams();
    return shortExamItems.map((item) => ShortExam.fromItem(item)).toList();
  }

  // Pagination state management
  @override
  String? getLastLoadedShortExamId() {
    return _shortExamDao.getLastLoadedShortExamId();
  }

  @override
  void setLastLoadedShortExamId(String? shortExamId) {
    _shortExamDao.setLastLoadedShortExamId(shortExamId);
  }

  @override
  void resetPaginationState() {
    _shortExamDao.resetPaginationState();
  }

  @override
  Future<PaginationState<ShortExam>> getPaginationState() async {
    final cachedShortExams = await getAllShortExamsFromCache();
    final lastLoadedId = getLastLoadedShortExamId();

    if (cachedShortExams.isEmpty) {
      return const PaginationState<ShortExam>();
    }

    // Find the last short exam in the cached data
    final lastShortExam = cachedShortExams.last;
    final nextCursor = lastLoadedId ?? lastShortExam.id.toString();

    return PaginationState<ShortExam>(
      items: cachedShortExams,
      nextCursor: nextCursor,
      hasMore: true, // Assume there might be more data
      isLoading: false,
      isLoadingMore: false,
    );
  }

  @override
  Future<Result<List<ShortExam>>>
  getAllEnrolledShortExamsOfStudentByMe() async {
    var result = await _shortExamService
        .getAllEnrolledShortExamsOfStudentByMe();
    switch (result) {
      case Ok(:final value):
        var shortExams = value.map((e) => ShortExam.fromDTO(e)).toList();
        var teacherId = 0;

        var shortExamCompanions = shortExams.map((e) {
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

        await _shortExamDao.insertAll(shortExamCompanions);
        return Result.ok(shortExams);
      default:
        return Result.error("Something went wrong");
    }
  }

  @override
  Future<Result<ShortExam>> getShortExamOfStudentByMeByExamId(
    int id, {
    bool refresh = false,
  }) async {
    if (!refresh) {
      var shortExam = await _shortExamDao.getShortExamById(id);
      if (shortExam != null) {
        return Result.ok(shortExam);
      }
    }
    var shortExam = await getShortExamOfStudentByMeByExamIdFromServer(id);
    if (shortExam case Ok()) {
      return shortExam;
    } else {
      return Result.error("Something went wrong");
    }
  }

  @override
  Future<Result<ShortExam>> getShortExamOfStudentByMeByExamIdFromServer(
    int id,
  ) async {
    var result = await _shortExamService.getShortExamOfStudentByMeAndByExamID(
      id,
    );
    switch (result) {
      case Ok(:final value):
        var shortExam = ShortExam.fromDTO(value);
        var teacherId = 0;
        var shortExamCompanion = shortExam.toCompanion(teacherId);

        var exam = shortExam.exam;

        var examCompanion = exam?.toCompanion();
        if (examCompanion != null) {
          await _examDao.insertExam(examCompanion);
        }
        await _shortExamDao.insertExam(shortExamCompanion);

        // Update pagination state when loading individual short exam (e.g., from deep link)
        setLastLoadedShortExamId(shortExam.id.toString());

        return Result.ok(shortExam);
      default:
        return Result.error("Something went wrong");
    }
  }

  @override
  Stream<Result<List<ShortExam>>> watchAllShortExamsOfStudentByMe() async* {
    yield* _shortExamDao.watchAllShortExams().map((e) => Result.ok(e));
  }

  @override
  Stream<Result<List<ShortExam>>>
  watchAllEnrolledShortExamsOfStudentByMe() async* {
    yield* _shortExamDao.watchAllEnrolledShortExams().map((e) => Result.ok(e));
  }

  @override
  Future<Result<ShortExam>> startShortExamOfStudentByMeByShortExamId(
    int shortExamId,
  ) async {
    var result = await _shortExamService
        .startShortExamOfStudentByMeByCourseExamId(shortExamId);

    switch (result) {
      case Ok(:final value):
        var shortExam = ShortExam.fromDTO(value);
        var startAt = shortExam.startAt;
        if (startAt != null) {
          await _shortExamDao.updateStartAtStatus(shortExam.id, startAt);
        }

        return Result.ok(shortExam);
      default:
        return Result.error("Something went wrong");
    }
  }

  @override
  Future<Result<ShortExamResult>> submitShortExamOfStudentByMeByShortExamId(
    int shortExamId,
    Map<int, int> answers,
  ) async {
    var result = await _shortExamService
        .submitShortExamOfStudentByMeByShortExamId(shortExamId, answers);
    return result.map((value) => ShortExamResult.fromModel(value));
  }

  @override
  Future<Result<ShortExamResult>> resultShortExamOfStudentByMeByShortExamId(
    int shortExamId,
  ) async {
    var result = await _shortExamService
        .resultShortExamOfStudentByMeByShortExamId(shortExamId);
    return result.map((value) => ShortExamResult.fromModel(value));
  }

  @override
  Stream<Result<ShortExam>> watchShortExamOfStudentByMeById(int id) async* {
    await getShortExamOfStudentByMeByExamId(id);
    yield* _shortExamDao.watchShortExamById(id).map((e) {
      if (e == null) {
        return Result.error("Something went wrong");
      }
      return Result.ok(e);
    });
  }

  @override
  Future<Result<bool>> enrollShortExam(int examId) async {
    var exam = await _shortExamDao.getShortExamById(examId);
    if (exam == null) {
      var shortExamResult = await getShortExamOfStudentByMeByExamId(examId);
      if (shortExamResult case Ok()) {
        exam = shortExamResult.value;
      } else {
        return Result.error("Failed to enroll");
      }
    }
    if (exam.isEnrolled) {
      return Result.error('already enrolled');
    }

    var enrolled = await _shortExamService.enrollShortExam(examId);

    if (enrolled) {
      await _shortExamDao.updateEnrollmentStatus(examId);
      // Note: The database update will trigger the stream listeners
      // which will automatically update the UI through the view models
      return Result.ok(true);
    }

    return Result.error("Failed to enroll");
  }
}
