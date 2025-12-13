import 'package:poruaa_core/data/services/support/dto/support_message_dto.dart';

class SupportMessage {
  final int id;
  final int userId;
  final String userType; // "student" or "teacher"
  final String senderType; // "user" or "admin"
  final int senderId;
  final String message;
  final bool isReadByUser;
  final bool isReadByAdmin;
  final DateTime createdAt;

  SupportMessage({
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

  factory SupportMessage.fromDto(SupportMessageDto dto) {
    return SupportMessage(
      id: dto.id,
      userId: dto.userId,
      userType: dto.userType,
      senderType: dto.senderType,
      senderId: dto.senderId,
      message: dto.message,
      isReadByUser: dto.isReadByUser,
      isReadByAdmin: dto.isReadByAdmin,
      createdAt: dto.createdAt,
    );
  }

  SupportMessageDto toDto() {
    return SupportMessageDto(
      id: id,
      userId: userId,
      userType: userType,
      senderType: senderType,
      senderId: senderId,
      message: message,
      isReadByUser: isReadByUser,
      isReadByAdmin: isReadByAdmin,
      createdAt: createdAt,
    );
  }

  SupportMessage copyWith({
    int? id,
    int? userId,
    String? userType,
    String? senderType,
    int? senderId,
    String? message,
    bool? isReadByUser,
    bool? isReadByAdmin,
    DateTime? createdAt,
  }) {
    return SupportMessage(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      userType: userType ?? this.userType,
      senderType: senderType ?? this.senderType,
      senderId: senderId ?? this.senderId,
      message: message ?? this.message,
      isReadByUser: isReadByUser ?? this.isReadByUser,
      isReadByAdmin: isReadByAdmin ?? this.isReadByAdmin,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
