class UpdateBookmarkRequest {
  final String? thumbnail;
  final String? description;
  final String? externalUrl;

  UpdateBookmarkRequest({
    this.thumbnail,
    this.description,
    this.externalUrl,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    if (thumbnail != null) json['thumbnail'] = thumbnail;
    if (description != null) json['description'] = description;
    if (externalUrl != null) json['external_url'] = externalUrl;
    return json;
  }
}
