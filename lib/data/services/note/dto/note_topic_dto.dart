class NoteTopicDto {
  final int id;
  final int chapterId;
  final String title;
  final String? description;
  final int orderIndex;
  final DateTime createdAt;
  final DateTime updatedAt;

  NoteTopicDto({
    required this.id,
    required this.chapterId,
    required this.title,
    this.description,
    required this.orderIndex,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NoteTopicDto.fromJson(Map<String, dynamic> json) {
    return NoteTopicDto(
      id: json['id'],
      chapterId: json['chapter_id'],
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
      'chapter_id': chapterId,
      'title': title,
      'description': description,
      'order_index': orderIndex,
      'created_at': createdAt.toUtc().toIso8601String(),
      'updated_at': updatedAt.toUtc().toIso8601String(),
    };
  }
}
