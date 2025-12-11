class NoteContentDto {
  final int id;
  final int topicId;
  final String content;
  final String contentType; // 'markdown', 'html', 'plain'
  final int orderIndex;
  final DateTime createdAt;
  final DateTime updatedAt;

  NoteContentDto({
    required this.id,
    required this.topicId,
    required this.content,
    required this.contentType,
    required this.orderIndex,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NoteContentDto.fromJson(Map<String, dynamic> json) {
    return NoteContentDto(
      id: json['id'],
      topicId: json['topic_id'],
      content: json['content'],
      contentType: json['content_type'] ?? 'markdown',
      orderIndex: json['order_index'],
      createdAt: DateTime.parse(json['created_at']).toLocal(),
      updatedAt: DateTime.parse(json['updated_at']).toLocal(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'topic_id': topicId,
      'content': content,
      'content_type': contentType,
      'order_index': orderIndex,
      'created_at': createdAt.toUtc().toIso8601String(),
      'updated_at': updatedAt.toUtc().toIso8601String(),
    };
  }
}
