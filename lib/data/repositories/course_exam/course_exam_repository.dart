// import 'package:poruaa_core/data/repositories/teacher/course_exam/course_exam_dao.dart';
import 'package:drift/drift.dart';
import 'package:poruaa_core/data/repositories/user/user_repository.dart';
import 'package:poruaa_core/data/services/course_exam/course_exam_service.dart';
import 'package:poruaa_core/data/services/course_exam/model/publish_ranks_response.dart';
import 'package:poruaa_core/data/dao/course_exam/course_exam_dao.dart';
import 'package:poruaa_core/data/dao/cache/exam_result_cache_dao.dart';
import 'package:poruaa_core/data/dao/db/database.dart';
import 'package:poruaa_core/domain/models/course_exam/course_exam.dart';
import 'package:poruaa_core/domain/models/course_exam_result_with_student/course_exam_result_with_student.dart';
import 'package:poruaa_core/domain/models/exam_result/exam_result.dart';
import 'package:poruaa_core/utils/result.dart';

class CourseExamRepository {
  final CourseExamService _courseExamService;
  final CourseExamDao _courseExamDao;
  final ExamResultCacheDao _examResultCacheDao;
  final UserRepository _userRepository;
  const CourseExamRepository(
    CourseExamService courseExamService,
    CourseExamDao courseExamDao,
    ExamResultCacheDao examResultCacheDao,
    UserRepository userRepository,
  ) : _courseExamService = courseExamService,
      _userRepository = userRepository,
      _courseExamDao = courseExamDao,
      _examResultCacheDao = examResultCacheDao;

  Future<Result<List<CourseExam>>> getCourseExamsOfCourse(int courseId) async {
    var result = await _courseExamService.getCourseExams(
      _userRepository.getCurrentUserId,
      courseId,
    );
    switch (result) {
      case Ok():
        _courseExamDao.replaceAllCourseExamsOfCourse(courseId, result.value);
        return Result.ok(
          result.value.map((e) => CourseExam.fromModel(e)).toList(),
        );
      case Err():
        return Result.error(result.error);
    }
  }

  Future<Result<CourseExam>> addExam(
    int courseId,
    int examId,
    String title,
    DateTime startAt,
    DateTime endAt,
    double negativeMarking,
  ) async {
    var result = await _courseExamService.addExam(
      _userRepository.getCurrentUserId,
      courseId,
      examId,
      title,
      startAt,
      endAt,
      negativeMarking,
    );
    switch (result) {
      case Ok():
        await _courseExamDao.insertCourseExam(
          CourseExamItemsCompanion(
            courseId: Value(result.value.courseId),
            examId: Value(result.value.examId),
            title: Value(result.value.title),
            startAt: Value(result.value.startAt),
            endAt: Value(result.value.endAt),
            free: Value(result.value.free),
            negativeMarking: Value(result.value.negativeMarking ?? 0.25),
          ),
        );
        return Result.ok(CourseExam.fromModel(result.value));
      case Err():
        return Result.error(result.error);
    }
  }

  Future<Result<bool>> deleteCourseExam(int id) async {
    var result = await _courseExamService.deleteCourseExam(
      _userRepository.getCurrentUserId,
      id,
    );
    if (result case Ok()) {
      await _courseExamDao.deleteCourseExam(id);
    }
    return result;
  }

  Future<Result<CourseExam>> getCourseExamById(
    int id, {
    bool refresh = false,
  }) async {
    var result = await _courseExamDao.getFlatCourseExamById(id);
    if (result != null) {
      return Result.ok(CourseExam.fromModel(result));
    }
    var courseExamResult = await _courseExamService.getCourseExamById(
      _userRepository.getCurrentUserId,
      id,
    );
    switch (courseExamResult) {
      case Ok(:final value):
        _courseExamDao.insertCourseExamOrUpdate(
          CourseExamItem(
            id: value.id,
            courseId: value.courseId,
            examId: value.examId,
            title: value.title,
            startAt: value.startAt,
            endAt: value.endAt,
            free: value.free,
            negativeMarking: value.negativeMarking ?? 0.25,
          ),
        );
        return Result.ok(CourseExam.fromModel(value));
      case Err():
        return Result.error("Error getting course exams");
    }
  }

  Stream<Result<CourseExam>> watchCourseExamById(int id) async* {
    try {
      await getCourseExamById(id);
    } catch (_) {
      yield Result.error("Course exam not found");
    }
    yield* _courseExamDao.watchCourseExamById(id).map((event) {
      if (event == null) {
        return Result.error("Course exam not found");
      }
      return Result.ok(CourseExam.fromModel(event));
    });
  }

  Future<bool> update(CourseExam course) async {
    var result = await _courseExamService.update(
      _userRepository.getCurrentUserId,
      course.id,
      course.examId,
      course.courseId,
      course.title,
      course.startAt,
      course.endAt,
      course.free,
      course.negativeMarking,
    );
    if (result) {
      _courseExamDao.updateCourseExam(
        CourseExamItem(
          id: course.id,
          courseId: course.courseId,
          examId: course.examId,
          title: course.title,
          startAt: course.startAt,
          endAt: course.endAt,
          free: course.free,
          negativeMarking: course.negativeMarking ?? 0.25,
        ),
      );
    }
    return false;
  }

  Stream<Result<List<CourseExam>>> watchCourseExamsOfCourse(int courseId) {
    return _courseExamDao.watchAllCourseExamsOfCourse(courseId).map((event) {
      var value = event.map((e) => CourseExam.fromModel(e)).toList();
      return Result.ok(value);
    });
  }

  Future<Result<List<CourseExam>>> getAllCourseExamsOfStudentByMe() async {
    var result = await _courseExamService.getAllCourseExamsOfStudentByMe();
    return result.map(
      (value) => value.map((e) => CourseExam.fromModel(e)).toList(),
    );
  }

  Future<Result<List<CourseExam>>> getCourseExamsOfStudentByMe(
    int courseId,
  ) async {
    var result = await _courseExamService.getCourseExamsOfStudentByMe(courseId);
    switch (result) {
      case Ok():
        _courseExamDao.replaceAllCourseExamsOfCourse(courseId, result.value);
        return Result.ok(
          result.value.map((e) => CourseExam.fromModel(e)).toList(),
        );
      case Err():
        return Result.error(result.error);
    }
  }

  Future<Result<List<CourseExam>>> getFreeCourseExamsOfStudentByMe(
    int courseId,
  ) async {
    var result = await _courseExamService.getFreeCourseExamsOfStudentByMe(
      courseId,
    );
    switch (result) {
      case Ok():
        _courseExamDao.replaceAllCourseExamsOfCourse(courseId, result.value);
        return Result.ok(
          result.value.map((e) => CourseExam.fromModel(e)).toList(),
        );
      case Err():
        return Result.error(result.error);
    }
  }

  Stream<Result<List<CourseExam>>> watchAllCourseExamsOfStudentByMe() async* {
    var result = await _courseExamService.getAllCourseExamsOfStudentByMe();
    yield result.map(
      (value) => value.map((e) => CourseExam.fromModel(e)).toList(),
    );
    // switch (result) {
    //   case Ok():
    //     yield Result.ok(
    //         result.value.map((e) => CourseExam.fromModel(e)).toList());
    //   case Error():
    //     yield Result.error(result.error);
    // }
  }

  Stream<Result<CourseExam>> watchCourseExamOfStudentByMeByCourseExamId(
    int courseExamId,
  ) async* {
    var result = await _courseExamService
        .getCourseExamOfStudentByMeByCourseExamId(courseExamId);
    yield result.map((value) => CourseExam.fromModel(value));
  }

  Future<Result<CourseExam>> startCourseExamOfStudentByMeByCourseExamId(
    int courseExamId,
  ) async {
    var result = await _courseExamService
        .startCourseExamOfStudentByMeByCourseExamId(courseExamId);
    return result.map((value) => CourseExam.fromModel(value));
  }

  Future<Result<ExamResult>> submitCourseExamOfStudentByMeByCourseExamId(
    int courseExamId,
    Map<int, int> answers,
  ) async {
    var result = await _courseExamService
        .submitCourseExamOfStudentByMeByCourseExamId(courseExamId, answers);

    switch (result) {
      case Ok(:final value):
        final examResult = ExamResult.fromModel(value);
        // Cache the result after successful submission
        await _examResultCacheDao.insertOrUpdateExamResult(examResult);
        return Result.ok(examResult);
      case Err():
        return Result.error(result.error);
    }
  }

  Future<Result<ExamResult>> resultCourseExamOfStudentByMeByCourseExamId(
    int courseExamId,
  ) async {
    final studentId = _userRepository.getStudentId;

    // First, try to get result from backend
    var result = await _courseExamService
        .resultCourseExamOfStudentByMeByCourseExamId(courseExamId);

    switch (result) {
      case Ok(:final value):
        final examResult = ExamResult.fromModel(value);

        // Check if the result is valid (has id and answers)
        if (examResult.id != null && examResult.answers.isNotEmpty) {
          // Valid result from backend - cache it and return
          await _examResultCacheDao.insertOrUpdateExamResult(examResult);
          return Result.ok(examResult);
        } else {
          // Invalid result (id is null or empty answers) - try cache
          final cachedResult = await _examResultCacheDao
              .getExamResultByCourseExamId(studentId, courseExamId);

          if (cachedResult != null) {
            return Result.ok(
              cachedResult.copyWith(
                questions: examResult.questions,
                rank: examResult.rank,
              ),
            );
          } else {
            return Result.ok(examResult);
            // No cache available, return the backend error
            // return Result.error("No exam result available");
          }
        }
      case Err():
        // Backend error - try to get from cache
        final cachedResult = await _examResultCacheDao
            .getExamResultByCourseExamId(studentId, courseExamId);

        if (cachedResult != null) {
          var startTime = cachedResult.startTime;
          var endTime = startTime.add(
            Duration(minutes: cachedResult.duration.toInt()),
          );
          if (DateTime.now().isBefore(endTime)) {
            return Result.error(result.error);
          }
          return Result.ok(cachedResult);
        } else {
          // No cache available, return the backend error
          return Result.error(result.error);
        }
    }
  }

  Future<Result<List<CourseExamResultWithStudent>>>
  getCourseExamResultsOfCourseExamById(int courseExamId) async {
    var result = await _courseExamService.getCourseExamResultsOfCourseExamById(
      _userRepository.getCurrentUserId,
      courseExamId,
    );
    return result.map(
      (value) =>
          value.map((e) => CourseExamResultWithStudent.fromDto(e)).toList(),
    );
  }

  Future<Result<PublishRanksResponse>> publishCourseExamRanks(
    int courseExamId,
  ) async {
    return await _courseExamService.publishCourseExamRanks(
      _userRepository.getCurrentUserId,
      courseExamId,
    );
  }

  Future<Result<int>> clearCourseExamResults(int courseExamId) async {
    return await _courseExamService.clearCourseExamResults(
      _userRepository.getCurrentUserId,
      courseExamId,
    );
  }

  Future<Result<CourseExam>> updateFreeStatus(
    int courseExamId,
    bool free,
  ) async {
    var result = await _courseExamService.updateFreeStatus(
      _userRepository.getCurrentUserId,
      courseExamId,
      free,
    );
    switch (result) {
      case Ok():
        // Update the local database with the new free status
        await _courseExamDao.updateCourseExamFreeStatus(courseExamId, free);
        return Result.ok(CourseExam.fromModel(result.value));
      case Err():
        return Result.error(result.error);
    }
  }

  Future<Result<ExamResult>> getIndividualCourseExamResult(
    int courseExamId,
    int resultId,
  ) async {
    var result = await _courseExamService.getIndividualCourseExamResult(
      _userRepository.getCurrentUserId,
      courseExamId,
      resultId,
    );
    return result.map((value) => ExamResult.fromModel(value));
  }
}
