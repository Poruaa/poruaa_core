import 'dart:async';

import 'package:poruaa_core/data/repositories/support/support_repository.dart';
import 'package:poruaa_core/data/repositories/support/support_websocket_repository_controller.dart';
import 'package:poruaa_core/data/services/support/dto/send_message_input_dto.dart';
import 'package:poruaa_core/data/services/support/support_service.dart';
import 'package:poruaa_core/domain/models/support/support_message.dart';
import 'package:poruaa_core/utils/result.dart';

class SupportRepositoryImpl extends SupportRepository {
  final SupportService _supportService;

  SupportRepositoryImpl(SupportService supportService)
    : _supportService = supportService;

  @override
  Future<Result<GetMessagesResult>> getMessages({
    int? limit,
    int? cursor,
  }) async {
    var result = await _supportService.getMessages(
      limit: limit,
      cursor: cursor,
    );
    switch (result) {
      case Ok():
        var response = result.value;
        var messages = response.messages
            .map((dto) => SupportMessage.fromDto(dto))
            .toList();
        return Result.ok(
          GetMessagesResult(
            messages: messages,
            nextCursor: response.nextCursor,
          ),
        );
      case Err():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<SupportMessage>> sendMessage(String message) async {
    var input = SendMessageInputDto(message: message);
    var result = await _supportService.sendMessage(input);
    switch (result) {
      case Ok():
        var supportMessage = SupportMessage.fromDto(result.value.message);
        return Result.ok(supportMessage);
      case Err():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<bool>> markMessagesAsRead() async {
    return await _supportService.markMessagesAsRead();
  }

  @override
  Future<Result<int>> getUnreadCount() async {
    var result = await _supportService.getUnreadCount();
    switch (result) {
      case Ok():
        return Result.ok(result.value.unreadCount);
      case Err():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<SupportWebSocketRepositoryController>>
  connectWebSocket() async {
    var result = await _supportService.connectWebSocket();
    switch (result) {
      case Ok():
        final repositoryController = SupportWebSocketRepositoryController(
          result.value,
        );
        return Result.ok(repositoryController);
      case Err():
        return Result.error(result.error);
    }
  }
}
