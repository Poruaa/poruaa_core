import 'package:drift/drift.dart';
import 'package:poruaa_core/data/repositories/exam/exam_repository.dart';
import 'package:poruaa_core/data/repositories/user/user_repository.dart';
import 'package:poruaa_core/data/services/exam/exam_service.dart';
import 'package:poruaa_core/data/dao/db/database.dart' as db;
import 'package:poruaa_core/data/dao/exam/exam_dao.dart';
import 'package:poruaa_core/domain/models/exam/exam.dart';
import 'package:poruaa_core/utils/result.dart';

class ExamRepositoryImpl extends ExamRepository {
  final ExamService _examService;
  final ExamDao _examDao;
  final UserRepository _userRepository;
  ExamRepositoryImpl(
    ExamService examService,
    UserRepository userRepository,
    ExamDao examDao,
  ) : _examDao = examDao,
      _examService = examService,
      _userRepository = userRepository;

  // @override
  // Stream<Result<List<Exam>>?> get stream =>
  //     _examDao.watchAllExams().map((event) {
  //       var value = event.map((e) => Exam.fromExamModel(e)).toList();
  //       return Result.ok(value);
  //     });

  @override
  Stream<Result<List<Exam>>?> watchAllExamsOffTeacher(int teacherId) async* {
    yield* _examDao.watchAllExamsOfTeacher(teacherId).map((event) {
      var value = event.map((e) => Exam.fromDTO(e)).toList();
      return Result.ok(value);
    });
  }

  // List<Exam> get exams {
  //   var value = _examSubject.value;
  //   if (value == null) {
  //     return [];
  //   }
  //   switch (value) {
  //     case Ok():
  //       return value.value;
  //     case Error():
  //       return [];
  //   }
  // }

  Future<void> _addExamToSubject(Exam exam) async {
    await _examDao.insertExam(
      db.ExamItemsCompanion(
        id: Value(exam.id),
        name: Value(exam.name),
        teacherId: Value(exam.teacherId),
      ),
    );
  }

  Future<void> _setExamToSubject(Exam exam) async {
    await _examDao.updateExam(exam.toCompanion());
  }

  Future<void> _deleteExamOfSubject(int id) async {
    await _examDao.deleteExam(id);
  }

  @override
  Future<Result<Exam>> create(Exam exam) async {
    var result = await _examService.create(
      _userRepository.getCurrentUserId,
      exam.name,
    );
    switch (result) {
      case Ok():
        var exam = Exam.fromDTO(result.value);
        _addExamToSubject(exam);
        return Result.ok(exam);
      case Err(:final error):
        return Result.error(error);
    }
  }

  @override
  Future<Result<bool>> delete(int id) async {
    var result = await _examService.delete(
      _userRepository.getCurrentUserId,
      id,
    );
    switch (result) {
      case Ok():
        _deleteExamOfSubject(id);
        return Ok(true);
      case Err():
        return result;
    }
  }

  @override
  Future<Result<List<Exam>>> getAllExamsOfTeacher(int teacherId) async {
    var result = await _examService.getExamsOfTeacher(teacherId.toInt());
    switch (result) {
      case Ok():
        var value = result.value;
        await _examDao.replaceAllExams(
          value
              .map(
                (e) => db.ExamItemsCompanion(
                  id: Value(e.id),
                  name: Value(e.name),
                  teacherId: Value(e.teacherId),
                ),
              )
              .toList(),
          teacherId,
        );
        var exams = value.map((e) => Exam.fromDTO(e)).toList();
        return Result.ok(exams);
      case Err():
        return Result.error("error");
    }
  }

  @override
  Future<bool> update(Exam exam) async {
    var result = await _examService.update(
      _userRepository.getCurrentUserId,
      exam.id,
      exam.name,
    );
    if (result) {
      _setExamToSubject(exam);
    }
    return result;
  }

  void dispose() {
    // _examSubject.close();
  }

  Future<Result<Exam>> _getExamFromServer(int id) async {
    var result = await _examService.getExamOfTeacherById(
      _userRepository.getCurrentUserId,
      id,
    );
    switch (result) {
      case Ok():
        var exam = Exam.fromDTO(result.value);
        _addExamToSubject(exam);
        return Result.ok(exam);
      case Err():
        return Result.error(result.error.toString());
    }
  }

  @override
  Future<Result<Exam>> getExam(int id) async {
    try {
      var result = await _examDao.getExamById(id);
      if (result == null) {
        return await _getExamFromServer(id);
      }
      return Result.ok(Exam.fromItem(result));
    } catch (e) {
      return Result.error("error");
    }
  }

  @override
  Stream<Result<Exam>> watchExam(int id) {
    return _examDao.watchExamById(id).asyncMap((event) async {
      if (event == null) {
        var result = await _getExamFromServer(id);
        return result;
      }
      return Result.ok(Exam.fromItem(event));
    });
  }
}
