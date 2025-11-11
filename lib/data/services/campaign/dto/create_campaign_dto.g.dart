// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_campaign_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCampaignDto _$CreateCampaignDtoFromJson(Map<String, dynamic> json) =>
    CreateCampaignDto(
      title: json['title'] as String,
      description: json['description'] as String?,
      thumbnail: json['thumbnail'] as String?,
      promotionalContent: json['promotional_content'] as Map<String, dynamic>?,
      formFields: (json['form_fields'] as List<dynamic>?)
          ?.map((e) => CampaignFormField.fromJson(e as Map<String, dynamic>))
          .toList(),
      examId: (json['exam_id'] as num?)?.toInt(),
      negativeMarking: Decimal.fromJson(json['negative_marking'] as String),
      startDate: const DateTimeUtcConverter().fromJson(
        json['start_date'] as String,
      ),
      endDate: const DateTimeUtcConverter().fromJson(
        json['end_date'] as String,
      ),
      examStartDate: const DateTimeUtcConverter().fromJson(
        json['exam_start_date'] as String,
      ),
      examEndDate: const DateTimeUtcConverter().fromJson(
        json['exam_end_date'] as String,
      ),
      maxParticipants: (json['max_participants'] as num?)?.toInt(),
      rewardType: json['reward_type'] as String,
      rewardValue: Decimal.fromJson(json['reward_value'] as String),
      rewardDescription: json['reward_description'] as String?,
      maxRank: (json['max_rank'] as num).toInt(),
    );

Map<String, dynamic> _$CreateCampaignDtoToJson(
  CreateCampaignDto instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'thumbnail': instance.thumbnail,
  'promotional_content': instance.promotionalContent,
  'form_fields': instance.formFields,
  'exam_id': instance.examId,
  'negative_marking': instance.negativeMarking,
  'start_date': const DateTimeUtcConverter().toJson(instance.startDate),
  'end_date': const DateTimeUtcConverter().toJson(instance.endDate),
  'exam_start_date': const DateTimeUtcConverter().toJson(
    instance.examStartDate,
  ),
  'exam_end_date': const DateTimeUtcConverter().toJson(instance.examEndDate),
  'max_participants': instance.maxParticipants,
  'reward_type': instance.rewardType,
  'reward_value': instance.rewardValue,
  'reward_description': instance.rewardDescription,
  'max_rank': instance.maxRank,
};
