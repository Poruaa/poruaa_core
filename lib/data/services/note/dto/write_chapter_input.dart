import 'package:poruaa_core/data/services/note/dto/write_topic_input.dart';

class WriteChapterInput {
  final String title;
  final String? description;
  final int? orderIndex;
  final List<WriteTopicInput> topics;

  WriteChapterInput({
    required this.title,
    this.description,
    this.orderIndex,
    required this.topics,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      if (description != null) 'description': description,
      if (orderIndex != null) 'order_index': orderIndex,
      'topics': topics.map((topic) => topic.toJson()).toList(),
    };
  }
}
