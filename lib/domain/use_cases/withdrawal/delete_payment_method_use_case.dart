import 'package:poruaa_core/data/repositories/withdrawal/withdrawal_payment_method_repository.dart';
import 'package:poruaa_core/utils/result.dart';

/// Use case for deleting payment methods
class DeletePaymentMethodUseCase {
  final WithdrawalPaymentMethodRepository _repository;

  DeletePaymentMethodUseCase(this._repository);

  /// Delete a payment method
  Future<Result<void>> call(int id) async {
    try {
      return await _repository.deletePaymentMethod(id);
    } catch (e) {
      return Err('Failed to delete payment method: $e');
    }
  }
}
