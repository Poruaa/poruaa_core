class CreateChapterInput {
  final String title;
  final String? description;
  final int? orderIndex;

  CreateChapterInput({required this.title, this.description, this.orderIndex});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      if (description != null) 'description': description,
      if (orderIndex != null) 'order_index': orderIndex,
    };
  }
}
