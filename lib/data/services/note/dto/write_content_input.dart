class WriteContentInput {
  final String content;
  final String? contentType; // Defaults to "markdown" if not provided
  final int? orderIndex;

  WriteContentInput({required this.content, this.contentType, this.orderIndex});

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      if (contentType != null) 'content_type': contentType,
      if (orderIndex != null) 'order_index': orderIndex,
    };
  }
}
