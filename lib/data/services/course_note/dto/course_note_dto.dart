class CourseNoteDto {
  final int id;
  final int courseId;
  final int noteId;
  final String status; // 'public' or 'private'
  final int orderIndex;
  final DateTime createdAt;

  CourseNoteDto({
    required this.id,
    required this.courseId,
    required this.noteId,
    required this.status,
    required this.orderIndex,
    required this.createdAt,
  });

  factory CourseNoteDto.fromJson(Map<String, dynamic> json) {
    return CourseNoteDto(
      id: json['id'] as int,
      courseId: json['course_id'] as int,
      noteId: json['note_id'] as int,
      status: json['status'] as String,
      orderIndex: json['order_index'] as int,
      createdAt: DateTime.parse(json['created_at'] as String).toLocal(),
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
    };
  }
}
