import 'package:poruaa_core/data/dao/withdrawal_payment_method/withdrawal_payment_method_dao.dart';
import 'package:poruaa_core/data/services/wallet/withdrawal_payment_method_service.dart';
import 'package:poruaa_core/data/services/wallet/model/payment_method_model.dart';
import 'package:poruaa_core/domain/models/withdrawal/payment_method.dart';
import 'package:poruaa_core/utils/app_loger.dart';
import 'package:poruaa_core/utils/result.dart';

/// Repository interface for withdrawal payment methods
abstract class WithdrawalPaymentMethodRepository {
  Future<Result<List<PaymentMethod>>> getPaymentMethods();
  Future<Result<PaymentMethod>> getPaymentMethod(int id);
  Future<Result<PaymentMethod>> createPaymentMethod(
    PaymentMethod paymentMethod,
  );
  Future<Result<PaymentMethod>> updatePaymentMethod(
    int id,
    PaymentMethod paymentMethod,
  );
  Future<Result<void>> deletePaymentMethod(int id);
  Future<Result<PaymentMethod>> setPrimaryPaymentMethod(int id);
  Future<Result<List<PaymentMethod>>> getActivePaymentMethods();
  Future<Result<PaymentMethod?>> getPrimaryPaymentMethod();
  Future<Result<void>> clearPaymentMethods();
}

/// Repository implementation for withdrawal payment methods
class WithdrawalPaymentMethodRepositoryImpl
    implements WithdrawalPaymentMethodRepository {
  final WithdrawalPaymentMethodService _service;
  final WithdrawalPaymentMethodDao _dao;

  WithdrawalPaymentMethodRepositoryImpl(this._service, this._dao);

  @override
  Future<Result<List<PaymentMethod>>> getPaymentMethods() async {
    try {
      // Try to get from API first
      final apiResult = await _service.getPaymentMethods();

      switch (apiResult) {
        case Ok(:final value):
          // Cache the results locally
          await _cachePaymentMethods(value);

          // Convert to domain models
          final domainModels = value
              .map((model) => PaymentMethod.fromModel(model))
              .toList();
          return Ok(domainModels);
        case Err():
          // Fallback to local cache
          return await _getPaymentMethodsFromCache();
      }
    } catch (e) {
      // Fallback to local cache on error
      return await _getPaymentMethodsFromCache();
    }
  }

  @override
  Future<Result<PaymentMethod>> getPaymentMethod(int id) async {
    try {
      // Try to get from API first
      final apiResult = await _service.getPaymentMethod(id);

      switch (apiResult) {
        case Ok(:final value):
          // Cache the result locally
          await _cachePaymentMethod(value);

          // Convert to domain model
          final domainModel = PaymentMethod.fromModel(value);
          return Ok(domainModel);
        case Err():
          // Fallback to local cache
          return await _getPaymentMethodFromCache(id);
      }
    } catch (e) {
      // Fallback to local cache on error
      return await _getPaymentMethodFromCache(id);
    }
  }

  @override
  Future<Result<PaymentMethod>> createPaymentMethod(
    PaymentMethod paymentMethod,
  ) async {
    try {
      // Convert to service model
      final serviceModel = paymentMethod.toModel();

      // Validate the payment method
      final validationResult = _service.validatePaymentMethod(serviceModel);
      if (validationResult case Err(:final error)) {
        return Err(error);
      }

      // Create via API
      final apiResult = await _service.createPaymentMethod(serviceModel);

      switch (apiResult) {
        case Ok(:final value):
          // Cache the result locally
          await _cachePaymentMethod(value);

          // Convert to domain model
          final domainModel = PaymentMethod.fromModel(value);
          return Ok(domainModel);
        case Err():
          return Err(apiResult.error);
      }
    } catch (e) {
      return Err('Network error: $e');
    }
  }

  @override
  Future<Result<PaymentMethod>> updatePaymentMethod(
    int id,
    PaymentMethod paymentMethod,
  ) async {
    try {
      // Convert to service model
      final serviceModel = paymentMethod.toModel();

      // Validate the payment method
      final validationResult = _service.validatePaymentMethod(serviceModel);
      if (validationResult case Err(:final error)) {
        return Err(error);
      }

      // Update via API
      final apiResult = await _service.updatePaymentMethod(id, serviceModel);

      switch (apiResult) {
        case Ok(:final value):
          // Update local cache
          await _cachePaymentMethod(value);

          // Convert to domain model
          final domainModel = PaymentMethod.fromModel(value);
          return Ok(domainModel);
        case Err():
          return Err(apiResult.error);
      }
    } catch (e) {
      return Err('Network error: $e');
    }
  }

  @override
  Future<Result<void>> deletePaymentMethod(int id) async {
    try {
      // Delete via API
      final apiResult = await _service.deletePaymentMethod(id);

      switch (apiResult) {
        case Ok():
          // Remove from local cache
          await _dao.deletePaymentMethod(id);
          return Ok(null);
        case Err():
          return Err(apiResult.error);
      }
    } catch (e) {
      return Err('Network error: $e');
    }
  }

  @override
  Future<Result<PaymentMethod>> setPrimaryPaymentMethod(int id) async {
    try {
      // Set primary via API
      final apiResult = await _service.setPrimaryPaymentMethod(id);

      switch (apiResult) {
        case Ok(:final value):
          // Update local cache
          await _cachePaymentMethod(value);

          // Convert to domain model
          final domainModel = PaymentMethod.fromModel(value);
          return Ok(domainModel);
        case Err():
          return Err(apiResult.error);
      }
    } catch (e) {
      return Err('Network error: $e');
    }
  }

  @override
  Future<Result<List<PaymentMethod>>> getActivePaymentMethods() async {
    try {
      // Get from local cache first (faster)
      final cachedResult = await _getActivePaymentMethodsFromCache();
      if (cachedResult case Ok(:final value)) {
        if (value.isNotEmpty) {
          return Ok(value);
        }
      }

      // If no cached data, try API
      return await getPaymentMethods();
    } catch (e) {
      return Err('Failed to get active payment methods: $e');
    }
  }

  @override
  Future<Result<PaymentMethod?>> getPrimaryPaymentMethod() async {
    try {
      // Get from local cache first
      final cachedResult = await _getPrimaryPaymentMethodFromCache();
      if (cachedResult case Ok(:final value)) {
        return Ok(value);
      }

      // If no cached data, try API
      final allMethodsResult = await getPaymentMethods();
      if (allMethodsResult case Ok(:final value)) {
        final primaryMethod = value
            .where((method) => method.isPrimary)
            .firstOrNull;
        return Ok(primaryMethod);
      } else {
        return Err('Failed to get payment methods');
      }
    } catch (e) {
      return Err('Failed to get primary payment method: $e');
    }
  }

  @override
  Future<Result<void>> clearPaymentMethods() async {
    try {
      // Clear local cache
      await _dao.clearPaymentMethods(
        0,
      ); // Assuming walletId = 0 for current user
      return Ok(null);
    } catch (e) {
      return Err('Failed to clear payment methods: $e');
    }
  }

  // Private helper methods

  Future<Result<List<PaymentMethod>>> _getPaymentMethodsFromCache() async {
    try {
      final items = await _dao.getPaymentMethods(
        0,
      ); // Assuming walletId = 0 for current user
      final models = items.map((item) => _dao.itemToModel(item)).toList();
      final domainModels = models
          .map((model) => PaymentMethod.fromModel(model))
          .toList();
      return Ok(domainModels);
    } catch (e) {
      return Err('Failed to get payment methods from cache: $e');
    }
  }

  Future<Result<PaymentMethod>> _getPaymentMethodFromCache(int id) async {
    try {
      final item = await _dao.getPaymentMethod(id);
      if (item == null) {
        return Err('Payment method not found');
      }
      final model = _dao.itemToModel(item);
      final domainModel = PaymentMethod.fromModel(model);
      return Ok(domainModel);
    } catch (e) {
      return Err('Failed to get payment method from cache: $e');
    }
  }

  Future<Result<List<PaymentMethod>>>
  _getActivePaymentMethodsFromCache() async {
    try {
      final items = await _dao.getActivePaymentMethods(
        0,
      ); // Assuming walletId = 0 for current user
      final models = items.map((item) => _dao.itemToModel(item)).toList();
      final domainModels = models
          .map((model) => PaymentMethod.fromModel(model))
          .toList();
      return Ok(domainModels);
    } catch (e) {
      return Err('Failed to get active payment methods from cache: $e');
    }
  }

  Future<Result<PaymentMethod?>> _getPrimaryPaymentMethodFromCache() async {
    try {
      final item = await _dao.getPrimaryPaymentMethod(
        0,
      ); // Assuming walletId = 0 for current user
      if (item == null) {
        return Ok(null);
      }
      final model = _dao.itemToModel(item);
      final domainModel = PaymentMethod.fromModel(model);
      return Ok(domainModel);
    } catch (e) {
      return Err('Failed to get primary payment method from cache: $e');
    }
  }

  Future<void> _cachePaymentMethods(
    List<PaymentMethodModel> paymentMethods,
  ) async {
    try {
      for (final paymentMethod in paymentMethods) {
        await _cachePaymentMethod(paymentMethod);
      }
    } catch (e) {
      // Log error but don't throw
      AppLogger.error('Failed to cache payment methods', error: e);
    }
  }

  Future<void> _cachePaymentMethod(PaymentMethodModel paymentMethod) async {
    try {
      final companion = _dao.modelToCompanion(paymentMethod);
      await _dao.insertPaymentMethod(companion);
    } catch (e) {
      // Log error but don't throw
      AppLogger.error('Failed to cache payment method', error: e);
    }
  }
}
