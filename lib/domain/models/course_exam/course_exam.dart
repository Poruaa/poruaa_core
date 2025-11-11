import 'package:poruaa_core/data/services/course_exam/model/course_exam_dto.dart';
import 'package:poruaa_core/domain/models/question/question.dart';

class CourseExam {
  final int id;
  final int courseId;
  final int examId;
  final int teacherId;
  final String title;
  final String examName;
  final String courseName;
  final num price;
  final num regularPrice;
  final DateTime startAt;
  final DateTime endAt;
  final bool free;
  final List<Question> questions;
  final Map<int, int> selectedOptions;
  final double? negativeMarking;
  CourseExam({
    required this.id,
    required this.courseId,
    required this.examId,
    required this.teacherId,
    required this.title,
    required this.examName,
    required this.courseName,
    required this.price,
    required this.regularPrice,
    required this.startAt,
    required this.endAt,
    required this.free,
    this.selectedOptions = const {},
    this.questions = const [],
    this.negativeMarking,
  });

  factory CourseExam.zero() {
    return CourseExam(
      id: 0,
      courseId: 0,
      examId: 0,
      teacherId: 0,
      title: "",
      examName: "",
      courseName: "",
      price: 0,
      regularPrice: 0,
      startAt: DateTime.now(),
      endAt: DateTime.now(),
      free: false,
    );
  }

  CourseExam copyWith({
    int? id,
    int? courseId,
    int? examId,
    int? teacherId,
    String? title,
    String? examName,
    String? courseName,
    num? price,
    num? regularPrice,
    DateTime? startAt,
    DateTime? endAt,
    bool? free,
    List<Question>? questions,
    Map<int, int>? selectedOptions,
    double? negativeMarking,
  }) {
    return CourseExam(
      id: id ?? this.id,
      courseId: courseId ?? this.courseId,
      examId: examId ?? this.examId,
      teacherId: teacherId ?? this.teacherId,
      title: title ?? this.title,
      examName: examName ?? this.examName,
      courseName: courseName ?? this.courseName,
      price: price ?? this.price,
      regularPrice: regularPrice ?? this.regularPrice,
      startAt: startAt ?? this.startAt,
      endAt: endAt ?? this.endAt,
      free: free ?? this.free,
      questions: questions ?? this.questions,
      selectedOptions: selectedOptions ?? this.selectedOptions,
      negativeMarking: negativeMarking ?? this.negativeMarking,
    );
  }

  static CourseExam fromModel(CourseExamModel model) {
    return CourseExam(
      id: model.id,
      courseId: model.courseId,
      examId: model.examId,
      teacherId: model.teacherId,
      title: model.title,
      examName: model.examName,
      courseName: model.courseName,
      price: model.price,
      regularPrice: model.regularPrice,
      startAt: model.startAt,
      endAt: model.endAt,
      free: model.free,
      questions: model.questions.map((q) => Question.fromModel(q)).toList(),
      selectedOptions: model.selectedOptions,
      negativeMarking: model.negativeMarking,
    );
  }

  CourseExam shuffleOptions() {
    var newQuestions = questions.map((question) {
      var options = question.options.toList();
      options.shuffle();
      return question.copyWith(options: options);
    }).toList();
    return copyWith(questions: newQuestions);
  }
}
