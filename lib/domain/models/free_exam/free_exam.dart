import 'package:drift/drift.dart';
import 'package:poruaa_core/data/dao/db/database.dart';
import 'package:poruaa_core/data/services/free_exam/model/free_exam_model.dart';
import 'package:poruaa_core/domain/models/exam/exam.dart';
import 'package:poruaa_core/domain/models/question/question.dart';

class FreeExam {
  final int id;
  final int examId;
  final String title;
  final int teacherId;
  final String? teacherName;
  final String? teacherProfileUrl;
  final String? thumbnail;
  final double duration;
  final int enrollmentCount;
  final DateTime? startAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isParticipated;
  final Exam? exam;
  final List<Question>? questions;
  final Map<int, int>? answers;
  final Map<int, int> selectedOptions;
  final double? negativeMarking;
  final double? score;

  FreeExam({
    required this.id,
    required this.title,
    required this.examId,
    required this.duration,
    required this.teacherId,
    this.teacherName,
    this.teacherProfileUrl,
    required this.enrollmentCount,
    this.thumbnail,
    required this.createdAt,
    required this.updatedAt,
    required this.isParticipated,
    required this.exam,
    required this.startAt,
    required this.questions,
    required this.answers,
    required this.selectedOptions,
    this.negativeMarking,
    this.score,
  });

  factory FreeExam.zero() => FreeExam(
    id: 0,
    title: '',
    examId: 0,
    teacherId: 0,
    teacherName: '',
    teacherProfileUrl: '',
    duration: 0,
    enrollmentCount: 0,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    startAt: null,
    isParticipated: false,
    exam: null,
    questions: [],
    answers: {},
    selectedOptions: {},
    negativeMarking: 0.25,
    score: null,
  );

  FreeExam copyWith({
    int? id,
    int? examId,
    String? title,
    String? thumbnail,
    int? teacherId,
    String? teacherName,
    String? teacherProfileUrl,
    double? duration,
    int? enrollmentCount,
    bool? isParticipated,
    DateTime? startAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    Exam? exam,
    List<Question>? questions,
    Map<int, int>? answers,
    Map<int, int>? selectedOptions,
    double? negativeMarking,
    double? score,
  }) {
    return FreeExam(
      id: id ?? this.id,
      title: title ?? this.title,
      examId: examId ?? this.examId,
      duration: duration ?? this.duration,
      teacherId: teacherId ?? this.teacherId,
      teacherName: teacherName ?? this.teacherName,
      teacherProfileUrl: teacherProfileUrl ?? this.teacherProfileUrl,
      enrollmentCount: enrollmentCount ?? this.enrollmentCount,
      thumbnail: thumbnail ?? this.thumbnail,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isParticipated: isParticipated ?? this.isParticipated,
      exam: exam ?? this.exam,
      startAt: startAt ?? this.startAt,
      questions: questions ?? this.questions,
      answers: answers ?? this.answers,
      selectedOptions: selectedOptions ?? this.selectedOptions,
      negativeMarking: negativeMarking ?? this.negativeMarking,
      score: score ?? this.score,
    );
  }

  factory FreeExam.fromDTO(FreeExamDTO model) {
    var examDTO = model.exam;
    Exam? exam;
    if (examDTO != null) {
      exam = Exam.fromDTO(examDTO);
    }
    return FreeExam(
      id: model.id,
      title: model.title,
      duration: model.duration,
      teacherId: model.teacherId,
      teacherName: model.teacherName,
      teacherProfileUrl: model.teacherProfileUrl,
      enrollmentCount: model.enrollmentCount,
      isParticipated: model.isParticipated ?? false,
      thumbnail: model.thumbnail,
      examId: model.examId,
      startAt: model.startAt,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      exam: exam,
      questions: model.questions?.map((q) => Question.fromModel(q)).toList(),
      answers: model.answers,
      selectedOptions: {},
      negativeMarking: model.negativeMarking,
      score: model.score,
    );
  }

  factory FreeExam.fromItem(FreeExamItem item) => FreeExam(
    id: item.id,
    title: item.title,
    examId: item.examId,
    duration: item.duration,
    enrollmentCount: item.enrollmentCount,
    thumbnail: item.thumbnail,
    createdAt: item.createdAt ?? DateTime.now(),
    updatedAt: item.updatedAt ?? DateTime.now(),
    isParticipated: item.participated,
    teacherId: item.teacherId ?? 0,
    teacherName: item.teacherName,
    teacherProfileUrl: item.teacherProfileUrl,
    exam: null, // Will be loaded separately if needed
    startAt: item.startAt,
    questions: null, // Will be loaded separately if needed
    answers: null, // Will be loaded separately if needed
    selectedOptions: {},
    negativeMarking: item.negativeMarking,
    score: item.score,
  );

  FreeExamDTO toDTO() {
    return FreeExamDTO(
      id: id,
      title: title,
      examId: examId,
      duration: duration,
      enrollmentCount: enrollmentCount,
      teacherId: teacherId,
      teacherName: teacherName,
      teacherProfileUrl: teacherProfileUrl,
      isParticipated: isParticipated,
      thumbnail: thumbnail,
      startAt: startAt,
      createdAt: createdAt,
      updatedAt: updatedAt,
      exam: exam?.toDTO(),
      questions: questions?.map((q) => q.toModel()).toList(),
      answers: answers,
      negativeMarking: negativeMarking,
      score: score,
    );
  }

  FreeExamItemsCompanion toCompanion(int teacherId) {
    return FreeExamItemsCompanion(
      id: Value(id),
      title: Value(title),
      examId: Value(examId),
      thumbnail: Value(thumbnail),
      duration: Value(duration),
      enrollmentCount: Value(enrollmentCount),
      participated: Value(isParticipated),
      startAt: Value(startAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      teacherId: Value(teacherId),
      teacherName: Value(teacherName),
      teacherProfileUrl: Value(teacherProfileUrl),
      negativeMarking: Value(negativeMarking ?? 0.25),
      score: Value(score),
    );
  }

  FreeExam shuffleOptions() {
    if (questions == null) return this;

    var shuffledQuestions = questions!.map((question) {
      var shuffledOptions = List<QuestionOption>.from(question.options);
      shuffledOptions.shuffle();
      return question.copyWith(options: shuffledOptions);
    }).toList();

    return copyWith(questions: shuffledQuestions);
  }
}
