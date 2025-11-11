import 'package:poruaa_core/data/services/question/model/question_model.dart';
import 'package:poruaa_core/utils/result.dart';

abstract class QuestionService {
  Future<Result<List<QuestionModel>>> getQuestionsOfExam(
    int teacherId,
    int examId,
  );

  Future<Result<List<QuestionModel>>> replaceAll({
    required int teacherId,
    required int examId,
    required List<QuestionModel> questions,
  });
}
