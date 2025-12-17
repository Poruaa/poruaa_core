class RemoveFcmTokenResponseDto {
  final bool success;
  final String message;

  RemoveFcmTokenResponseDto({required this.success, required this.message});

  factory RemoveFcmTokenResponseDto.fromJson(Map<String, dynamic> json) {
    return RemoveFcmTokenResponseDto(
      success: json['success'] as bool,
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'success': success, 'message': message};
  }
}
