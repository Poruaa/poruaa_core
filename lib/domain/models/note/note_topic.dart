import 'package:poruaa_core/data/services/note/dto/note_topic_dto.dart';

class NoteTopic {
  final int id;
  final int chapterId;
  final String title;
  final String? description;
  final int orderIndex;
  final DateTime createdAt;
  final DateTime updatedAt;

  NoteTopic({
    required this.id,
    required this.chapterId,
    required this.title,
    this.description,
    required this.orderIndex,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NoteTopic.fromDto(NoteTopicDto dto) {
    return NoteTopic(
      id: dto.id,
      chapterId: dto.chapterId,
      title: dto.title,
      description: dto.description,
      orderIndex: dto.orderIndex,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }

  NoteTopicDto toDto() {
    return NoteTopicDto(
      id: id,
      chapterId: chapterId,
      title: title,
      description: description,
      orderIndex: orderIndex,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  NoteTopic copyWith({
    int? id,
    int? chapterId,
    String? title,
    String? description,
    int? orderIndex,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return NoteTopic(
      id: id ?? this.id,
      chapterId: chapterId ?? this.chapterId,
      title: title ?? this.title,
      description: description ?? this.description,
      orderIndex: orderIndex ?? this.orderIndex,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
