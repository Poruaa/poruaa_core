import 'package:poruaa_core/data/services/note/dto/note_chapter_dto.dart';

class NoteChapter {
  final int id;
  final int noteId;
  final String title;
  final String? description;
  final int orderIndex;
  final DateTime createdAt;
  final DateTime updatedAt;

  NoteChapter({
    required this.id,
    required this.noteId,
    required this.title,
    this.description,
    required this.orderIndex,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NoteChapter.fromDto(NoteChapterDto dto) {
    return NoteChapter(
      id: dto.id,
      noteId: dto.noteId,
      title: dto.title,
      description: dto.description,
      orderIndex: dto.orderIndex,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }

  NoteChapterDto toDto() {
    return NoteChapterDto(
      id: id,
      noteId: noteId,
      title: title,
      description: description,
      orderIndex: orderIndex,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  NoteChapter copyWith({
    int? id,
    int? noteId,
    String? title,
    String? description,
    int? orderIndex,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return NoteChapter(
      id: id ?? this.id,
      noteId: noteId ?? this.noteId,
      title: title ?? this.title,
      description: description ?? this.description,
      orderIndex: orderIndex ?? this.orderIndex,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
