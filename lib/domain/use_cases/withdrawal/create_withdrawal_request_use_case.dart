import 'package:poruaa_core/data/repositories/withdrawal/withdrawal_request_repository.dart';
import 'package:poruaa_core/domain/models/withdrawal/withdrawal_request.dart';
import 'package:poruaa_core/utils/result.dart';

/// Use case for creating withdrawal requests
class CreateWithdrawalRequestUseCase {
  final WithdrawalRequestRepository _repository;

  CreateWithdrawalRequestUseCase(this._repository);

  /// Create a new withdrawal request
  Future<Result<WithdrawalRequest>> call({
    required int paymentMethodId,
    required double amount,
  }) async {
    try {
      // Validate amount
      if (amount <= 0) {
        return Err('Amount must be greater than 0');
      }

      if (amount < 100) {
        return Err('Minimum withdrawal amount is 100 BDT');
      }

      if (amount > 100000) {
        return Err('Maximum withdrawal amount is 100,000 BDT');
      }

      return await _repository.createWithdrawalRequest(paymentMethodId, amount);
    } catch (e) {
      return Err('Failed to create withdrawal request: $e');
    }
  }
}
