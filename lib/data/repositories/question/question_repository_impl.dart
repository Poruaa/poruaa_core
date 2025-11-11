import 'package:drift/drift.dart';
import 'package:poruaa_core/data/repositories/question/question_repository.dart';
import 'package:poruaa_core/data/dao/db/database.dart' as db;
import 'package:poruaa_core/data/dao/question/question_dao.dart';
import 'package:poruaa_core/data/repositories/user/user_repository.dart';
import 'package:poruaa_core/data/services/question/question_service.dart';
import 'package:poruaa_core/domain/models/question/question.dart';
import 'package:poruaa_core/utils/result.dart';

class QuestionRepositoryImpl extends QuestionRepository {
  final QuestionService _questionService;
  final QuestionDao _questionDao;
  final UserRepository _userRepository;
  QuestionRepositoryImpl(
    QuestionService questionService,
    QuestionDao questionDao,
    UserRepository userRepository,
  ) : _questionDao = questionDao,
      _questionService = questionService,
      _userRepository = userRepository;

  void dispose() {}

  @override
  Future<Result<Question>> getQuestion(int id) async {
    try {
      var result = await _questionDao.getExamById(id);
      if (result == null) {
        return Result.error("no exam found");
      }
      var options = result.options ?? [];
      return Result.ok(
        Question(
          id: result.id,
          question: result.question,
          options: List.generate(
            options.length,
            (index) => QuestionOption(no: index, option: options[index]),
          ),
          answer: result.answer,
          examId: result.examId,
          solve: result.solution ?? "",
        ),
      );
    } catch (e) {
      return Result.error("error");
    }
  }

  @override
  Future<Result<List<Question>>> getQuestionsOfExam(
    int id, {
    bool forceRefresh = false,
  }) async {
    try {
      if (!forceRefresh) {
        var questions = await _questionDao.getQuestionsByExamId(id);
        if (questions.isNotEmpty) {
          return Ok(questions);
        }
      }
      var result = await _questionService.getQuestionsOfExam(
        _userRepository.getCurrentUserId,
        id,
      );
      switch (result) {
        case Ok():
          var questions = result.value;
          _questionDao.replaceAllQuestionsOfExam(
            id,
            questions.map(
              (e) => db.QuestionItemsCompanion(
                id: Value(e.id),
                question: Value(e.question),
                options: Value(e.options),
                answer: Value(e.answer),
                examId: Value(e.examId),
                solution: Value(e.solve),
              ),
            ),
          );
          return Result.ok(
            questions.map((e) => Question.fromModel(e)).toList(),
          );
        case Err(error: final error):
          return Result.error(error);
      }
    } catch (e) {
      return Result.error("error");
    }
  }

  @override
  Stream<Result<List<Question>>> watchQuestionsOfExam(int id) {
    return _questionDao.watchQuestionsByExamId(id).map((e) => Result.ok(e));
  }

  @override
  Future<Result<List<Question>>> replaceAll(
    int examId,
    List<Question> questions,
  ) async {
    var result = await _questionService.replaceAll(
      teacherId: _userRepository.getCurrentUserId,
      examId: examId,
      questions: questions.map((e) => e.toModel()).toList(),
    );
    switch (result) {
      case Ok(:final value):
        var questions = value.map((e) => Question.fromModel(e)).toList();
        var questionItems = questions.map((e) {
          return e.toCompanion();
        }).toList();
        await _questionDao.replaceAllQuestionsOfExam(examId, questionItems);
        return Result.ok(questions);
      case Err(error: final error):
        return Result.error(error);
    }
  }
}
