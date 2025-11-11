import 'package:poruaa_core/data/services/free_exam/model/free_exam_result_dto.dart';
import 'package:poruaa_core/domain/models/question/question.dart';

class FreeExamResult {
  int? id;
  int studentId;
  int freeExamId;
  String examName;
  Map<int, int> answers;
  double score;
  double duration;
  List<Question> questions;
  double negativeMarking;
  int? rank;

  FreeExamResult({
    required this.id,
    required this.studentId,
    required this.freeExamId,
    required this.examName,
    required this.answers,
    required this.score,
    required this.duration,
    required this.negativeMarking,
    this.questions = const [],
    this.rank,
  });

  factory FreeExamResult.zero() {
    return FreeExamResult(
      id: 0,
      examName: "",
      studentId: 0,
      freeExamId: 0,
      answers: {},
      score: 0.0,
      negativeMarking: 0.0,
      duration: 0.0,
    );
  }

  FreeExamResult copyWith({
    int? id,
    int? studentId,
    int? freeExamId,
    String? examName,
    Map<int, int>? answers,
    double? score,
    List<Question>? questions,
    double? negativeMarking,
    double? duration,
    int? rank,
  }) {
    return FreeExamResult(
      id: id ?? this.id,
      examName: examName ?? this.examName,
      studentId: studentId ?? this.studentId,
      freeExamId: freeExamId ?? this.freeExamId,
      answers: answers ?? this.answers,
      score: score ?? this.score,
      duration: duration ?? this.duration,
      negativeMarking: negativeMarking ?? this.negativeMarking,
      questions: questions ?? this.questions,
      rank: rank ?? this.rank,
    );
  }

  static FreeExamResult fromModel(FreeExamResultDTO model) {
    return FreeExamResult(
      id: model.id,
      examName: model.examName,
      studentId: model.studentId,
      freeExamId: model.freeExamId,
      answers: model.result,
      score: model.score,
      duration: model.duration,
      negativeMarking: model.negativeMarking,
      questions: model.questions.map((q) => Question.fromModel(q)).toList(),
    );
  }

  FreeExamResultDTO toModel() {
    return FreeExamResultDTO(
      id: id,
      examName: examName,
      studentId: studentId,
      freeExamId: freeExamId,
      result: answers,
      score: score,
      duration: duration,
      negativeMarking: negativeMarking,
      questions: questions.map((q) => q.toModel()).toList(),
    );
  }
}
