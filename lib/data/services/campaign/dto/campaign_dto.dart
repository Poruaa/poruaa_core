import 'package:poruaa_core/data/services/campaign/dto/campaign_form_field.dart';
import 'package:poruaa_core/data/services/campaign/dto/campaign_participant_dto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:decimal/decimal.dart';

part 'campaign_dto.g.dart';

class DateTimeUtcConverter implements JsonConverter<DateTime, String> {
  const DateTimeUtcConverter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json).toLocal();

  @override
  String toJson(DateTime object) => object.toUtc().toIso8601String();
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CampaignDto {
  final int id;
  final int teacherId;
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
  final int currentParticipants;
  final String status;
  final String rewardType;
  final Decimal rewardValue;
  final String? rewardDescription;
  final int maxRank;
  final bool rewardsDistributed;
  @DateTimeUtcConverter()
  final DateTime? rewardsDistributedAt;
  @DateTimeUtcConverter()
  final DateTime createdAt;
  @DateTimeUtcConverter()
  final DateTime updatedAt;
  final CampaignParticipantDto? participant;

  const CampaignDto({
    required this.id,
    required this.teacherId,
    required this.title,
    this.description,
    this.thumbnail,
    this.promotionalContent,
    this.formFields,
    this.examId,
    required this.negativeMarking,
    required this.startDate,
    required this.endDate,
    required this.examStartDate,
    required this.examEndDate,
    this.maxParticipants,
    required this.currentParticipants,
    required this.status,
    required this.rewardType,
    required this.rewardValue,
    this.rewardDescription,
    required this.maxRank,
    required this.rewardsDistributed,
    this.rewardsDistributedAt,
    required this.createdAt,
    required this.updatedAt,
    this.participant,
  });

  factory CampaignDto.fromJson(Map<String, dynamic> json) =>
      _$CampaignDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CampaignDtoToJson(this);

  CampaignDto copyWith({
    int? id,
    int? teacherId,
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
    int? currentParticipants,
    String? status,
    String? rewardType,
    Decimal? rewardValue,
    String? rewardDescription,
    int? maxRank,
    bool? rewardsDistributed,
    DateTime? rewardsDistributedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<CampaignParticipantDto>? participants,
    CampaignParticipantDto? participant,
  }) {
    return CampaignDto(
      id: id ?? this.id,
      teacherId: teacherId ?? this.teacherId,
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
      currentParticipants: currentParticipants ?? this.currentParticipants,
      status: status ?? this.status,
      rewardType: rewardType ?? this.rewardType,
      rewardValue: rewardValue ?? this.rewardValue,
      rewardDescription: rewardDescription ?? this.rewardDescription,
      maxRank: maxRank ?? this.maxRank,
      rewardsDistributed: rewardsDistributed ?? this.rewardsDistributed,
      rewardsDistributedAt: rewardsDistributedAt ?? this.rewardsDistributedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      participant: participant ?? this.participant,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CampaignDto &&
        other.id == id &&
        other.teacherId == teacherId &&
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
        other.currentParticipants == currentParticipants &&
        other.status == status &&
        other.rewardType == rewardType &&
        other.rewardValue == rewardValue &&
        other.rewardDescription == rewardDescription &&
        other.maxRank == maxRank &&
        other.rewardsDistributed == rewardsDistributed &&
        other.rewardsDistributedAt == rewardsDistributedAt &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.participant == participant;
  }

  @override
  int get hashCode {
    return Object.hashAll([
      id,
      teacherId,
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
      currentParticipants,
      status,
      rewardType,
      rewardValue,
      rewardDescription,
      maxRank,
      rewardsDistributed,
      rewardsDistributedAt,
      createdAt,
      updatedAt,
      participant,
    ]);
  }

  @override
  String toString() {
    return 'CampaignDto(id: $id, teacherId: $teacherId, title: $title, description: $description, thumbnail: $thumbnail, promotionalContent: $promotionalContent, formFields: $formFields, examId: $examId, negativeMarking: $negativeMarking, startDate: $startDate, endDate: $endDate, examStartDate: $examStartDate, examEndDate: $examEndDate, maxParticipants: $maxParticipants, currentParticipants: $currentParticipants, status: $status, rewardType: $rewardType, rewardValue: $rewardValue, rewardDescription: $rewardDescription, maxRank: $maxRank, rewardsDistributed: $rewardsDistributed, rewardsDistributedAt: $rewardsDistributedAt, createdAt: $createdAt, updatedAt: $updatedAt, participant: $participant)';
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

@JsonSerializable(fieldRename: FieldRename.snake)
class CampaignPageDto {
  final List<CampaignDto> items;
  final bool hasMore;
  final String? nextCursor;
  final int total;

  const CampaignPageDto({
    required this.items,
    required this.hasMore,
    this.nextCursor,
    required this.total,
  });

  factory CampaignPageDto.fromJson(Map<String, dynamic> json) =>
      _$CampaignPageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CampaignPageDtoToJson(this);

  CampaignPageDto copyWith({
    List<CampaignDto>? items,
    bool? hasMore,
    String? nextCursor,
    int? total,
  }) {
    return CampaignPageDto(
      items: items ?? this.items,
      hasMore: hasMore ?? this.hasMore,
      nextCursor: nextCursor ?? this.nextCursor,
      total: total ?? this.total,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CampaignPageDto &&
        other.items == items &&
        other.hasMore == hasMore &&
        other.nextCursor == nextCursor &&
        other.total == total;
  }

  @override
  int get hashCode {
    return items.hashCode ^
        hasMore.hashCode ^
        nextCursor.hashCode ^
        total.hashCode;
  }

  @override
  String toString() {
    return 'CampaignPageDto(items: $items, hasMore: $hasMore, nextCursor: $nextCursor, total: $total)';
  }

  /// Returns true if this page has no items
  bool get isEmpty => items.isEmpty;

  /// Returns true if this page has items
  bool get isNotEmpty => items.isNotEmpty;

  /// Returns the number of items in this page
  int get count => items.length;

  /// Returns true if there are more pages available
  bool get hasNextPage => hasMore && nextCursor != null;

  /// Returns the current page number (1-based)
  int get currentPage {
    if (isEmpty) return 1;
    return ((total - items.length) ~/ items.length) + 1;
  }

  /// Returns the total number of pages
  int get totalPages {
    if (isEmpty) return 1;
    return (total / items.length).ceil();
  }

  /// Returns true if this is the first page
  bool get isFirstPage => currentPage == 1;

  /// Returns true if this is the last page
  bool get isLastPage => !hasMore;

  /// Returns a description of the current page status
  String get pageStatus {
    if (isEmpty) return 'No campaigns found';
    return 'Page $currentPage of $totalPages (${items.length} of $total campaigns)';
  }
}
