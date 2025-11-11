import 'package:drift/drift.dart';
import 'package:poruaa_core/data/dao/db/database.dart';
import 'package:poruaa_core/data/services/short_exam/model/short_exam_model.dart';
import 'package:poruaa_core/domain/models/exam/exam.dart';
import 'package:poruaa_core/domain/models/question/question.dart';

class ShortExam {
  final int id;
  final int examId;
  final String title;
  final int teacherId;
  final String? teacherName;
  final String? thumbnail;
  final double price;
  final double duration;
  final double rating;
  final int enrollmentCount;
  final int star1Count;
  final int star2Count;
  final int star3Count;
  final int star4Count;
  final int star5Count;
  final DateTime? startAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isEnrolled;
  final Exam? exam;
  final List<Question>? questions;
  final Map<int, int>? answers;
  final double? negativeMarking;

  ShortExam({
    required this.id,
    required this.title,
    required this.examId,
    required this.duration,
    required this.price,
    required this.rating,
    required this.teacherId,
    this.teacherName,
    required this.enrollmentCount,
    required this.star1Count,
    required this.star2Count,
    required this.star3Count,
    required this.star4Count,
    required this.star5Count,
    this.thumbnail,
    required this.createdAt,
    required this.updatedAt,
    required this.isEnrolled,
    required this.exam,
    required this.startAt,
    required this.questions,
    required this.answers,
    this.negativeMarking,
  });

  factory ShortExam.zero() => ShortExam(
        id: 0,
        title: '',
        examId: 0,
        teacherId: 0,
        teacherName: '',
        duration: 0,
        price: 0,
        rating: 0,
        enrollmentCount: 0,
        star1Count: 0,
        star2Count: 0,
        star3Count: 0,
        star4Count: 0,
        star5Count: 0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        startAt: null,
        isEnrolled: false,
        exam: null,
        questions: [],
        answers: {},
      );

  ShortExam copyWith({
    int? id,
    int? examId,
    String? title,
    String? thumbnail,
    int? teacherId,
    String? teacherName,
    double? price,
    double? duration,
    double? rating,
    int? enrollmentCount,
    int? star1Count,
    int? star2Count,
    int? star3Count,
    int? star4Count,
    int? star5Count,
    bool? isEnrolled,
    DateTime? startAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    Exam? exam,
    List<Question>? questions,
    Map<int, int>? answers,
    double? negativeMarking,
  }) {
    return ShortExam(
      id: id ?? this.id,
      examId: examId ?? this.examId,
      title: title ?? this.title,
      teacherId: teacherId ?? this.teacherId,
      teacherName: teacherName ?? this.teacherName,
      thumbnail: thumbnail ?? this.thumbnail,
      price: price ?? this.price,
      duration: duration ?? this.duration,
      rating: rating ?? this.rating,
      enrollmentCount: enrollmentCount ?? this.enrollmentCount,
      star1Count: star1Count ?? this.star1Count,
      star2Count: star2Count ?? this.star2Count,
      star3Count: star3Count ?? this.star3Count,
      star4Count: star4Count ?? this.star4Count,
      star5Count: star5Count ?? this.star5Count,
      isEnrolled: isEnrolled ?? this.isEnrolled,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      exam: exam ?? this.exam,
      startAt: startAt ?? this.startAt,
      questions: questions ?? this.questions,
      answers: answers ?? this.answers,
      negativeMarking: negativeMarking ?? this.negativeMarking,
    );
  }

  factory ShortExam.fromDTO(ShortExamDTO model) {
    var examDTO = model.exam;
    Exam? exam;
    if (examDTO != null) {
      exam = Exam.fromDTO(examDTO);
    }
    return ShortExam(
      id: model.id,
      title: model.title,
      duration: model.duration,
      price: model.price,
      rating: model.rating,
      teacherId: model.teacherId,
      teacherName: model.teacherName,
      enrollmentCount: model.enrollmentCount,
      star1Count: model.star1Count ?? 0,
      star2Count: model.star2Count ?? 0,
      star3Count: model.star3Count ?? 0,
      star4Count: model.star4Count ?? 0,
      star5Count: model.star5Count ?? 0,
      isEnrolled: model.isEnrolled ?? false,
      thumbnail: model.thumbnail,
      examId: model.examId,
      startAt: model.startAt,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      exam: exam,
      questions: model.questions?.map((q) => Question.fromModel(q)).toList(),
      answers: model.answers,
      negativeMarking: model.negativeMarking,
    );
  }

  factory ShortExam.fromItem(ShortExamItem item) => ShortExam(
        id: item.id,
        title: item.title,
        examId: item.examId,
        duration: item.duration,
        price: item.price,
        rating: item.rating,
        enrollmentCount: item.enrollmentCount,
        star1Count: item.star1Count,
        star2Count: item.star2Count,
        star3Count: item.star3Count,
        star4Count: item.star4Count,
        star5Count: item.star5Count,
        thumbnail: item.thumbnail,
        createdAt: item.createdAt ?? DateTime.now(),
        updatedAt: item.updatedAt ?? DateTime.now(),
        isEnrolled: item.enrolled,
        teacherId: item.teacherId ?? 0,
        teacherName: item.teacherName,
        exam: null, // Will be loaded separately if needed
        startAt: item.startAt,
        questions: null, // Will be loaded separately if needed
        answers: null, // Will be loaded separately if needed
      );

  ShortExamDTO toDTO() {
    return ShortExamDTO(
      id: id,
      title: title,
      duration: duration,
      price: price,
      rating: rating,
      enrollmentCount: enrollmentCount,
      star1Count: star1Count,
      star2Count: star2Count,
      star3Count: star3Count,
      star4Count: star4Count,
      star5Count: star5Count,
      thumbnail: thumbnail,
      examId: examId,
      isEnrolled: isEnrolled,
      startAt: startAt,
      createdAt: createdAt,
      updatedAt: updatedAt,
      teacherId: teacherId,
      teacherName: teacherName,
      exam: exam?.toDTO(),
      questions: questions?.map((q) => q.toModel()).toList(),
      answers: answers,
      negativeMarking: negativeMarking,
    );
  }

  ShortExamItemsCompanion toCompanion(int teacherId) {
    return ShortExamItemsCompanion(
      id: Value(id),
      title: Value(title),
      duration: Value(duration),
      teacherId: Value(teacherId == 0 ? this.teacherId : teacherId),
      price: Value(price),
      rating: Value(rating),
      enrollmentCount: Value(enrollmentCount),
      star1Count: Value(star1Count),
      star2Count: Value(star2Count),
      star3Count: Value(star3Count),
      star4Count: Value(star4Count),
      star5Count: Value(star5Count),
      thumbnail: Value(thumbnail),
      teacherName: Value(teacherName),
      examId: Value(examId),
      startAt: Value(startAt),
      enrolled: Value(isEnrolled),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      negativeMarking: Value(negativeMarking ?? 0.25),
    );
  }

  @override
  String toString() {
    return toDTO().toJson().toString();
  }

  ShortExam shuffleOptions() {
    var newQuestions = questions?.map((question) {
      var options = question.options.toList();
      options.shuffle();
      return question.copyWith(options: options);
    }).toList();
    return copyWith(questions: newQuestions);
  }
}
