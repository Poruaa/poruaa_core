class CreateHighlightRequest {
  final String title;
  final String? description;
  final String? externalUrl;
  final String? thumbnail;

  CreateHighlightRequest({
    required this.title,
    this.description,
    this.externalUrl,
    this.thumbnail,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      if (description != null) 'description': description,
      if (externalUrl != null) 'external_url': externalUrl,
      if (thumbnail != null) 'thumbnail': thumbnail,
    };
  }
}
