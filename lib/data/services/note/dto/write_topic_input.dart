import 'package:poruaa_core/data/services/note/dto/write_content_input.dart';

class WriteTopicInput {
  final String title;
  final String? description;
  final int? orderIndex;
  final List<WriteContentInput> contents;

  WriteTopicInput({
    required this.title,
    this.description,
    this.orderIndex,
    required this.contents,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      if (description != null) 'description': description,
      if (orderIndex != null) 'order_index': orderIndex,
      'contents': contents.map((content) => content.toJson()).toList(),
    };
  }
}
