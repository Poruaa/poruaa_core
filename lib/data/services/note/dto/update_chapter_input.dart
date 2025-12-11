class UpdateChapterInput {
  final String? title;
  final String? description;
  final int? orderIndex;

  UpdateChapterInput({this.title, this.description, this.orderIndex});

  Map<String, dynamic> toJson() {
    return {
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (orderIndex != null) 'order_index': orderIndex,
    };
  }
}
