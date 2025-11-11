import 'package:poruaa_core/data/services/course_exam/model/exam_result_model.dart';
import 'package:poruaa_core/data/services/short_exam/model/short_exam_result_dto.dart';
import 'package:poruaa_core/domain/models/question/question.dart';

class ShortExamResult {
  int? id;
  int studentId;
  int courseExamId;
  String examName;
  Map<int, int> answers;
  double score;
  double duration;
  List<Question> questions;
  double negativeMarking;

  ShortExamResult({
    required this.id,
    required this.studentId,
    required this.courseExamId,
    required this.examName,
    required this.answers,
    required this.score,
    required this.duration,
    required this.negativeMarking,
    this.questions = const [],
  });

  factory ShortExamResult.zero() {
    return ShortExamResult(
        id: 0,
        examName: "",
        studentId: 0,
        courseExamId: 0,
        answers: {},
        score: 0.0,
        negativeMarking: 0.0,
        duration: 0.0);
  }

  ShortExamResult copyWith({
    int? id,
    int? studentId,
    int? courseExamId,
    String? examName,
    Map<int, int>? answers,
    double? score,
    ResultType? resultType,
    List<Question>? questions,
    double? negativeMarking,
    double? duration,
  }) {
    return ShortExamResult(
      id: id ?? this.id,
      examName: examName ?? this.examName,
      studentId: studentId ?? this.studentId,
      courseExamId: courseExamId ?? this.courseExamId,
      answers: answers ?? this.answers,
      score: score ?? this.score,
      duration: duration ?? this.duration,
      negativeMarking: negativeMarking ?? this.negativeMarking,
      questions: questions ?? this.questions,
    );
  }

  static ShortExamResult fromModel(ShortExamResultDTO model) {
    return ShortExamResult(
      id: model.id,
      examName: model.examName,
      studentId: model.studentId,
      courseExamId: model.shortExamId,
      answers: model.answers,
      score: model.score,
      duration: model.duration,
      negativeMarking: model.negativeMarking,
      questions: model.questions.map((q) => Question.fromModel(q)).toList(),
    );
  }

  ShortExamResultDTO toModel() {
    return ShortExamResultDTO(
      id: id,
      studentId: studentId,
      examName: examName,
      shortExamId: courseExamId,
      answers: answers,
      score: score,
      duration: duration,
      negativeMarking: negativeMarking,
      questions: questions.map((q) => q.toModel()).toList(),
    );
  }

  @override
  String toString() {
    return "ExamResult{id: $id, studentId: $studentId, courseExamId: $courseExamId, answers: $answers, score: $score}";
  }
}
