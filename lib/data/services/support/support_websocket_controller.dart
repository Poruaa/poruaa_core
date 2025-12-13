import 'dart:async';
import 'dart:convert';

import 'package:poruaa_core/data/services/support/dto/support_message_dto.dart';
import 'package:poruaa_core/utils/result.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// Controller for managing WebSocket connection to support chat
///
/// Provides bidirectional communication:
/// - Stream of incoming messages from admin
/// - Method to send messages to admin
class SupportWebSocketController {
  final WebSocketChannel _channel;
  final StreamController<Result<SupportMessageDto>> _messageController =
      StreamController<Result<SupportMessageDto>>.broadcast();
  bool _isClosed = false;

  SupportWebSocketController(this._channel) {
    // Listen to WebSocket stream and parse messages
    _channel.stream.listen(
      (data) {
        try {
          final String messageText;
          if (data is String) {
            messageText = data;
          } else if (data is List<int>) {
            messageText = utf8.decode(data);
          } else {
            _messageController.add(
              Result.error('Unexpected message type: ${data.runtimeType}'),
            );
            return;
          }

          final json = jsonDecode(messageText) as Map<String, dynamic>;
          final message = SupportMessageDto.fromJson(json);
          _messageController.add(Result.ok(message));
        } catch (e) {
          _messageController.add(
            Result.error('Error parsing WebSocket message: $e'),
          );
        }
      },
      onError: (error) {
        _messageController.add(Result.error('WebSocket error: $error'));
      },
      onDone: () {
        _isClosed = true;
        _messageController.close();
      },
      cancelOnError: false,
    );
  }

  /// Stream of incoming messages from admin
  Stream<Result<SupportMessageDto>> get messages => _messageController.stream;

  /// Send a message to admin via WebSocket
  ///
  /// [message] - Message text (max 5000 characters)
  /// Returns true if message was sent successfully, false otherwise
  Future<bool> sendMessage(String message) async {
    if (_isClosed) {
      return false;
    }

    try {
      final payload = jsonEncode({'message': message});
      _channel.sink.add(payload);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Check if the WebSocket connection is closed
  bool get isClosed => _isClosed;

  /// Close the WebSocket connection
  Future<void> close() async {
    if (!_isClosed) {
      _isClosed = true;
      await _channel.sink.close();
      await _messageController.close();
    }
  }
}
