import 'package:poruaa_core/data/services/campaign/dto/campaign_form_field.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:decimal/decimal.dart';

part 'update_campaign_dto.g.dart';

class DateTimeUtcConverter implements JsonConverter<DateTime, String> {
  const DateTimeUtcConverter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json).toLocal();

  @override
  String toJson(DateTime object) => object.toUtc().toIso8601String();
}

@JsonSerializable(fieldRename: FieldRename.snake)
class UpdateCampaignDto {
  final String title;
  final String? description;
  final String? thumbnail;
  final Map<String, dynamic>? promotionalContent;
  final List<CampaignFormField>? formFields;
  final int? examId;
  final Decimal negativeMarking;
  @DateTimeUtcConverter()
  final DateTime startDate;
  @DateTimeUtcConverter()
  final DateTime endDate;
  @DateTimeUtcConverter()
  final DateTime examStartDate;
  @DateTimeUtcConverter()
  final DateTime examEndDate;
  final int? maxParticipants;
  final String rewardType;
  final Decimal rewardValue;
  final String? rewardDescription;
  final int maxRank;
  final bool rewardsDistributed;
  @DateTimeUtcConverter()
  final DateTime? rewardsDistributedAt;

  const UpdateCampaignDto({
    required this.title,
    this.description,
    this.thumbnail,
    required this.promotionalContent,
    required this.formFields,
    this.examId,
    required this.negativeMarking,
    required this.startDate,
    required this.endDate,
    required this.examStartDate,
    required this.examEndDate,
    this.maxParticipants,
    required this.rewardType,
    required this.rewardValue,
    this.rewardDescription,
    required this.maxRank,
    required this.rewardsDistributed,
    this.rewardsDistributedAt,
  });

  factory UpdateCampaignDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateCampaignDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCampaignDtoToJson(this);

  UpdateCampaignDto copyWith({
    String? title,
    String? description,
    String? thumbnail,
    Map<String, dynamic>? promotionalContent,
    List<CampaignFormField>? formFields,
    int? examId,
    Decimal? negativeMarking,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? examStartDate,
    DateTime? examEndDate,
    int? maxParticipants,
    String? rewardType,
    Decimal? rewardValue,
    String? rewardDescription,
    int? maxRank,
    bool? rewardsDistributed,
    DateTime? rewardsDistributedAt,
  }) {
    return UpdateCampaignDto(
      title: title ?? this.title,
      description: description ?? this.description,
      thumbnail: thumbnail ?? this.thumbnail,
      promotionalContent: promotionalContent ?? this.promotionalContent,
      formFields: formFields ?? this.formFields,
      examId: examId ?? this.examId,
      negativeMarking: negativeMarking ?? this.negativeMarking,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      examStartDate: examStartDate ?? this.examStartDate,
      examEndDate: examEndDate ?? this.examEndDate,
      maxParticipants: maxParticipants ?? this.maxParticipants,
      rewardType: rewardType ?? this.rewardType,
      rewardValue: rewardValue ?? this.rewardValue,
      rewardDescription: rewardDescription ?? this.rewardDescription,
      maxRank: maxRank ?? this.maxRank,
      rewardsDistributed: rewardsDistributed ?? this.rewardsDistributed,
      rewardsDistributedAt: rewardsDistributedAt ?? this.rewardsDistributedAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UpdateCampaignDto &&
        other.title == title &&
        other.description == description &&
        other.thumbnail == thumbnail &&
        _mapEquals(other.promotionalContent, promotionalContent) &&
        other.formFields == formFields &&
        other.examId == examId &&
        other.negativeMarking == negativeMarking &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.examStartDate == examStartDate &&
        other.examEndDate == examEndDate &&
        other.maxParticipants == maxParticipants &&
        other.rewardType == rewardType &&
        other.rewardValue == rewardValue &&
        other.rewardDescription == rewardDescription &&
        other.maxRank == maxRank &&
        other.rewardsDistributed == rewardsDistributed &&
        other.rewardsDistributedAt == rewardsDistributedAt;
  }

  @override
  int get hashCode {
    return Object.hashAll([
      title,
      description,
      thumbnail,
      promotionalContent,
      formFields,
      examId,
      negativeMarking,
      startDate,
      endDate,
      examStartDate,
      examEndDate,
      maxParticipants,
      rewardType,
      rewardValue,
      rewardDescription,
      maxRank,
      rewardsDistributed,
      rewardsDistributedAt,
    ]);
  }

  @override
  String toString() {
    return 'UpdateCampaignDto(title: $title, description: $description, thumbnail: $thumbnail, promotionalContent: $promotionalContent, formFields: $formFields, examId: $examId, negativeMarking: $negativeMarking, startDate: $startDate, endDate: $endDate, examStartDate: $examStartDate, examEndDate: $examEndDate, maxParticipants: $maxParticipants, rewardType: $rewardType, rewardValue: $rewardValue, rewardDescription: $rewardDescription, maxRank: $maxRank, rewardsDistributed: $rewardsDistributed, rewardsDistributedAt: $rewardsDistributedAt)';
  }

  bool _mapEquals(Map<String, dynamic>? a, Map<String, dynamic>? b) {
    if (a == null) return b == null;
    if (b == null || a.length != b.length) return false;
    for (final key in a.keys) {
      if (!b.containsKey(key) || a[key] != b[key]) return false;
    }
    return true;
  }
}
