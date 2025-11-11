import 'package:poruaa_core/data/services/question/model/question_model.dart';

class FreeExamIndividualResultDTO {
  int? id;
  String examName;
  int studentId;
  int freeExamId;
  Map<int, int> result;
  String resultType;
  double score;
  int? rank;
  double negativeMarking;
  double duration;
  List<QuestionModel> questions;

  FreeExamIndividualResultDTO({
    required this.id,
    required this.examName,
    required this.studentId,
    required this.freeExamId,
    required this.result,
    required this.resultType,
    required this.score,
    this.rank,
    required this.negativeMarking,
    required this.duration,
    required this.questions,
  });

  factory FreeExamIndividualResultDTO.fromJson(Map<String, dynamic> json) {
    var questionsJson = json["questions"] as List<dynamic>? ?? [];
    var questions = questionsJson
        .map((q) => QuestionModel.fromJson(q))
        .toList();

    return FreeExamIndividualResultDTO(
      id: json["id"],
      examName: json["exam_name"],
      studentId: json["student_id"],
      freeExamId: json["free_exam_id"],
      result: Map<int, int>.from(
        json["result"].map(
          (key, value) => MapEntry(int.tryParse(key.toString()) ?? 0, value),
        ),
      ),
      resultType: json["result_type"],
      score: json["score"]?.toDouble() ?? 0.0,
      rank: json["rank"],
      negativeMarking: json["negative_marking"]?.toDouble() ?? 0.25,
      duration: json["duration"]?.toDouble() ?? 0.0,
      questions: questions,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "exam_name": examName,
      "student_id": studentId,
      "free_exam_id": freeExamId,
      "result": result.map((key, value) => MapEntry(key.toString(), value)),
      "result_type": resultType,
      "score": score,
      "rank": rank,
      "negative_marking": negativeMarking,
      "duration": duration,
      "questions": questions.map((q) => q.toJson()).toList(),
    };
  }
}
