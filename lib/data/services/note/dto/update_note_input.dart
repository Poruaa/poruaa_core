class UpdateNoteInput {
  final String? title;
  final String? description;
  final String? thumbnail;

  UpdateNoteInput({this.title, this.description, this.thumbnail});

  Map<String, dynamic> toJson() {
    return {
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (thumbnail != null) 'thumbnail': thumbnail,
    };
  }
}
