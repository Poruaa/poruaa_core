import 'package:poruaa_core/data/repositories/withdrawal/withdrawal_request_repository.dart';
import 'package:poruaa_core/domain/models/withdrawal/withdrawal_request.dart';
import 'package:poruaa_core/utils/result.dart';

/// Use case for getting withdrawal requests
class GetWithdrawalRequestsUseCase {
  final WithdrawalRequestRepository _repository;

  GetWithdrawalRequestsUseCase(this._repository);

  /// Get all withdrawal requests for the authenticated user
  Future<Result<List<WithdrawalRequest>>> call() async {
    try {
      return await _repository.getWithdrawalRequests();
    } catch (e) {
      return Err('Failed to get withdrawal requests: $e');
    }
  }
}
