import 'package:poruaa_core/data/services/question/model/question_model.dart';

class ShortExamResultDTO {
  int? id;
  int studentId;
  int shortExamId;
  String examName;
  Map<int, int> answers;
  double score;
  double duration;
  double negativeMarking;
  List<QuestionModel> questions = const [];

  ShortExamResultDTO({
    required this.id,
    required this.studentId,
    required this.examName,
    required this.shortExamId,
    required this.answers,
    required this.score,
    required this.duration,
    required this.negativeMarking,
    this.questions = const [],
  });

  static ShortExamResultDTO? fromMap(Map<String, dynamic> map) {
    if (map case {
      "id": int? id,
      "student_id": int studentId,
      "exam_name": String examName,
      "short_exam_id": int courseExamId,
      "answers": Map answers,
      "duration": double duration,
      "score": double score,
      "negative_marking": double? negativeMarking,
    }) {
      var questions = map["questions"];
      List<QuestionModel> questionList = [];
      if (questions is List) {
        questionList = questions.map((e) => QuestionModel.fromJson(e)).toList();
      }

      return ShortExamResultDTO(
        id: id,
        studentId: studentId,
        shortExamId: courseExamId,
        examName: examName,
        duration: duration,
        answers: Map<int, int>.from(
          answers.map(
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

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "student_id": studentId,
      "course_exam_id": shortExamId,
      "answers": answers,
      "score": score,
      "duration": duration,
      "negative_marking": negativeMarking,
      "exam_name": examName,
    };
  }
}
