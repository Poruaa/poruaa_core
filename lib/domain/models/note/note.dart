import 'package:poruaa_core/data/services/note/dto/note_dto.dart';

class Note {
  final int id;
  final int teacherId;
  final String title;
  final String? description;
  final String? thumbnail;
  final DateTime createdAt;
  final DateTime updatedAt;

  Note({
    required this.id,
    required this.teacherId,
    required this.title,
    this.description,
    this.thumbnail,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Note.fromDto(NoteDto dto) {
    return Note(
      id: dto.id,
      teacherId: dto.teacherId,
      title: dto.title,
      description: dto.description,
      thumbnail: dto.thumbnail,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }

  NoteDto toDto() {
    return NoteDto(
      id: id,
      teacherId: teacherId,
      title: title,
      description: description,
      thumbnail: thumbnail,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  Note copyWith({
    int? id,
    int? teacherId,
    String? title,
    String? description,
    String? thumbnail,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Note(
      id: id ?? this.id,
      teacherId: teacherId ?? this.teacherId,
      title: title ?? this.title,
      description: description ?? this.description,
      thumbnail: thumbnail ?? this.thumbnail,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
