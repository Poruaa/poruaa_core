// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_participant_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampaignParticipantDto _$CampaignParticipantDtoFromJson(
  Map<String, dynamic> json,
) => CampaignParticipantDto(
  id: (json['id'] as num).toInt(),
  campaignId: (json['campaign_id'] as num).toInt(),
  studentId: (json['student_id'] as num).toInt(),
  formData: json['form_data'] as Map<String, dynamic>?,
  participationDate: const DateTimeUtcConverter().fromJson(
    json['participation_date'] as String,
  ),
  examCompleted: json['exam_completed'] as bool?,
  examScore: json['exam_score'] == null
      ? null
      : Decimal.fromJson(json['exam_score'] as String),
  examRank: (json['exam_rank'] as num?)?.toInt(),
  rewardAmount: json['reward_amount'] == null
      ? null
      : Decimal.fromJson(json['reward_amount'] as String),
  rewardClaimed: json['reward_claimed'] as bool?,
  rewardClaimedAt: _$JsonConverterFromJson<String, DateTime>(
    json['reward_claimed_at'],
    const DateTimeUtcConverter().fromJson,
  ),
  createdAt: const DateTimeUtcConverter().fromJson(
    json['created_at'] as String,
  ),
  updatedAt: const DateTimeUtcConverter().fromJson(
    json['updated_at'] as String,
  ),
);

Map<String, dynamic> _$CampaignParticipantDtoToJson(
  CampaignParticipantDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'campaign_id': instance.campaignId,
  'student_id': instance.studentId,
  'form_data': instance.formData,
  'participation_date': const DateTimeUtcConverter().toJson(
    instance.participationDate,
  ),
  'exam_completed': instance.examCompleted,
  'exam_score': instance.examScore,
  'exam_rank': instance.examRank,
  'reward_amount': instance.rewardAmount,
  'reward_claimed': instance.rewardClaimed,
  'reward_claimed_at': _$JsonConverterToJson<String, DateTime>(
    instance.rewardClaimedAt,
    const DateTimeUtcConverter().toJson,
  ),
  'created_at': const DateTimeUtcConverter().toJson(instance.createdAt),
  'updated_at': const DateTimeUtcConverter().toJson(instance.updatedAt),
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
