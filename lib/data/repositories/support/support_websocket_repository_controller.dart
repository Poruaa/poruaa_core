import 'dart:async';

import 'package:poruaa_core/data/services/support/support_websocket_controller.dart';
import 'package:poruaa_core/domain/models/support/support_message.dart';
import 'package:poruaa_core/utils/result.dart';

/// Repository-level WebSocket controller that converts DTOs to domain models
class SupportWebSocketRepositoryController {
  final SupportWebSocketController _serviceController;

  SupportWebSocketRepositoryController(this._serviceController);

  /// Stream of incoming messages from admin (as domain models)
  Stream<Result<SupportMessage>> get messages {
    return _serviceController.messages.map((result) {
      switch (result) {
        case Ok():
          final supportMessage = SupportMessage.fromDto(result.value);
          return Result.ok(supportMessage);
        case Err():
          return Result.error(result.error);
      }
    });
  }

  /// Send a message to admin via WebSocket
  ///
  /// [message] - Message text (max 5000 characters)
  /// Returns true if message was sent successfully, false otherwise
  Future<bool> sendMessage(String message) {
    return _serviceController.sendMessage(message);
  }

  /// Check if the WebSocket connection is closed
  bool get isClosed => _serviceController.isClosed;

  /// Close the WebSocket connection
  Future<void> close() {
    return _serviceController.close();
  }
}
