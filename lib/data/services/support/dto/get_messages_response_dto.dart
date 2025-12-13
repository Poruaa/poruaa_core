import 'package:poruaa_core/data/services/support/dto/support_message_dto.dart';

class GetMessagesResponseDto {
  final List<SupportMessageDto> messages;
  final int? nextCursor;

  GetMessagesResponseDto({required this.messages, this.nextCursor});

  factory GetMessagesResponseDto.fromJson(Map<String, dynamic> json) {
    return GetMessagesResponseDto(
      messages: (json['messages'] as List)
          .map((e) => SupportMessageDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextCursor: json['next_cursor'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'messages': messages.map((e) => e.toJson()).toList(),
      'next_cursor': nextCursor,
    };
  }
}
