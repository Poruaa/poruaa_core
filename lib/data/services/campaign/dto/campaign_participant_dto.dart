import 'package:json_annotation/json_annotation.dart';
import 'package:decimal/decimal.dart';

part 'campaign_participant_dto.g.dart';

class DateTimeUtcConverter implements JsonConverter<DateTime, String> {
  const DateTimeUtcConverter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json).toLocal();

  @override
  String toJson(DateTime object) => object.toUtc().toIso8601String();
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CampaignParticipantDto {
  final int id;
  final int campaignId;
  final int studentId;
  final Map<String, dynamic>? formData;
  @DateTimeUtcConverter()
  final DateTime participationDate;
  final bool? examCompleted;
  final Decimal? examScore;
  final int? examRank;
  final Decimal? rewardAmount;
  final bool? rewardClaimed;
  @DateTimeUtcConverter()
  final DateTime? rewardClaimedAt;
  @DateTimeUtcConverter()
  final DateTime createdAt;
  @DateTimeUtcConverter()
  final DateTime updatedAt;

  const CampaignParticipantDto({
    required this.id,
    required this.campaignId,
    required this.studentId,
    this.formData,
    required this.participationDate,
    this.examCompleted,
    this.examScore,
    this.examRank,
    this.rewardAmount,
    this.rewardClaimed,
    this.rewardClaimedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CampaignParticipantDto.fromJson(Map<String, dynamic> json) =>
      _$CampaignParticipantDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CampaignParticipantDtoToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CampaignParticipantDto &&
        other.id == id &&
        other.campaignId == campaignId &&
        other.studentId == studentId &&
        other.formData == formData &&
        other.participationDate == participationDate &&
        other.examCompleted == examCompleted &&
        other.examScore == examScore &&
        other.examRank == examRank &&
        other.rewardAmount == rewardAmount &&
        other.rewardClaimed == rewardClaimed &&
        other.rewardClaimedAt == rewardClaimedAt &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return Object.hashAll([
      id,
      campaignId,
      studentId,
      formData,
      participationDate,
      examCompleted,
      examScore,
      examRank,
      rewardAmount,
      rewardClaimed,
      rewardClaimedAt,
      createdAt,
      updatedAt,
    ]);
  }

  @override
  String toString() {
    return 'CampaignParticipantDto(id: $id, campaignId: $campaignId, studentId: $studentId, formData: $formData, participationDate: $participationDate, examCompleted: $examCompleted, examScore: $examScore, examRank: $examRank, rewardAmount: $rewardAmount, rewardClaimed: $rewardClaimed, rewardClaimedAt: $rewardClaimedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
