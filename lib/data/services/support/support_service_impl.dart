import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:poruaa_core/data/services/access_token/access_token_service.dart';
import 'package:poruaa_core/data/services/auth/auth_service.dart';
import 'package:poruaa_core/data/services/authorized_api/authorized_api_service.dart';
import 'package:poruaa_core/data/services/support/dto/get_messages_response_dto.dart';
import 'package:poruaa_core/data/services/support/dto/send_message_input_dto.dart';
import 'package:poruaa_core/data/services/support/dto/send_message_response_dto.dart';
import 'package:poruaa_core/data/services/support/dto/unread_count_response_dto.dart';
import 'package:poruaa_core/data/services/support/support_service.dart';
import 'package:poruaa_core/data/services/support/support_websocket_controller.dart';
import 'package:poruaa_core/utils/result.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart'
    if (dart.library.html) 'package:web_socket_channel/html.dart';

class SupportServiceImpl extends SupportService {
  final AuthorizedApiService _apiService;
  final AccessTokenService _accessTokenService;
  final AuthService _authService;

  SupportServiceImpl(
    this._apiService,
    this._accessTokenService,
    this._authService,
  );

  @override
  Future<Result<GetMessagesResponseDto>> getMessages({
    int? limit,
    int? cursor,
  }) async {
    try {
      final queryParams = <String, String>{};
      if (limit != null) {
        queryParams['limit'] = limit.toString();
      }
      if (cursor != null) {
        queryParams['cursor'] = cursor.toString();
      }

      final queryString = queryParams.isEmpty
          ? ''
          : '?${queryParams.entries.map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&')}';

      var result = await _apiService.get('api/support/messages$queryString');
      switch (result) {
        case Ok():
          var response = result.value;
          if (response.statusCode != 200) {
            return Result.error(response.body);
          }
          var jsonBody = jsonDecode(response.body);
          var messagesResponse = GetMessagesResponseDto.fromJson(jsonBody);
          return Result.ok(messagesResponse);
        case Err():
          return Result.error("Connection error");
      }
    } catch (e) {
      return Result.error("Error: $e");
    }
  }

  @override
  Future<Result<SendMessageResponseDto>> sendMessage(
    SendMessageInputDto input,
  ) async {
    try {
      var result = await _apiService.post(
        'api/support/messages',
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(input.toJson()),
      );

      switch (result) {
        case Ok():
          var response = result.value;
          if (response.statusCode != 200) {
            return Result.error(response.body);
          }
          var jsonBody = jsonDecode(response.body);
          var sendMessageResponse = SendMessageResponseDto.fromJson(jsonBody);
          return Result.ok(sendMessageResponse);
        case Err():
          return Result.error("Connection error");
      }
    } catch (e) {
      return Result.error("Error: $e");
    }
  }

  @override
  Future<Result<bool>> markMessagesAsRead() async {
    try {
      var result = await _apiService.put(
        'api/support/messages/read',
        headers: {"Content-Type": "application/json"},
      );

      switch (result) {
        case Ok():
          var response = result.value;
          if (response.statusCode != 200) {
            return Result.error(response.body);
          }
          return Result.ok(true);
        case Err():
          return Result.error("Connection error");
      }
    } catch (e) {
      return Result.error("Error: $e");
    }
  }

  @override
  Future<Result<UnreadCountResponseDto>> getUnreadCount() async {
    try {
      var result = await _apiService.get('api/support/messages/unread-count');
      switch (result) {
        case Ok():
          var response = result.value;
          if (response.statusCode != 200) {
            return Result.error(response.body);
          }
          var jsonBody = jsonDecode(response.body);
          var unreadCountResponse = UnreadCountResponseDto.fromJson(jsonBody);
          return Result.ok(unreadCountResponse);
        case Err():
          return Result.error("Connection error");
      }
    } catch (e) {
      return Result.error("Error: $e");
    }
  }

  @override
  Future<Result<SupportWebSocketController>> connectWebSocket() async {
    try {
      // Refresh token before connecting
      await _accessTokenService.refreshTokenIfNeeded(_authService);
      final token = await _accessTokenService.getToken();

      if (token == null || token.tokenString.isEmpty) {
        return Result.error('Authentication token not available');
      }

      // Convert HTTP/HTTPS URL to WS/WSS
      final baseUrl = _apiService.hostname;
      final wsScheme = baseUrl.startsWith('https://') ? 'wss://' : 'ws://';
      final wsHost = baseUrl
          .replaceAll('http://', '')
          .replaceAll('https://', '');
      final wsUrl = Uri.parse('$wsScheme$wsHost/api/support/ws');

      // Create WebSocket connection with authentication
      // For native platforms, use IOWebSocketChannel which supports headers
      // For web, headers are not supported, so we pass token in URL
      final WebSocketChannel channel;
      if (kIsWeb) {
        // Web: Pass token in URL query parameter
        final wsUrlWithToken = wsUrl.replace(
          queryParameters: {'token': token.tokenString},
        );
        channel = WebSocketChannel.connect(wsUrlWithToken);
      } else {
        // Native: Use IOWebSocketChannel with headers
        channel = IOWebSocketChannel.connect(
          wsUrl,
          headers: {'Authorization': 'Bearer ${token.tokenString}'},
        );
      }

      // Create and return the WebSocket controller
      final controller = SupportWebSocketController(channel);
      return Result.ok(controller);
    } catch (e) {
      return Result.error('Failed to connect WebSocket: $e');
    }
  }
}
