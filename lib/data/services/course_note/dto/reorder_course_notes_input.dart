class CourseNoteOrder {
  final int noteId;
  final int orderIndex;

  CourseNoteOrder({required this.noteId, required this.orderIndex});

  Map<String, dynamic> toJson() {
    return {'note_id': noteId, 'order_index': orderIndex};
  }
}

class ReorderCourseNotesInput {
  final List<CourseNoteOrder> orders;

  ReorderCourseNotesInput({required this.orders});

  Map<String, dynamic> toJson() {
    return {'orders': orders.map((order) => order.toJson()).toList()};
  }
}
