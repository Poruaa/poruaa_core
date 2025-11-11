class CreateBookmarkRequest {
  final String? thumbnail;
  final String? description;
  final String? externalUrl;

  CreateBookmarkRequest({
    this.thumbnail,
    this.description,
    this.externalUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      if (thumbnail != null) 'thumbnail': thumbnail,
      if (description != null) 'description': description,
      if (externalUrl != null) 'external_url': externalUrl,
    };
  }
}
