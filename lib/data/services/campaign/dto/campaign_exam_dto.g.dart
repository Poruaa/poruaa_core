// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_exam_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampaignExamDto _$CampaignExamDtoFromJson(Map<String, dynamic> json) =>
    CampaignExamDto(
      id: (json['id'] as num).toInt(),
      campaignId: (json['campaign_id'] as num).toInt(),
      title: json['title'] as String,
      examStartDate: const DateTimeUtcConverter().fromJson(
        json['exam_start_date'] as String,
      ),
      examEndDate: const DateTimeUtcConverter().fromJson(
        json['exam_end_date'] as String,
      ),
      negativeMarking: Decimal.fromJson(json['negative_marking'] as String),
      questions: json['questions'] == null
          ? const []
          : CampaignExamDto._questionsFromJson(json['questions'] as List),
      results: json['results'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$CampaignExamDtoToJson(
  CampaignExamDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'campaign_id': instance.campaignId,
  'title': instance.title,
  'exam_start_date': const DateTimeUtcConverter().toJson(
    instance.examStartDate,
  ),
  'exam_end_date': const DateTimeUtcConverter().toJson(instance.examEndDate),
  'negative_marking': instance.negativeMarking,
  'questions': CampaignExamDto._questionsToJson(instance.questions),
  'results': instance.results,
};
