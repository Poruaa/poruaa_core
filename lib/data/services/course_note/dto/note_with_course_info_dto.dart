class NoteWithCourseInfoDto {
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

  NoteWithCourseInfoDto({
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

  factory NoteWithCourseInfoDto.fromJson(Map<String, dynamic> json) {
    return NoteWithCourseInfoDto(
      id: json['id'] as int,
      courseId: json['course_id'] as int,
      noteId: json['note_id'] as int,
      status: json['status'] as String,
      orderIndex: json['order_index'] as int,
      createdAt: DateTime.parse(json['created_at'] as String).toLocal(),
      teacherId: json['teacher_id'] as int,
      title: json['title'] as String,
      description: json['description'] as String?,
      thumbnail: json['thumbnail'] as String?,
      noteCreatedAt: DateTime.parse(
        json['note_created_at'] as String,
      ).toLocal(),
      noteUpdatedAt: DateTime.parse(
        json['note_updated_at'] as String,
      ).toLocal(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'course_id': courseId,
      'note_id': noteId,
      'status': status,
      'order_index': orderIndex,
      'created_at': createdAt.toUtc().toIso8601String(),
      'teacher_id': teacherId,
      'title': title,
      'description': description,
      'thumbnail': thumbnail,
      'note_created_at': noteCreatedAt.toUtc().toIso8601String(),
      'note_updated_at': noteUpdatedAt.toUtc().toIso8601String(),
    };
  }
}
