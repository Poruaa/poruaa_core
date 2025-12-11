class CreateNoteInput {
  final String title;
  final String? description;
  final String? thumbnail;

  CreateNoteInput({required this.title, this.description, this.thumbnail});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      if (description != null) 'description': description,
      if (thumbnail != null) 'thumbnail': thumbnail,
    };
  }
}
