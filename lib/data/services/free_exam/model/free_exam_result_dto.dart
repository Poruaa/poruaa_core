import 'package:poruaa_core/data/services/question/model/question_model.dart';

class FreeExamResultDTO {
  int? id;
  int studentId;
  int freeExamId;
  String examName;
  Map<int, int> result;
  double score;
  double duration;
  double negativeMarking;
  List<QuestionModel> questions = const [];

  FreeExamResultDTO({
    required this.id,
    required this.studentId,
    required this.examName,
    required this.freeExamId,
    required this.result,
    required this.score,
    required this.duration,
    required this.negativeMarking,
    this.questions = const [],
  });

  static FreeExamResultDTO? fromMap(Map<String, dynamic> map) {
    if (map case {
      "id": int? id,
      "student_id": int studentId,
      "exam_name": String examName,
      "free_exam_id": int freeExamId,
      "result": Map result,
      "duration": double duration,
      "score": double score,
      "negative_marking": double? negativeMarking,
    }) {
      var questions = map["questions"];
      List<QuestionModel> questionList = [];
      if (questions is List) {
        questionList = questions.map((e) => QuestionModel.fromJson(e)).toList();
      }

      return FreeExamResultDTO(
        id: id,
        studentId: studentId,
        freeExamId: freeExamId,
        examName: examName,
        duration: duration,
        result: Map<int, int>.from(
          result.map(
            (key, value) => MapEntry(int.tryParse(key.toString()), value),
          ),
        ),
        score: score,
        negativeMarking: negativeMarking ?? 0.25,
        questions: questionList,
      );
    } else {
      return null;
    }
  }

  factory FreeExamResultDTO.fromJson(Map<String, dynamic> json) {
    var result = fromMap(json);
    if (result == null) {
      throw Exception('Invalid JSON format for FreeExamResultDTO');
    }
    return result;
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "student_id": studentId,
      "free_exam_id": freeExamId,
      "answers": result,
      "score": score,
      "duration": duration,
      "negative_marking": negativeMarking,
      "exam_name": examName,
    };
  }
}
