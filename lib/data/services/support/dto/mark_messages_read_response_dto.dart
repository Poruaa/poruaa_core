class MarkMessagesReadResponseDto {
  final bool success;

  MarkMessagesReadResponseDto({required this.success});

  factory MarkMessagesReadResponseDto.fromJson(Map<String, dynamic> json) {
    return MarkMessagesReadResponseDto(success: json['success'] as bool);
  }

  Map<String, dynamic> toJson() {
    return {'success': success};
  }
}
