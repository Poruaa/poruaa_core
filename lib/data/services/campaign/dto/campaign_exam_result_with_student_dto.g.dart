// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_exam_result_with_student_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampaignExamResultWithStudentDto _$CampaignExamResultWithStudentDtoFromJson(
  Map<String, dynamic> json,
) => CampaignExamResultWithStudentDto(
  resultId: (json['result_id'] as num).toInt(),
  studentId: (json['student_id'] as num).toInt(),
  campaignId: (json['campaign_id'] as num).toInt(),
  name: json['name'] as String,
  rank: (json['rank'] as num?)?.toInt(),
  score: json['score'] == null
      ? null
      : Decimal.fromJson(json['score'] as String),
);

Map<String, dynamic> _$CampaignExamResultWithStudentDtoToJson(
  CampaignExamResultWithStudentDto instance,
) => <String, dynamic>{
  'result_id': instance.resultId,
  'student_id': instance.studentId,
  'campaign_id': instance.campaignId,
  'name': instance.name,
  'rank': instance.rank,
  'score': instance.score,
};
