import 'package:poruaa_core/data/services/question/model/question_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:decimal/decimal.dart';

part 'campaign_exam_result_dto.g.dart';

enum CampaignExamResultType {
  absent,
  present;

  @override
  String toString() {
    return switch (this) {
      CampaignExamResultType.absent => "Absent",
      CampaignExamResultType.present => "Present",
    };
  }

  static CampaignExamResultType? fromString(String value) {
    return switch (value) {
      "Absent" => CampaignExamResultType.absent,
      "Present" => CampaignExamResultType.present,
      _ => null,
    };
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CampaignExamResultDto {
  final int? id;
  final int campaignId;
  final int studentId;
  final Map<String, dynamic> result;
  final String resultType;
  final Decimal? score;
  final int? rank;
  final Decimal negativeMarking;
  final int? timeTaken;
  @JsonKey(fromJson: _questionsFromJson, toJson: _questionsToJson)
  final List<QuestionModel> questions;

  const CampaignExamResultDto({
    required this.id,
    required this.campaignId,
    required this.studentId,
    required this.result,
    required this.resultType,
    required this.score,
    this.rank,
    required this.negativeMarking,
    this.timeTaken,
    this.questions = const [],
  });

  factory CampaignExamResultDto.fromJson(Map<String, dynamic> json) =>
      _$CampaignExamResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CampaignExamResultDtoToJson(this);

  CampaignExamResultDto copyWith({
    int? id,
    int? campaignId,
    int? studentId,
    Map<String, dynamic>? result,
    String? resultType,
    Decimal? score,
    int? rank,
    Decimal? negativeMarking,
    int? timeTaken,
    List<QuestionModel>? questions,
  }) {
    return CampaignExamResultDto(
      id: id ?? this.id,
      campaignId: campaignId ?? this.campaignId,
      studentId: studentId ?? this.studentId,
      result: result ?? this.result,
      resultType: resultType ?? this.resultType,
      score: score ?? this.score,
      rank: rank ?? this.rank,
      negativeMarking: negativeMarking ?? this.negativeMarking,
      timeTaken: timeTaken ?? this.timeTaken,
      questions: questions ?? this.questions,
    );
  }

  // Convert result map to Map<int, int> for answers
  Map<int, int> get answers {
    return result.map((key, value) => MapEntry(int.parse(key), value as int));
  }

  // Get result type enum
  CampaignExamResultType get resultTypeEnum {
    return CampaignExamResultType.fromString(resultType) ??
        CampaignExamResultType.absent;
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
