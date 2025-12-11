import 'package:poruaa_core/data/services/course_note/dto/note_with_course_info_dto.dart';

class NoteWithCourseInfo {
  final int id;
  final int courseId;
  final int noteId;
  final String status;
  final int orderIndex;
  final DateTime createdAt;
  final int teacherId;
  final String title;
  final String? description;
  final String? thumbnail;
  final DateTime noteCreatedAt;
  final DateTime noteUpdatedAt;

  NoteWithCourseInfo({
    required this.id,
    required this.courseId,
    required this.noteId,
    required this.status,
    required this.orderIndex,
    required this.createdAt,
    required this.teacherId,
    required this.title,
    this.description,
    this.thumbnail,
    required this.noteCreatedAt,
    required this.noteUpdatedAt,
  });

  factory NoteWithCourseInfo.fromDto(NoteWithCourseInfoDto dto) {
    return NoteWithCourseInfo(
      id: dto.id,
      courseId: dto.courseId,
      noteId: dto.noteId,
      status: dto.status,
      orderIndex: dto.orderIndex,
      createdAt: dto.createdAt,
      teacherId: dto.teacherId,
      title: dto.title,
      description: dto.description,
      thumbnail: dto.thumbnail,
      noteCreatedAt: dto.noteCreatedAt,
      noteUpdatedAt: dto.noteUpdatedAt,
    );
  }

  NoteWithCourseInfoDto toDto() {
    return NoteWithCourseInfoDto(
      id: id,
      courseId: courseId,
      noteId: noteId,
      status: status,
      orderIndex: orderIndex,
      createdAt: createdAt,
      teacherId: teacherId,
      title: title,
      description: description,
      thumbnail: thumbnail,
      noteCreatedAt: noteCreatedAt,
      noteUpdatedAt: noteUpdatedAt,
    );
  }

  NoteWithCourseInfo copyWith({
    int? id,
    int? courseId,
    int? noteId,
    String? status,
    int? orderIndex,
    DateTime? createdAt,
    int? teacherId,
    String? title,
    String? description,
    String? thumbnail,
    DateTime? noteCreatedAt,
    DateTime? noteUpdatedAt,
  }) {
    return NoteWithCourseInfo(
      id: id ?? this.id,
      courseId: courseId ?? this.courseId,
      noteId: noteId ?? this.noteId,
      status: status ?? this.status,
      orderIndex: orderIndex ?? this.orderIndex,
      createdAt: createdAt ?? this.createdAt,
      teacherId: teacherId ?? this.teacherId,
      title: title ?? this.title,
      description: description ?? this.description,
      thumbnail: thumbnail ?? this.thumbnail,
      noteCreatedAt: noteCreatedAt ?? this.noteCreatedAt,
      noteUpdatedAt: noteUpdatedAt ?? this.noteUpdatedAt,
    );
  }
}
