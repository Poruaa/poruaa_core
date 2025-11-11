import 'package:poruaa_core/domain/models/question/question.dart';
import 'package:poruaa_core/utils/result.dart';

abstract class QuestionRepository {
  Future<Result<List<Question>>> getQuestionsOfExam(
    int examId, {
    bool forceRefresh = false,
  });
  Stream<Result<List<Question>>> watchQuestionsOfExam(int id);

  Future<Result<List<Question>>> replaceAll(int examId, List<Question> course);

  Future<Result<Question>> getQuestion(int id);
}
