import 'package:poruaa_core/data/services/question/model/question_model.dart';

enum ResultType {
  absent,
  present;

  @override
  String toString() {
    return switch (this) {
      ResultType.absent => "Absent",
      ResultType.present => "Present",
    };
  }

  static ResultType? fromString(String value) {
    return switch (value) {
      "Absent" => ResultType.absent,
      "Present" => ResultType.present,
      _ => null,
    };
  }
}

class ExamResultModel {
  int? id;
  int studentId;
  int courseExamId;
  String examName;
  Map<int, int> answers;
  double score;
  double duration;
  ResultType resultType;
  int? rank;
  double negativeMarking;
  List<QuestionModel> questions = const [];

  ExamResultModel({
    required this.id,
    required this.studentId,
    required this.examName,
    required this.courseExamId,
    required this.answers,
    required this.score,
    required this.duration,
    required this.resultType,
    this.rank,
    required this.negativeMarking,
    this.questions = const [],
  });

  static ExamResultModel? fromMap(Map<String, dynamic> map) {
    if (map case {
      "id": int? id,
      "student_id": int studentId,
      "exam_name": String examName,
      "result_type": String resultType,
      "course_exam_id": int courseExamId,
      "result": Map answers,
      "score": double score,
      "duration": double duration,
    }) {
      var questions = map["questions"];
      List<QuestionModel> questionList = [];
      if (questions is List) {
        questionList = questions.map((e) => QuestionModel.fromJson(e)).toList();
      }

      return ExamResultModel(
        id: id,
        studentId: studentId,
        courseExamId: courseExamId,
        examName: examName,
        duration: duration,
        resultType:
            ResultType.fromString(resultType) ??
            ResultType.absent, // Default to absent if null
        answers: Map<int, int>.from(
          answers.map(
            (key, value) => MapEntry(int.tryParse(key.toString()), value),
          ),
        ),
        score: score,
        rank: map["rank"] as int?,
        negativeMarking: (map["negative_marking"] as num?)?.toDouble() ?? 0.0,
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
      "course_exam_id": courseExamId,
      "answers": answers,
      "result_type": resultType.toString(),
      "score": score,
      "exam_name": examName,
      "duration": duration,
      "rank": rank,
      "negative_marking": negativeMarking,
    };
  }
}
