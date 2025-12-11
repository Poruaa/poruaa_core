class AttachNoteToCourseInput {
  final int noteId;
  final String? status; // 'public' or 'private', defaults to 'private'
  final int? orderIndex; // Auto-incremented if not provided

  AttachNoteToCourseInput({required this.noteId, this.status, this.orderIndex});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {'note_id': noteId};
    if (status != null) {
      json['status'] = status;
    }
    if (orderIndex != null) {
      json['order_index'] = orderIndex;
    }
    return json;
  }
}
