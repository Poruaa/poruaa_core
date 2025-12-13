class SupportMessageDto {
  final int id;
  final int userId;
  final String userType; // "student" or "teacher"
  final String senderType; // "user" or "admin"
  final int senderId;
  final String message;
  final bool isReadByUser;
  final bool isReadByAdmin;
  final DateTime createdAt;

  SupportMessageDto({
    required this.id,
    required this.userId,
    required this.userType,
    required this.senderType,
    required this.senderId,
    required this.message,
    required this.isReadByUser,
    required this.isReadByAdmin,
    required this.createdAt,
  });

  factory SupportMessageDto.fromJson(Map<String, dynamic> json) {
    return SupportMessageDto(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      userType: json['user_type'] as String,
      senderType: json['sender_type'] as String,
      senderId: json['sender_id'] as int,
      message: json['message'] as String,
      isReadByUser: json['is_read_by_user'] as bool,
      isReadByAdmin: json['is_read_by_admin'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String).toLocal(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'user_type': userType,
      'sender_type': senderType,
      'sender_id': senderId,
      'message': message,
      'is_read_by_user': isReadByUser,
      'is_read_by_admin': isReadByAdmin,
      'created_at': createdAt.toUtc().toIso8601String(),
    };
  }
}
