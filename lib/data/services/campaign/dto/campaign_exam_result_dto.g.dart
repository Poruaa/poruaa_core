// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_exam_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampaignExamResultDto _$CampaignExamResultDtoFromJson(
  Map<String, dynamic> json,
) => CampaignExamResultDto(
  id: (json['id'] as num?)?.toInt(),
  campaignId: (json['campaign_id'] as num).toInt(),
  studentId: (json['student_id'] as num).toInt(),
  result: json['result'] as Map<String, dynamic>,
  resultType: json['result_type'] as String,
  score: json['score'] == null
      ? null
      : Decimal.fromJson(json['score'] as String),
  rank: (json['rank'] as num?)?.toInt(),
  negativeMarking: Decimal.fromJson(json['negative_marking'] as String),
  timeTaken: (json['time_taken'] as num?)?.toInt(),
  questions: json['questions'] == null
      ? const []
      : CampaignExamResultDto._questionsFromJson(json['questions'] as List),
);

Map<String, dynamic> _$CampaignExamResultDtoToJson(
  CampaignExamResultDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'campaign_id': instance.campaignId,
  'student_id': instance.studentId,
  'result': instance.result,
  'result_type': instance.resultType,
  'score': instance.score,
  'rank': instance.rank,
  'negative_marking': instance.negativeMarking,
  'time_taken': instance.timeTaken,
  'questions': CampaignExamResultDto._questionsToJson(instance.questions),
};
