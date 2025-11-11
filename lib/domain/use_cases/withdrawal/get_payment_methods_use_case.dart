import 'package:poruaa_core/data/repositories/withdrawal/withdrawal_payment_method_repository.dart';
import 'package:poruaa_core/domain/models/withdrawal/payment_method.dart';
import 'package:poruaa_core/utils/result.dart';

/// Use case for getting payment methods
class GetPaymentMethodsUseCase {
  final WithdrawalPaymentMethodRepository _repository;

  GetPaymentMethodsUseCase(this._repository);

  /// Get all payment methods for the authenticated user
  Future<Result<List<PaymentMethod>>> call() async {
    try {
      return await _repository.getPaymentMethods();
    } catch (e) {
      return Err('Failed to get payment methods: $e');
    }
  }
}
