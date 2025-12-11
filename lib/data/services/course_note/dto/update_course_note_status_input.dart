class UpdateCourseNoteStatusInput {
  final String status; // 'public' or 'private'

  UpdateCourseNoteStatusInput({required this.status});

  Map<String, dynamic> toJson() {
    return {'status': status};
  }
}
