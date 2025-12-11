import 'package:poruaa_core/data/services/note/dto/note_content_dto.dart';

class NoteContent {
  final int id;
  final int topicId;
  final String content;
  final String contentType; // 'markdown', 'html', 'plain'
  final int orderIndex;
  final DateTime createdAt;
  final DateTime updatedAt;

  NoteContent({
    required this.id,
    required this.topicId,
    required this.content,
    required this.contentType,
    required this.orderIndex,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NoteContent.fromDto(NoteContentDto dto) {
    return NoteContent(
      id: dto.id,
      topicId: dto.topicId,
      content: dto.content,
      contentType: dto.contentType,
      orderIndex: dto.orderIndex,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }

  NoteContentDto toDto() {
    return NoteContentDto(
      id: id,
      topicId: topicId,
      content: content,
      contentType: contentType,
      orderIndex: orderIndex,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  NoteContent copyWith({
    int? id,
    int? topicId,
    String? content,
    String? contentType,
    int? orderIndex,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return NoteContent(
      id: id ?? this.id,
      topicId: topicId ?? this.topicId,
      content: content ?? this.content,
      contentType: contentType ?? this.contentType,
      orderIndex: orderIndex ?? this.orderIndex,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
