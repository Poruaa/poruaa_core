import 'package:poruaa_core/data/services/course_exam/model/exam_result_model.dart';
import 'package:poruaa_core/domain/models/question/question.dart';

class ExamResult {
  int? id;
  int studentId;
  int courseExamId;
  String examName;
  final ResultType resultType;
  Map<int, int> answers;
  double score;
  double duration;
  int? rank;
  double negativeMarking;
  DateTime startTime;
  List<Question> questions;

  ExamResult({
    required this.id,
    required this.studentId,
    required this.courseExamId,
    required this.examName,
    required this.answers,
    required this.score,
    required this.duration,
    required this.resultType,
    this.rank,
    required this.negativeMarking,
    required this.startTime,
    this.questions = const [],
  });

  factory ExamResult.zero() {
    return ExamResult(
      id: 0,
      examName: "",
      studentId: 0,
      courseExamId: 0,
      answers: {},
      score: 0.0,
      duration: 0.0,
      resultType: ResultType.absent,
      negativeMarking: 0.0,
      startTime: DateTime.now(),
    );
  }

  ExamResult copyWith({
    int? id,
    int? studentId,
    int? courseExamId,
    String? examName,
    Map<int, int>? answers,
    double? score,
    ResultType? resultType,
    List<Question>? questions,
    double? duration,
    int? rank,
    double? negativeMarking,
    DateTime? startTime,
  }) {
    return ExamResult(
      id: id ?? this.id,
      examName: examName ?? this.examName,
      studentId: studentId ?? this.studentId,
      courseExamId: courseExamId ?? this.courseExamId,
      answers: answers ?? this.answers,
      score: score ?? this.score,
      duration: duration ?? this.duration,
      resultType: resultType ?? this.resultType,
      rank: rank ?? this.rank,
      negativeMarking: negativeMarking ?? this.negativeMarking,
      questions: questions ?? this.questions,
      startTime: startTime ?? this.startTime,
    );
  }

  static ExamResult fromModel(ExamResultModel model) {
    return ExamResult(
      id: model.id,
      examName: model.examName,
      studentId: model.studentId,
      courseExamId: model.courseExamId,
      answers: model.answers,
      score: model.score,
      duration: model.duration,
      resultType: model.resultType,
      rank: model.rank,
      negativeMarking: model.negativeMarking,
      questions: model.questions.map((q) => Question.fromModel(q)).toList(),
      startTime: model.startTime,
    );
  }

  ExamResultModel toModel() {
    return ExamResultModel(
      id: id,
      studentId: studentId,
      examName: examName,
      courseExamId: courseExamId,
      answers: answers,
      score: score,
      resultType: resultType,
      duration: duration,
      rank: rank,
      negativeMarking: negativeMarking,
      questions: questions.map((q) => q.toModel()).toList(),
      startTime: startTime,
    );
  }

  @override
  String toString() {
    return "ExamResult{id: $id, studentId: $studentId, courseExamId: $courseExamId, answers: $answers, score: $score}";
  }
}
