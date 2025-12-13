import 'package:poruaa_core/data/repositories/support/support_websocket_repository_controller.dart';
import 'package:poruaa_core/domain/models/support/support_message.dart';
import 'package:poruaa_core/utils/result.dart';

class GetMessagesResult {
  final List<SupportMessage> messages;
  final int? nextCursor;

  GetMessagesResult({required this.messages, this.nextCursor});
}

abstract class SupportRepository {
  /// Get paginated messages for the current user's conversation with admin
  ///
  /// [limit] - Number of messages to fetch. Default: 50, Max: 100
  /// [cursor] - Message ID for cursor-based pagination. Omit for first page.
  Future<Result<GetMessagesResult>> getMessages({int? limit, int? cursor});

  /// Send a message to admin support team
  ///
  /// [message] - Message text (max 5000 characters)
  Future<Result<SupportMessage>> sendMessage(String message);

  /// Mark all admin messages as read for the current user
  Future<Result<bool>> markMessagesAsRead();

  /// Get the count of unread admin messages for the current user
  Future<Result<int>> getUnreadCount();

  /// Connect to WebSocket for real-time chat
  ///
  /// Returns a WebSocket controller that provides:
  /// - Stream of incoming messages from admin (as domain models)
  /// - Method to send messages to admin
  ///
  /// The controller should be closed when done to clean up resources.
  Future<Result<SupportWebSocketRepositoryController>> connectWebSocket();
}
