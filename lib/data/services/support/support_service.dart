import 'package:poruaa_core/data/services/support/dto/get_messages_response_dto.dart';
import 'package:poruaa_core/data/services/support/dto/send_message_input_dto.dart';
import 'package:poruaa_core/data/services/support/dto/send_message_response_dto.dart';
import 'package:poruaa_core/data/services/support/dto/unread_count_response_dto.dart';
import 'package:poruaa_core/data/services/support/support_websocket_controller.dart';
import 'package:poruaa_core/utils/result.dart';

abstract class SupportService {
  /// Get paginated messages for the current user's conversation with admin
  ///
  /// [limit] - Number of messages to fetch. Default: 50, Max: 100
  /// [cursor] - Message ID for cursor-based pagination. Omit for first page.
  Future<Result<GetMessagesResponseDto>> getMessages({int? limit, int? cursor});

  /// Send a message to admin support team
  ///
  /// [input] - Message input with message text (max 5000 characters)
  Future<Result<SendMessageResponseDto>> sendMessage(SendMessageInputDto input);

  /// Mark all admin messages as read for the current user
  Future<Result<bool>> markMessagesAsRead();

  /// Get the count of unread admin messages for the current user
  Future<Result<UnreadCountResponseDto>> getUnreadCount();

  /// Connect to WebSocket for real-time chat
  ///
  /// Returns a WebSocket controller that provides:
  /// - Stream of incoming messages from admin
  /// - Method to send messages to admin
  ///
  /// The controller should be closed when done to clean up resources.
  Future<Result<SupportWebSocketController>> connectWebSocket();
}
