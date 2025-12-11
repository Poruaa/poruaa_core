class ReorderTopicsInput {
  final List<TopicOrder> topicOrders;

  ReorderTopicsInput({required this.topicOrders});

  Map<String, dynamic> toJson() {
    return {
      'topic_orders': topicOrders.map((order) => order.toJson()).toList(),
    };
  }
}

class TopicOrder {
  final int topicId;
  final int orderIndex;

  TopicOrder({required this.topicId, required this.orderIndex});

  Map<String, dynamic> toJson() {
    return {'topic_id': topicId, 'order_index': orderIndex};
  }
}
