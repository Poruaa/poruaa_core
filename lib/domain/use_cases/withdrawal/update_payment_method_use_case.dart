import 'package:poruaa_core/data/repositories/withdrawal/withdrawal_payment_method_repository.dart';
import 'package:poruaa_core/domain/models/withdrawal/payment_method.dart';
import 'package:poruaa_core/utils/result.dart';

/// Use case for updating payment methods
class UpdatePaymentMethodUseCase {
  final WithdrawalPaymentMethodRepository _repository;

  UpdatePaymentMethodUseCase(this._repository);

  /// Update an existing payment method
  Future<Result<PaymentMethod>> call({
    required int id,
    required String methodName,
    String? bankName,
    String? accountNumber,
    String? accountHolderName,
    String? routingNumber,
    String? branchName,
    String? mobileNumber,
    String? cashOutLocation,
    String? cashOutContact,
    bool isPrimary = false,
    bool isActive = true,
  }) async {
    try {
      // First get the existing payment method to preserve some fields
      final existingResult = await _repository.getPaymentMethod(id);
      if (existingResult case Ok(:final value)) {
        // Create updated payment method
        final updatedPaymentMethod = value.copyWith(
          methodName: methodName,
          bankName: bankName,
          accountNumber: accountNumber,
          accountHolderName: accountHolderName,
          routingNumber: routingNumber,
          branchName: branchName,
          mobileNumber: mobileNumber,
          cashOutLocation: cashOutLocation,
          cashOutContact: cashOutContact,
          isPrimary: isPrimary,
          isActive: isActive,
          updatedAt: DateTime.now(),
        );

        return await _repository.updatePaymentMethod(id, updatedPaymentMethod);
      } else {
        return Err('Failed to get existing payment method');
      }
    } catch (e) {
      return Err('Failed to update payment method: $e');
    }
  }
}
