import 'package:poruaa_core/data/dao/withdrawal_request/withdrawal_request_dao.dart';
import 'package:poruaa_core/data/services/wallet/withdrawal_request_service.dart';
import 'package:poruaa_core/data/services/wallet/model/withdrawal_request_model.dart';
import 'package:poruaa_core/domain/models/withdrawal/withdrawal_request.dart';
import 'package:poruaa_core/utils/result.dart';

/// Repository interface for withdrawal requests
abstract class WithdrawalRequestRepository {
  Future<Result<List<WithdrawalRequest>>> getWithdrawalRequests();
  Future<Result<WithdrawalRequest>> getWithdrawalRequest(int id);
  Future<Result<WithdrawalRequest>> createWithdrawalRequest(
    int paymentMethodId,
    double amount,
  );
  Future<Result<bool>> hasPendingWithdrawalRequest();
  Future<Result<Map<String, dynamic>>> getWithdrawalRequestHistory({
    int page = 1,
    int limit = 10,
    String? status,
  });
  Future<Result<void>> clearWithdrawalRequests();
}

/// Repository implementation for withdrawal requests
class WithdrawalRequestRepositoryImpl implements WithdrawalRequestRepository {
  final WithdrawalRequestService _service;
  final WithdrawalRequestDao _dao;

  WithdrawalRequestRepositoryImpl(this._service, this._dao);

  @override
  Future<Result<List<WithdrawalRequest>>> getWithdrawalRequests() async {
    try {
      // Try to get from API first
      final apiResult = await _service.getWithdrawalRequests();

      switch (apiResult) {
        case Ok(:final value):
          // Cache the results locally
          await _cacheWithdrawalRequests(value);

          // Convert to domain models
          final domainModels = value
              .map((model) => WithdrawalRequest.fromModel(model))
              .toList();
          return Ok(domainModels);
        case Err():
          // Fallback to local cache
          return await _getWithdrawalRequestsFromCache();
      }
    } catch (e) {
      // Fallback to local cache on error
      return await _getWithdrawalRequestsFromCache();
    }
  }

  @override
  Future<Result<WithdrawalRequest>> getWithdrawalRequest(int id) async {
    try {
      // Try to get from API first
      final apiResult = await _service.getWithdrawalRequest(id);

      switch (apiResult) {
        case Ok(:final value):
          // Cache the result locally
          await _cacheWithdrawalRequest(value);

          // Convert to domain model
          final domainModel = WithdrawalRequest.fromModel(value);
          return Ok(domainModel);
        case Err():
          // Fallback to local cache
          return await _getWithdrawalRequestFromCache(id);
      }
    } catch (e) {
      // Fallback to local cache on error
      return await _getWithdrawalRequestFromCache(id);
    }
  }

  @override
  Future<Result<WithdrawalRequest>> createWithdrawalRequest(
    int paymentMethodId,
    double amount,
  ) async {
    try {
      // Validate the withdrawal request
      final validationResult = _service.validateWithdrawalRequest(
        paymentMethodId,
        amount,
      );
      if (validationResult case Err(:final error)) {
        return Err(error);
      }

      // Create via API
      final apiResult = await _service.createWithdrawalRequest(
        paymentMethodId,
        amount,
      );

      switch (apiResult) {
        case Ok(:final value):
          // Cache the result locally
          await _cacheWithdrawalRequest(value);

          // Convert to domain model
          final domainModel = WithdrawalRequest.fromModel(value);
          return Ok(domainModel);
        case Err():
          return Err(apiResult.error);
      }
    } catch (e) {
      return Err('Network error: $e');
    }
  }

  @override
  Future<Result<bool>> hasPendingWithdrawalRequest() async {
    try {
      // Try to get from API first
      final apiResult = await _service.hasPendingWithdrawalRequest();

      switch (apiResult) {
        case Ok(:final value):
          return Ok(value);
        case Err():
          // Fallback to local cache
          return await _hasPendingWithdrawalRequestFromCache();
      }
    } catch (e) {
      // Fallback to local cache on error
      return await _hasPendingWithdrawalRequestFromCache();
    }
  }

  @override
  Future<Result<Map<String, dynamic>>> getWithdrawalRequestHistory({
    int page = 1,
    int limit = 10,
    String? status,
  }) async {
    try {
      // Get from API
      final apiResult = await _service.getWithdrawalRequestHistory(
        page: page,
        limit: limit,
        status: status,
      );

      switch (apiResult) {
        case Ok(:final value):
          return Ok(value);
        case Err():
          return Err(apiResult.error);
      }
    } catch (e) {
      return Err('Network error: $e');
    }
  }

  @override
  Future<Result<void>> clearWithdrawalRequests() async {
    try {
      // Clear local cache
      await _dao.clearWithdrawalRequests(
        0,
      ); // Assuming walletId = 0 for current user
      return Ok(null);
    } catch (e) {
      return Err('Failed to clear withdrawal requests: $e');
    }
  }

  // Private helper methods

  Future<Result<List<WithdrawalRequest>>>
  _getWithdrawalRequestsFromCache() async {
    try {
      final items = await _dao.getWithdrawalRequests(
        0,
      ); // Assuming walletId = 0 for current user
      final models = items.map((item) => _dao.itemToModel(item)).toList();
      final domainModels = models
          .map((model) => WithdrawalRequest.fromModel(model))
          .toList();
      return Ok(domainModels);
    } catch (e) {
      return Err('Failed to get withdrawal requests from cache: $e');
    }
  }

  Future<Result<WithdrawalRequest>> _getWithdrawalRequestFromCache(
    int id,
  ) async {
    try {
      final item = await _dao.getWithdrawalRequest(id);
      if (item == null) {
        return Err('Withdrawal request not found');
      }
      final model = _dao.itemToModel(item);
      final domainModel = WithdrawalRequest.fromModel(model);
      return Ok(domainModel);
    } catch (e) {
      return Err('Failed to get withdrawal request from cache: $e');
    }
  }

  Future<Result<bool>> _hasPendingWithdrawalRequestFromCache() async {
    try {
      final hasPending = await _dao.hasPendingWithdrawalRequest(
        0,
      ); // Assuming walletId = 0 for current user
      return Ok(hasPending);
    } catch (e) {
      return Err('Failed to check pending withdrawal request from cache: $e');
    }
  }

  Future<void> _cacheWithdrawalRequests(
    List<WithdrawalRequestModel> withdrawalRequests,
  ) async {
    try {
      for (final withdrawalRequest in withdrawalRequests) {
        await _cacheWithdrawalRequest(withdrawalRequest);
      }
    } catch (e) {
      // Log error but don't throw
    }
  }

  Future<void> _cacheWithdrawalRequest(
    WithdrawalRequestModel withdrawalRequest,
  ) async {
    try {
      final companion = _dao.modelToCompanion(withdrawalRequest);
      await _dao.insertWithdrawalRequest(companion);
    } catch (e) {
      // Log error but don't throw
    }
  }
}
