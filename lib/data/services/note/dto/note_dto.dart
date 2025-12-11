class NoteDto {
  final int id;
  final int teacherId;
  final String title;
  final String? description;
  final String? thumbnail;
  final DateTime createdAt;
  final DateTime updatedAt;

  NoteDto({
    required this.id,
    required this.teacherId,
    required this.title,
    this.description,
    this.thumbnail,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NoteDto.fromJson(Map<String, dynamic> json) {
    return NoteDto(
      id: json['id'],
      teacherId: json['teacher_id'],
      title: json['title'],
      description: json['description'],
      thumbnail: json['thumbnail'],
      createdAt: DateTime.parse(json['created_at']).toLocal(),
      updatedAt: DateTime.parse(json['updated_at']).toLocal(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'teacher_id': teacherId,
      'title': title,
      'description': description,
      'thumbnail': thumbnail,
      'created_at': createdAt.toUtc().toIso8601String(),
      'updated_at': updatedAt.toUtc().toIso8601String(),
    };
  }
}
