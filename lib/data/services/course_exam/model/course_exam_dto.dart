import 'package:poruaa_core/data/services/question/model/question_model.dart';

class CourseExamModel {
  final int id;
  final int examId;
  final int courseId;
  final String title;
  final String examName;
  final String courseName;
  final num price;
  final num regularPrice;
  final DateTime startAt;
  final DateTime endAt;
  final int teacherId;
  final bool free;
  final List<QuestionModel> questions;
  final Map<int, int> selectedOptions;
  final double? negativeMarking;
  CourseExamModel({
    required this.id,
    required this.examId,
    required this.courseId,
    required this.title,
    required this.examName,
    required this.courseName,
    required this.price,
    required this.regularPrice,
    required this.startAt,
    required this.endAt,
    required this.free,
    required this.teacherId,
    this.questions = const [],
    this.selectedOptions = const {},
    this.negativeMarking,
  });

  factory CourseExamModel.zero() {
    return CourseExamModel(
      id: 0,
      examId: 0,
      courseId: 0,
      title: '',
      examName: '',
      courseName: '',
      price: 0,
      regularPrice: 0,
      startAt: DateTime.fromMillisecondsSinceEpoch(0),
      endAt: DateTime.fromMillisecondsSinceEpoch(0),
      free: false,
      teacherId: 0,
    );
  }

  CourseExamModel copyWith({
    int? id,
    int? examId,
    int? courseId,
    String? title,
    String? examName,
    String? courseName,
    num? price,
    num? regularPrice,
    DateTime? startAt,
    DateTime? endAt,
    bool? free,
    int? teacherId,
    List<QuestionModel>? questions,
    Map<int, int>? selectedOptions,
    double? negativeMarking,
  }) {
    return CourseExamModel(
      id: id ?? this.id,
      examId: examId ?? this.examId,
      courseId: courseId ?? this.courseId,
      title: title ?? this.title,
      examName: examName ?? this.examName,
      courseName: courseName ?? this.courseName,
      price: price ?? this.price,
      regularPrice: regularPrice ?? this.regularPrice,
      startAt: startAt ?? this.startAt,
      endAt: endAt ?? this.endAt,
      free: free ?? this.free,
      teacherId: teacherId ?? this.teacherId,
      questions: questions ?? this.questions,
      selectedOptions: selectedOptions ?? this.selectedOptions,
      negativeMarking: negativeMarking ?? this.negativeMarking,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "exam_id": examId,
      "course_id": courseId,
      "title": title,
      "exam_name": examName,
      "course_name": courseName,
      "price": price,
      "regular_price": regularPrice,
      "start_at": startAt.toUtc().toIso8601String(),
      "end_at": endAt.toUtc().toIso8601String(),
      "free": free,
      "teacher_id": teacherId,
      "questions": questions.map((q) => q.toJson()).toList(),
      "selected_options": selectedOptions.map(
        ((key, value) => MapEntry(key.toString(), value)),
      ),
      "negative_marking": negativeMarking,
    };
  }

  static CourseExamModel fromJson(Map<String, dynamic> json) {
    var questionsJson = json["questions"] as List<dynamic>? ?? [];
    var questions = questionsJson
        .map((q) => QuestionModel.fromJson(q))
        .toList();

    var results = json["results"];
    Map<int, int> answers;
    if (results is Map) {
      answers = results.map((key, value) => MapEntry(int.parse(key), value));
    } else {
      answers = {};
    }
    return CourseExamModel(
      id: json["id"],
      examId: json["exam_id"],
      courseId: json["course_id"],
      title: json["title"] ?? "",
      examName: json["exam_name"],
      courseName: json["course_name"],
      price: json["price"],
      regularPrice: json["regular_price"],
      startAt: DateTime.parse(json["start_at"]).toLocal(),
      endAt: DateTime.parse(json["end_at"]).toLocal(),
      free: json["free"] ?? false,
      teacherId: json["teacher_id"] ?? 0,
      questions: questions,
      selectedOptions: answers,
      negativeMarking: json["negative_marking"]?.toDouble(),
    );
  }
}
