import 'package:poruaa_core/data/services/campaign/dto/create_campaign_dto.dart';
import 'package:poruaa_core/data/services/question/model/question_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:decimal/decimal.dart';

part 'campaign_exam_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CampaignExamDto {
  final int id;
  final int campaignId;
  final String title;
  @DateTimeUtcConverter()
  final DateTime examStartDate;
  @DateTimeUtcConverter()
  final DateTime examEndDate;
  final Decimal negativeMarking;
  @JsonKey(fromJson: _questionsFromJson, toJson: _questionsToJson)
  final List<QuestionModel> questions;
  final Map<String, dynamic> results;

  const CampaignExamDto({
    required this.id,
    required this.campaignId,
    required this.title,
    required this.examStartDate,
    required this.examEndDate,
    required this.negativeMarking,
    this.questions = const [],
    this.results = const {},
  });

  factory CampaignExamDto.fromJson(Map<String, dynamic> json) =>
      _$CampaignExamDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CampaignExamDtoToJson(this);

  CampaignExamDto copyWith({
    int? id,
    int? campaignId,
    String? title,
    DateTime? examStartDate,
    DateTime? examEndDate,
    Decimal? negativeMarking,
    List<QuestionModel>? questions,
    Map<String, dynamic>? results,
  }) {
    return CampaignExamDto(
      id: id ?? this.id,
      campaignId: campaignId ?? this.campaignId,
      title: title ?? this.title,
      examStartDate: examStartDate ?? this.examStartDate,
      examEndDate: examEndDate ?? this.examEndDate,
      negativeMarking: negativeMarking ?? this.negativeMarking,
      questions: questions ?? this.questions,
      results: results ?? this.results,
    );
  }

  // Convert results map to Map<int, int> for selected options
  Map<int, int> get selectedOptions {
    return results.map((key, value) => MapEntry(int.parse(key), value as int));
  }

  // Shuffle options like course exams
  CampaignExamDto shuffleOptions() {
    var newQuestions = questions.map((question) {
      var options = question.options.toList();
      options.shuffle();
      return QuestionModel(
        id: question.id,
        question: question.question,
        options: options,
        answer: question.answer,
        examId: question.examId,
        solve: question.solve,
        createdAt: question.createdAt,
      );
    }).toList();
    return copyWith(questions: newQuestions);
  }

  // Helper methods for JSON serialization
  static List<QuestionModel> _questionsFromJson(List<dynamic> json) {
    return json
        .map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  static List<Map<String, dynamic>> _questionsToJson(
    List<QuestionModel> questions,
  ) {
    return questions.map((q) => q.toJson()).toList();
  }
}
