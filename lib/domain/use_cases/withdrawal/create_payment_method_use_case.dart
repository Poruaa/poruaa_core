import 'package:poruaa_core/data/repositories/withdrawal/withdrawal_payment_method_repository.dart';
import 'package:poruaa_core/domain/models/withdrawal/payment_method.dart';
import 'package:poruaa_core/utils/result.dart';

/// Use case for creating payment methods
class CreatePaymentMethodUseCase {
  final WithdrawalPaymentMethodRepository _repository;

  CreatePaymentMethodUseCase(this._repository);

  /// Create a new payment method
  Future<Result<PaymentMethod>> call({
    required PaymentMethodType methodType,
    required String methodName,
    String? bankName,
    String? accountNumber,
    String? accountHolderName,
    String? routingNumber,
    String? branchName,
    MobileBankingProvider? mobileBankingProvider,
    String? mobileNumber,
    AccountType? accountType,
    String? cashOutLocation,
    String? cashOutContact,
    bool isPrimary = false,
  }) async {
    try {
      // Create the payment method
      final paymentMethod = PaymentMethod(
        id: 0, // Will be set by the server
        walletId: 0, // Will be set by the server
        methodType: methodType,
        methodName: methodName,
        bankName: bankName,
        accountNumber: accountNumber,
        accountHolderName: accountHolderName,
        routingNumber: routingNumber,
        branchName: branchName,
        mobileBankingProvider: mobileBankingProvider,
        mobileNumber: mobileNumber,
        accountType: accountType,
        cashOutLocation: cashOutLocation,
        cashOutContact: cashOutContact,
        isVerified: false,
        isPrimary: isPrimary,
        isActive: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      return await _repository.createPaymentMethod(paymentMethod);
    } catch (e) {
      return Err('Failed to create payment method: $e');
    }
  }
}
