class NoteChapterDto {
  final int id;
  final int noteId;
  final String title;
  final String? description;
  final int orderIndex;
  final DateTime createdAt;
  final DateTime updatedAt;

  NoteChapterDto({
    required this.id,
    required this.noteId,
    required this.title,
    this.description,
    required this.orderIndex,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NoteChapterDto.fromJson(Map<String, dynamic> json) {
    return NoteChapterDto(
      id: json['id'],
      noteId: json['note_id'],
      title: json['title'],
      description: json['description'],
      orderIndex: json['order_index'],
      createdAt: DateTime.parse(json['created_at']).toLocal(),
      updatedAt: DateTime.parse(json['updated_at']).toLocal(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'note_id': noteId,
      'title': title,
      'description': description,
      'order_index': orderIndex,
      'created_at': createdAt.toUtc().toIso8601String(),
      'updated_at': updatedAt.toUtc().toIso8601String(),
    };
  }
}
