class UpdateHighlightRequest {
  final String? title;
  final String? description;
  final String? externalUrl;
  final String? thumbnail;

  UpdateHighlightRequest({
    this.title,
    this.description,
    this.externalUrl,
    this.thumbnail,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    if (title != null) json['title'] = title;
    if (description != null) json['description'] = description;
    if (externalUrl != null) json['external_url'] = externalUrl;
    if (thumbnail != null) json['thumbnail'] = thumbnail;
    return json;
  }
}
