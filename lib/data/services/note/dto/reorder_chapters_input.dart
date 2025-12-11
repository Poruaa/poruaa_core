class ReorderChaptersInput {
  final List<ChapterOrder> chapterOrders;

  ReorderChaptersInput({required this.chapterOrders});

  Map<String, dynamic> toJson() {
    return {
      'chapter_orders': chapterOrders.map((order) => order.toJson()).toList(),
    };
  }
}

class ChapterOrder {
  final int chapterId;
  final int orderIndex;

  ChapterOrder({required this.chapterId, required this.orderIndex});

  Map<String, dynamic> toJson() {
    return {'chapter_id': chapterId, 'order_index': orderIndex};
  }
}
