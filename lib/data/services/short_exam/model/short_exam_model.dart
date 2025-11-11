import 'package:poruaa_core/data/services/exam/model/exam_model.dart';
import 'package:poruaa_core/data/services/question/model/question_model.dart';

class ShortExamDTO {
  final int id;
  final int examId;
  final String title;
  final String? thumbnail;
  final double price;
  final double duration;
  final double rating;
  final int teacherId;
  final String? teacherName;
  final int enrollmentCount;
  final int? star1Count;
  final int? star2Count;
  final int? star3Count;
  final int? star4Count;
  final int? star5Count;
  final bool? isEnrolled;
  final DateTime? startAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final ExamDTO? exam;
  final List<QuestionModel>? questions;
  final Map<int, int>? answers;
  final double? negativeMarking;

  ShortExamDTO({
    required this.id,
    required this.title,
    required this.examId,
    required this.duration,
    required this.price,
    required this.rating,
    required this.enrollmentCount,
    required this.teacherId,
    this.teacherName,
    this.star1Count,
    this.star2Count,
    this.star3Count,
    this.star4Count,
    this.star5Count,
    required this.isEnrolled,
    this.thumbnail,
    required this.startAt,
    required this.createdAt,
    required this.updatedAt,
    required this.exam,
    required this.questions,
    required this.answers,
    this.negativeMarking,
  });

  factory ShortExamDTO.fromJson(Map<String, dynamic> json) {
    var exam = json['exam'];
    ExamDTO? examDTO;
    if (exam != null) {
      examDTO = ExamDTO.fromJson(exam);
    }
    var startAtRecord = json['start_at'];
    DateTime? startAt;
    if (startAtRecord != null) {
      startAt = DateTime.parse(startAtRecord).toLocal();
    }
    var questionsJson = json["questions"] as List<dynamic>? ?? [];
    var questions = questionsJson
        .map((q) => QuestionModel.fromJson(q))
        .toList();

    var results = json["answers"];
    Map<int, int> answers;
    if (results is Map) {
      answers = results.map((key, value) => MapEntry(int.parse(key), value));
    } else {
      answers = {};
    }
    return ShortExamDTO(
      id: json['id'],
      title: json['title'],
      examId: json['exam_id'],
      duration: json['duration'],
      price: json['price'],
      rating: json['rating'],
      teacherId: json['teacher_id'],
      teacherName: json['teacher_name'],
      enrollmentCount: json['enrollment_count'],
      star1Count: json['star_1_count'],
      star2Count: json['star_2_count'],
      star3Count: json['star_3_count'],
      star4Count: json['star_4_count'],
      star5Count: json['star_5_count'],
      thumbnail: json['thumbnail'],
      isEnrolled: json['is_enrolled'],
      startAt: startAt,
      createdAt: DateTime.parse(json['created_at']).toLocal(),
      updatedAt: DateTime.parse(json['updated_at']).toLocal(),
      exam: examDTO,
      questions: questions,
      answers: answers,
      negativeMarking: json['negative_marking']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'exam_id': examId,
      'duration': duration,
      'price': price,
      'rating': rating,
      'is_enrolled': isEnrolled,
      'enrollment_count': enrollmentCount,
      'thumbnail': thumbnail,
      'teacher_id': teacherId,
      'teacher_name': teacherName,
      'exam': exam?.toJson(),
      'start_at': startAt?.toUtc().toIso8601String(),
      'created_at': createdAt.toUtc().toIso8601String(),
      'updated_at': updatedAt.toUtc().toIso8601String(),
      'questions': questions?.map((q) => q.toJson()).toList(),
      'answers': answers,
      'negative_marking': negativeMarking,
    };
  }
}
