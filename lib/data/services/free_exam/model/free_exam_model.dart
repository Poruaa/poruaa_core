import 'package:poruaa_core/data/services/exam/model/exam_model.dart';
import 'package:poruaa_core/data/services/question/model/question_model.dart';

class FreeExamDTO {
  final int id;
  final int examId;
  final String title;
  final String? thumbnail;
  final double duration;
  final int teacherId;
  final String? teacherName;
  final String? teacherProfileUrl;
  final int enrollmentCount;
  final bool? isParticipated;
  final DateTime? startAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final ExamDTO? exam;
  final List<QuestionModel>? questions;
  final Map<int, int>? answers;
  final double? negativeMarking;
  final double? score;

  FreeExamDTO({
    required this.id,
    required this.title,
    required this.examId,
    required this.duration,
    required this.enrollmentCount,
    required this.teacherId,
    this.teacherName,
    this.teacherProfileUrl,
    required this.isParticipated,
    this.thumbnail,
    required this.startAt,
    required this.createdAt,
    required this.updatedAt,
    required this.exam,
    required this.questions,
    required this.answers,
    this.negativeMarking,
    this.score,
  });

  factory FreeExamDTO.fromJson(Map<String, dynamic> json) {
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
    return FreeExamDTO(
      id: json['id'],
      title: json['title'],
      examId: json['exam_id'],
      duration: json['duration'],
      teacherId: json['teacher_id'],
      teacherName: json['teacher_name'],
      teacherProfileUrl: json['teacher_profile_url'],
      enrollmentCount: json['enrollment_count'],
      thumbnail: json['thumbnail'],
      isParticipated: json['is_participated'],
      startAt: startAt,
      createdAt: DateTime.parse(json['created_at']).toLocal(),
      updatedAt: DateTime.parse(json['updated_at']).toLocal(),
      exam: examDTO,
      questions: questions,
      answers: answers,
      negativeMarking: json['negative_marking']?.toDouble(),
      score: json['score']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'exam_id': examId,
      'duration': duration,
      'is_participated': isParticipated,
      'enrollment_count': enrollmentCount,
      'thumbnail': thumbnail,
      'teacher_id': teacherId,
      'teacher_name': teacherName,
      'teacher_profile_url': teacherProfileUrl,
      'exam': exam?.toJson(),
      'start_at': startAt?.toUtc().toIso8601String(),
      'created_at': createdAt.toUtc().toIso8601String(),
      'updated_at': updatedAt.toUtc().toIso8601String(),
      'questions': questions?.map((q) => q.toJson()).toList(),
      'answers': answers,
      'negative_marking': negativeMarking,
      'score': score,
    };
  }
}
