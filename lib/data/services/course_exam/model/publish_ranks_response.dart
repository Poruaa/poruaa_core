class PublishRanksResponse {
  final bool success;
  final String message;
  final int updatedCount;

  PublishRanksResponse({
    required this.success,
    required this.message,
    required this.updatedCount,
  });

  factory PublishRanksResponse.fromJson(Map<String, dynamic> json) {
    return PublishRanksResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      updatedCount: json['updated_count'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'updated_count': updatedCount,
    };
  }
}
