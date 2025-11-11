import 'package:poruaa_core/data/repositories/withdrawal/withdrawal_request_repository.dart';
import 'package:poruaa_core/utils/result.dart';

/// Use case for checking pending withdrawal requests
class CheckPendingWithdrawalRequestUseCase {
  final WithdrawalRequestRepository _repository;

  CheckPendingWithdrawalRequestUseCase(this._repository);

  /// Check if user has pending withdrawal request
  Future<Result<bool>> call() async {
    try {
      return await _repository.hasPendingWithdrawalRequest();
    } catch (e) {
      return Err('Failed to check pending withdrawal request: $e');
    }
  }
}
