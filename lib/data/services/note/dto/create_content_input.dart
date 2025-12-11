class CreateContentInput {
  final String content; // Markdown content
  final String? contentType; // Defaults to 'markdown'
  final int? orderIndex;

  CreateContentInput({
    required this.content,
    this.contentType,
    this.orderIndex,
  });

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      if (contentType != null) 'content_type': contentType,
      if (orderIndex != null) 'order_index': orderIndex,
    };
  }
}
