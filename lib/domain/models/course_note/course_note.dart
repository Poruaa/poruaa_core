import 'package:poruaa_core/data/services/course_note/dto/course_note_dto.dart';

class CourseNote {
  final int id;
  final int courseId;
  final int noteId;
  final String status; // 'public' or 'private'
  final int orderIndex;
  final DateTime createdAt;

  CourseNote({
    required this.id,
    required this.courseId,
    required this.noteId,
    required this.status,
    required this.orderIndex,
    required this.createdAt,
  });

  factory CourseNote.fromDto(CourseNoteDto dto) {
    return CourseNote(
      id: dto.id,
      courseId: dto.courseId,
      noteId: dto.noteId,
      status: dto.status,
      orderIndex: dto.orderIndex,
      createdAt: dto.createdAt,
    );
  }

  CourseNoteDto toDto() {
    return CourseNoteDto(
      id: id,
      courseId: courseId,
      noteId: noteId,
      status: status,
      orderIndex: orderIndex,
      createdAt: createdAt,
    );
  }

  CourseNote copyWith({
    int? id,
    int? courseId,
    int? noteId,
    String? status,
    int? orderIndex,
    DateTime? createdAt,
  }) {
    return CourseNote(
      id: id ?? this.id,
      courseId: courseId ?? this.courseId,
      noteId: noteId ?? this.noteId,
      status: status ?? this.status,
      orderIndex: orderIndex ?? this.orderIndex,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
