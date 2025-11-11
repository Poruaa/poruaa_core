import 'package:poruaa_core/data/repositories/withdrawal/withdrawal_payment_method_repository.dart';
import 'package:poruaa_core/domain/models/withdrawal/payment_method.dart';
import 'package:poruaa_core/utils/result.dart';

/// Use case for setting primary payment method
class SetPrimaryPaymentMethodUseCase {
  final WithdrawalPaymentMethodRepository _repository;

  SetPrimaryPaymentMethodUseCase(this._repository);

  /// Set a payment method as primary
  Future<Result<PaymentMethod>> call(int id) async {
    try {
      return await _repository.setPrimaryPaymentMethod(id);
    } catch (e) {
      return Err('Failed to set primary payment method: $e');
    }
  }
}
