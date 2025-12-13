# Support Chat Integration Guide

Complete guide for integrating the Support Chat feature in your Flutter application.

## Table of Contents

- [Quick Start](#quick-start)
- [REST API Methods](#rest-api-methods)
- [WebSocket Real-time Chat](#websocket-real-time-chat)
- [Import Paths](#import-paths)
- [Error Handling](#error-handling)
- [Best Practices](#best-practices)

---

## Quick Start

### 1. Initialize Repository

```dart
import 'package:poruaa_core/data/repositories/support/support_repository_impl.dart';
import 'package:poruaa_core/data/services/support/support_service_impl.dart';
import 'package:poruaa_core/data/services/authorized_api/authorized_api_service.dart';
import 'package:poruaa_core/data/services/access_token/access_token_service.dart';
import 'package:poruaa_core/data/services/auth/auth_service.dart';

// Initialize dependencies
final authorizedApiService = AuthorizedApiService(
  apiService,
  authService,
  accessTokenService,
);

final supportService = SupportServiceImpl(
  authorizedApiService,
  accessTokenService,
  authService,
);

final supportRepository = SupportRepositoryImpl(supportService);
```

---

## REST API Methods

### Get Messages

```dart
import 'package:poruaa_core/data/repositories/support/support_repository.dart';
import 'package:poruaa_core/utils/result.dart';

final result = await supportRepository.getMessages(
  limit: 50,
  cursor: null, // Omit for first page
);

switch (result) {
  case Ok():
    final messages = result.value.messages;
    final nextCursor = result.value.nextCursor;
    // Use messages and nextCursor for pagination
    break;
  case Err():
    print('Error: ${result.error}');
    break;
}
```

### Send Message

```dart
final result = await supportRepository.sendMessage('Hello, I need help');

switch (result) {
  case Ok():
    final message = result.value;
    // Message sent successfully
    break;
  case Err():
    print('Error: ${result.error}');
    break;
}
```

### Mark Messages as Read

```dart
final result = await supportRepository.markMessagesAsRead();

switch (result) {
  case Ok():
    // Messages marked as read
    break;
  case Err():
    print('Error: ${result.error}');
    break;
}
```

### Get Unread Count

```dart
final result = await supportRepository.getUnreadCount();

switch (result) {
  case Ok():
    final unreadCount = result.value;
    // Display unread count badge
    break;
  case Err():
    print('Error: ${result.error}');
    break;
}
```

---

## WebSocket Real-time Chat

### Connect to WebSocket

```dart
import 'package:poruaa_core/data/repositories/support/support_repository.dart';
import 'package:poruaa_core/data/repositories/support/support_websocket_repository_controller.dart';

final result = await supportRepository.connectWebSocket();

switch (result) {
  case Ok():
    final wsController = result.value;
    
    // Listen to incoming messages
    final subscription = wsController.messages.listen((messageResult) {
      switch (messageResult) {
        case Ok():
          final message = messageResult.value;
          // Handle incoming message from admin
          print('New message: ${message.message}');
          break;
        case Err():
          print('Error: ${messageResult.error}');
          break;
      }
    });
    
    // Send a message via WebSocket
    await wsController.sendMessage('Hello from WebSocket!');
    
    // Clean up when done
    subscription.cancel();
    await wsController.close();
    break;
  case Err():
    print('Failed to connect: ${result.error}');
    break;
}
```

### Complete WebSocket Example

```dart
class SupportChatController {
  SupportWebSocketRepositoryController? _wsController;
  StreamSubscription<Result<SupportMessage>>? _subscription;
  
  Future<void> connect() async {
    final result = await supportRepository.connectWebSocket();
    
    switch (result) {
      case Ok():
        _wsController = result.value;
        
        _subscription = _wsController!.messages.listen((messageResult) {
          switch (messageResult) {
            case Ok():
              _handleNewMessage(messageResult.value);
              break;
            case Err():
              _handleError(messageResult.error);
              break;
          }
        });
        break;
      case Err():
        _handleError(result.error);
        break;
    }
  }
  
  Future<void> sendMessage(String text) async {
    if (_wsController != null && !_wsController!.isClosed) {
      await _wsController!.sendMessage(text);
    }
  }
  
  Future<void> disconnect() async {
    await _subscription?.cancel();
    await _wsController?.close();
    _wsController = null;
  }
  
  void _handleNewMessage(SupportMessage message) {
    // Update UI with new message
  }
  
  void _handleError(String error) {
    // Handle error
  }
}
```

---

## Import Paths

### Repositories

```dart
// Repository Interface
import 'package:poruaa_core/data/repositories/support/support_repository.dart';

// Repository Implementation
import 'package:poruaa_core/data/repositories/support/support_repository_impl.dart';

// WebSocket Controller (Repository Level)
import 'package:poruaa_core/data/repositories/support/support_websocket_repository_controller.dart';
```

### Services

```dart
// Service Interface
import 'package:poruaa_core/data/services/support/support_service.dart';

// Service Implementation
import 'package:poruaa_core/data/services/support/support_service_impl.dart';

// WebSocket Controller (Service Level)
import 'package:poruaa_core/data/services/support/support_websocket_controller.dart';
```

### Domain Models

```dart
// Support Message Domain Model
import 'package:poruaa_core/domain/models/support/support_message.dart';
```

### DTOs (Service Layer)

```dart
// Support Message DTO
import 'package:poruaa_core/data/services/support/dto/support_message_dto.dart';

// Get Messages Response DTO
import 'package:poruaa_core/data/services/support/dto/get_messages_response_dto.dart';

// Send Message Input DTO
import 'package:poruaa_core/data/services/support/dto/send_message_input_dto.dart';

// Send Message Response DTO
import 'package:poruaa_core/data/services/support/dto/send_message_response_dto.dart';

// Unread Count Response DTO
import 'package:poruaa_core/data/services/support/dto/unread_count_response_dto.dart';

// Mark Messages Read Response DTO
import 'package:poruaa_core/data/services/support/dto/mark_messages_read_response_dto.dart';
```

### Utilities

```dart
// Result Type
import 'package:poruaa_core/utils/result.dart';
```

---

## Error Handling

All methods return `Result<T>` for type-safe error handling:

```dart
final result = await supportRepository.getMessages();

result.fold(
  (messages) {
    // Success - use messages
    print('Loaded ${messages.messages.length} messages');
  },
  (error) {
    // Error - handle error
    if (error.contains('400')) {
      // Bad request - user is neither student nor teacher
    } else if (error.contains('500')) {
      // Server error
    } else {
      // Other errors
    }
  },
);
```

---

## Best Practices

### 1. Initial Load Strategy

```dart
// 1. Fetch recent messages via REST API
final messagesResult = await supportRepository.getMessages(limit: 50);

// 2. Establish WebSocket connection for real-time updates
final wsResult = await supportRepository.connectWebSocket();

// 3. Merge WebSocket messages with existing messages
```

### 2. Message Ordering

- Messages are ordered by `created_at` descending (newest first)
- Always sort by `id` or `created_at` when displaying
- Handle race conditions when messages arrive out of order

### 3. Read Status Management

```dart
// Mark messages as read when user views them
await supportRepository.markMessagesAsRead();

// Poll unread count periodically
Timer.periodic(Duration(minutes: 1), (timer) async {
  final result = await supportRepository.getUnreadCount();
  // Update UI with unread count
});
```

### 4. WebSocket Connection Management

```dart
// Implement reconnection logic with exponential backoff
class WebSocketManager {
  SupportWebSocketRepositoryController? _controller;
  int _reconnectAttempts = 0;
  
  Future<void> connect() async {
    try {
      final result = await supportRepository.connectWebSocket();
      if (result case Ok(:final controller)) {
        _controller = controller;
        _reconnectAttempts = 0;
        _setupListeners();
      }
    } catch (e) {
      _scheduleReconnect();
    }
  }
  
  void _scheduleReconnect() {
    final delay = Duration(
      seconds: (2 * _reconnectAttempts).clamp(1, 60),
    );
    Future.delayed(delay, () {
      _reconnectAttempts++;
      connect();
    });
  }
}
```

### 5. Resource Cleanup

```dart
@override
void dispose() {
  _subscription?.cancel();
  _wsController?.close();
  super.dispose();
}
```

---

## Rate Limiting

- **Limit:** 10 messages per minute per user
- **Window:** 60 seconds rolling window
- **Applies to:** Both REST API and WebSocket messages
- **Response:** `429 Too Many Requests` when exceeded

---

## Pagination

Messages use cursor-based pagination:

```dart
// First page
var result = await supportRepository.getMessages(limit: 50);

// Next page
if (result case Ok(:final data)) {
  if (data.nextCursor != null) {
    result = await supportRepository.getMessages(
      limit: 50,
      cursor: data.nextCursor,
    );
  }
}
```

---

## Notes

- All timestamps are in ISO 8601 format (UTC)
- Messages are ordered by `created_at` descending (newest first)
- Each user (student/teacher) has exactly one conversation with admin
- Users can only see their own messages
- WebSocket messages are automatically persisted to database
- Connection automatically handles ping/pong for keepalive
