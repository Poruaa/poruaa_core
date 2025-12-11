class UpdateContentInput {
  final String? content;
  final String? contentType;
  final int? orderIndex;

  UpdateContentInput({this.content, this.contentType, this.orderIndex});

  Map<String, dynamic> toJson() {
    return {
      if (content != null) 'content': content,
      if (contentType != null) 'content_type': contentType,
      if (orderIndex != null) 'order_index': orderIndex,
    };
  }
}
