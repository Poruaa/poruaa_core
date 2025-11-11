import 'package:json_annotation/json_annotation.dart';
import 'package:decimal/decimal.dart';

part 'campaign_exam_result_with_student_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CampaignExamResultWithStudentDto {
  final int resultId;
  final int studentId;
  final int campaignId;
  final String name;
  final int? rank;
  final Decimal? score;

  const CampaignExamResultWithStudentDto({
    required this.resultId,
    required this.studentId,
    required this.campaignId,
    required this.name,
    this.rank,
    this.score,
  });

  factory CampaignExamResultWithStudentDto.fromJson(
    Map<String, dynamic> json,
  ) => _$CampaignExamResultWithStudentDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CampaignExamResultWithStudentDtoToJson(this);

  CampaignExamResultWithStudentDto copyWith({
    int? resultId,
    int? studentId,
    int? campaignId,
    String? name,
    int? rank,
    Decimal? score,
  }) {
    return CampaignExamResultWithStudentDto(
      resultId: resultId ?? this.resultId,
      studentId: studentId ?? this.studentId,
      campaignId: campaignId ?? this.campaignId,
      name: name ?? this.name,
      rank: rank ?? this.rank,
      score: score ?? this.score,
    );
  }
}
