// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampaignDto _$CampaignDtoFromJson(Map<String, dynamic> json) => CampaignDto(
  id: (json['id'] as num).toInt(),
  teacherId: (json['teacher_id'] as num).toInt(),
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
  endDate: const DateTimeUtcConverter().fromJson(json['end_date'] as String),
  examStartDate: const DateTimeUtcConverter().fromJson(
    json['exam_start_date'] as String,
  ),
  examEndDate: const DateTimeUtcConverter().fromJson(
    json['exam_end_date'] as String,
  ),
  maxParticipants: (json['max_participants'] as num?)?.toInt(),
  currentParticipants: (json['current_participants'] as num).toInt(),
  status: json['status'] as String,
  rewardType: json['reward_type'] as String,
  rewardValue: Decimal.fromJson(json['reward_value'] as String),
  rewardDescription: json['reward_description'] as String?,
  maxRank: (json['max_rank'] as num).toInt(),
  rewardsDistributed: json['rewards_distributed'] as bool,
  rewardsDistributedAt: _$JsonConverterFromJson<String, DateTime>(
    json['rewards_distributed_at'],
    const DateTimeUtcConverter().fromJson,
  ),
  createdAt: const DateTimeUtcConverter().fromJson(
    json['created_at'] as String,
  ),
  updatedAt: const DateTimeUtcConverter().fromJson(
    json['updated_at'] as String,
  ),
  participant: json['participant'] == null
      ? null
      : CampaignParticipantDto.fromJson(
          json['participant'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$CampaignDtoToJson(
  CampaignDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'teacher_id': instance.teacherId,
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
  'current_participants': instance.currentParticipants,
  'status': instance.status,
  'reward_type': instance.rewardType,
  'reward_value': instance.rewardValue,
  'reward_description': instance.rewardDescription,
  'max_rank': instance.maxRank,
  'rewards_distributed': instance.rewardsDistributed,
  'rewards_distributed_at': _$JsonConverterToJson<String, DateTime>(
    instance.rewardsDistributedAt,
    const DateTimeUtcConverter().toJson,
  ),
  'created_at': const DateTimeUtcConverter().toJson(instance.createdAt),
  'updated_at': const DateTimeUtcConverter().toJson(instance.updatedAt),
  'participant': instance.participant,
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);

CampaignPageDto _$CampaignPageDtoFromJson(Map<String, dynamic> json) =>
    CampaignPageDto(
      items: (json['items'] as List<dynamic>)
          .map((e) => CampaignDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasMore: json['has_more'] as bool,
      nextCursor: json['next_cursor'] as String?,
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$CampaignPageDtoToJson(CampaignPageDto instance) =>
    <String, dynamic>{
      'items': instance.items,
      'has_more': instance.hasMore,
      'next_cursor': instance.nextCursor,
      'total': instance.total,
    };
