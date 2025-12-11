class ReorderContentsInput {
  final List<ContentOrder> contentOrders;

  ReorderContentsInput({required this.contentOrders});

  Map<String, dynamic> toJson() {
    return {
      'content_orders': contentOrders.map((order) => order.toJson()).toList(),
    };
  }
}

class ContentOrder {
  final int contentId;
  final int orderIndex;

  ContentOrder({required this.contentId, required this.orderIndex});

  Map<String, dynamic> toJson() {
    return {'content_id': contentId, 'order_index': orderIndex};
  }
}
