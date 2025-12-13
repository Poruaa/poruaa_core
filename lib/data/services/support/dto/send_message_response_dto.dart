import 'package:poruaa_core/data/services/support/dto/support_message_dto.dart';

class SendMessageResponseDto {
  final SupportMessageDto message;

  SendMessageResponseDto({required this.message});

  factory SendMessageResponseDto.fromJson(Map<String, dynamic> json) {
    return SendMessageResponseDto(
      message: SupportMessageDto.fromJson(
        json['message'] as Map<String, dynamic>,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message.toJson()};
  }
}
