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
  Map<int, int> answers; // MCQ answers: question_id -> option_index
  Map<int, String>?
  writtenAnswers; // NEW: Written answers: question_id -> image_url
  double score;
  double duration;
  ResultType resultType;
  int? rank;
  double negativeMarking;
  DateTime startTime;
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
    required this.startTime,
    this.rank,
    required this.negativeMarking,
    this.questions = const [],
    this.writtenAnswers,
  });

  static ExamResultModel? fromMap(Map<String, dynamic> map) {
    if (map case {
      "id": int? id,
      "student_id": int studentId,
      "exam_name": String examName,
      "result_type": String resultType,
      "course_exam_id": int courseExamId,
      "result": Map resultData,
      "start_time": String startTime,
      "score": double score,
      "duration": double duration,
    }) {
      var questions = map["questions"];
      List<QuestionModel> questionList = [];
      if (questions is List) {
        questionList = questions.map((e) => QuestionModel.fromJson(e)).toList();
      }

      // Handle new JSONB structure: { "mcq_answers": {...}, "written_answers": {...} }
      Map<int, int> mcqAnswers = {};
      Map<int, String>? writtenAnswers;

      if (resultData.containsKey("mcq_answers")) {
        // New format - mcq_answers is inside result
        var mcqData = resultData["mcq_answers"];
        if (mcqData is Map) {
          mcqAnswers = Map<int, int>.from(
            mcqData.map(
              (key, value) =>
                  MapEntry(int.tryParse(key.toString()), value as int),
            ),
          );
        }
      } else {
        // Old format (backward compatibility) - direct HashMap in result
        mcqAnswers = Map<int, int>.from(
          resultData.map(
            (key, value) =>
                MapEntry(int.tryParse(key.toString()), value as int),
          ),
        );
      }

      // written_answers is at the top level of the response, not inside result
      var writtenData = map["written_answers"];
      if (writtenData is Map) {
        final tempWrittenAnswers = <int, String>{};
        writtenData.forEach((key, value) {
          final questionId = int.tryParse(key.toString());
          if (questionId != null && value != null) {
            tempWrittenAnswers[questionId] = value.toString();
          }
        });
        // Only assign if map has entries
        if (tempWrittenAnswers.isNotEmpty) {
          writtenAnswers = tempWrittenAnswers;
        }
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
        answers: mcqAnswers,
        writtenAnswers: writtenAnswers,
        score: score,
        startTime: DateTime.parse(startTime).toLocal(),
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
      "start_time": startTime.toUtc().toIso8601String(),
      "negative_marking": negativeMarking,
    };
  }
}
