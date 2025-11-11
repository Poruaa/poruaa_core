import 'dart:convert';
import 'package:poruaa_core/data/services/authorized_api/authorized_api_service.dart';
import 'package:poruaa_core/data/services/wallet/model/withdrawal_request_model.dart';
import 'package:poruaa_core/utils/result.dart';

/// Service for managing withdrawal requests
class WithdrawalRequestService {
  final AuthorizedApiService _apiService;

  WithdrawalRequestService(this._apiService);

  /// Get all withdrawal requests for the authenticated user
  Future<Result<List<WithdrawalRequestModel>>> getWithdrawalRequests() async {
    try {
      final result = await _apiService.get('wallets/me/withdrawal-requests');

      switch (result) {
        case Ok():
          final response = result.value;
          final body = response.body;
          final jsonBody = jsonDecode(body);

          // Handle direct array response (no wrapper object)
          if (jsonBody is List) {
            final withdrawalRequests = jsonBody
                .map((json) => WithdrawalRequestModel.fromJson(json))
                .toList();
            return Ok(withdrawalRequests);
          }
          // Handle wrapped response with success field
          else if (jsonBody['success'] == true) {
            final List<dynamic> data = jsonBody['data'] ?? [];
            final withdrawalRequests = data
                .map((json) => WithdrawalRequestModel.fromJson(json))
                .toList();
            return Ok(withdrawalRequests);
          } else {
            final error = jsonBody['error'];
            final errorMessage = error is String
                ? error
                : error?.toString() ?? 'Failed to fetch withdrawal requests';
            return Err(errorMessage);
          }
        case Err():
          return Err('Network error: ${result.error}');
      }
    } catch (e) {
      return Err('Network error: $e');
    }
  }

  /// Get a specific withdrawal request by ID
  Future<Result<WithdrawalRequestModel>> getWithdrawalRequest(int id) async {
    try {
      final result = await _apiService.get(
        'wallets/me/withdrawal-requests/$id',
      );

      switch (result) {
        case Ok():
          final response = result.value;
          final body = response.body;
          final jsonBody = jsonDecode(body);

          if (jsonBody['success'] == true) {
            final withdrawalRequest = WithdrawalRequestModel.fromJson(
              jsonBody['data'],
            );
            return Ok(withdrawalRequest);
          } else {
            return Err(
              jsonBody['error'] ?? 'Failed to fetch withdrawal request',
            );
          }
        case Err():
          return Err('Network error: ${result.error}');
      }
    } catch (e) {
      return Err('Network error: $e');
    }
  }

  /// Create a new withdrawal request
  Future<Result<WithdrawalRequestModel>> createWithdrawalRequest(
    int paymentMethodId,
    double amount,
  ) async {
    try {
      final payload = {
        'payment_method_id': paymentMethodId,
        'amount': amount.toString(),
      };

      final result = await _apiService.post(
        'wallets/me/withdrawal-requests',
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(payload),
      );

      switch (result) {
        case Ok():
          final response = result.value;
          final body = response.body;

          // Handle 201 Created (typical for POST operations)
          if (response.statusCode == 201) {
            try {
              final jsonBody = jsonDecode(body);
              // Try to get data from different possible locations
              final data = jsonBody['data'] ?? jsonBody;
              final withdrawalRequest = WithdrawalRequestModel.fromJson(data);
              return Ok(withdrawalRequest);
            } catch (jsonError) {
              // If JSON parsing fails but we have 201 status, try to parse the body directly
              try {
                final withdrawalRequest = WithdrawalRequestModel.fromJson(
                  jsonDecode(body),
                );
                return Ok(withdrawalRequest);
              } catch (e) {
                return Err('Failed to parse withdrawal request response');
              }
            }
          }

          // Handle other success status codes
          if (response.statusCode >= 200 && response.statusCode < 300) {
            try {
              final jsonBody = jsonDecode(body);
              if (jsonBody['success'] == true) {
                final withdrawalRequest = WithdrawalRequestModel.fromJson(
                  jsonBody['data'],
                );
                return Ok(withdrawalRequest);
              } else {
                final error = jsonBody['error'];
                final errorMessage = error is String
                    ? error
                    : error?.toString() ??
                          'Failed to create withdrawal request';
                return Err(errorMessage);
              }
            } catch (jsonError) {
              return Err(
                'Failed to create withdrawal request: ${response.statusCode}',
              );
            }
          } else {
            return Err(
              'Failed to create withdrawal request: ${response.statusCode}',
            );
          }
        case Err():
          return Err('Network error: ${result.error}');
      }
    } catch (e) {
      return Err('Network error: $e');
    }
  }

  /// Check if user has pending withdrawal request
  Future<Result<bool>> hasPendingWithdrawalRequest() async {
    try {
      final result = await _apiService.get(
        'wallets/me/withdrawal-requests/pending',
      );

      switch (result) {
        case Ok():
          final response = result.value;
          final body = response.body;
          final jsonBody = jsonDecode(body);

          if (jsonBody['success'] == true) {
            final hasPending = jsonBody['data']['has_pending'] ?? false;
            return Ok(hasPending);
          } else {
            return Err(
              jsonBody['error'] ?? 'Failed to check pending withdrawal request',
            );
          }
        case Err():
          return Err('Network error: ${result.error}');
      }
    } catch (e) {
      return Err('Network error: $e');
    }
  }

  /// Get withdrawal request history with pagination
  Future<Result<Map<String, dynamic>>> getWithdrawalRequestHistory({
    int page = 1,
    int limit = 10,
    String? status,
  }) async {
    try {
      final queryParams = <String, String>{
        'page': page.toString(),
        'limit': limit.toString(),
      };

      if (status != null) {
        queryParams['status'] = status;
      }

      final result = await _apiService.get(
        'wallets/me/withdrawal-requests/history',
      );

      switch (result) {
        case Ok():
          final response = result.value;
          final body = response.body;
          final jsonBody = jsonDecode(body);

          if (jsonBody['success'] == true) {
            return Ok(jsonBody['data']);
          } else {
            return Err(
              jsonBody['error'] ?? 'Failed to fetch withdrawal request history',
            );
          }
        case Err():
          return Err('Network error: ${result.error}');
      }
    } catch (e) {
      return Err('Network error: $e');
    }
  }

  /// Validate withdrawal request data before submission
  Result<void> validateWithdrawalRequest(int paymentMethodId, double amount) {
    if (paymentMethodId <= 0) {
      return Err('Invalid payment method');
    }

    if (amount <= 0) {
      return Err('Amount must be greater than 0');
    }

    if (amount < 100) {
      return Err('Minimum withdrawal amount is 100 BDT');
    }

    if (amount > 100000) {
      return Err('Maximum withdrawal amount is 100,000 BDT');
    }

    return Ok(null);
  }

  /// Get withdrawal request status display names
  Map<String, String> getStatusDisplayNames() {
    return {
      'pending': 'Pending',
      'approved': 'Approved',
      'rejected': 'Rejected',
      'processing': 'Processing',
      'completed': 'Completed',
      'failed': 'Failed',
    };
  }

  /// Get withdrawal request status colors
  Map<String, String> getStatusColors() {
    return {
      'pending': '#FFA500', // Orange
      'approved': '#32CD32', // Green
      'rejected': '#FF0000', // Red
      'processing': '#1E90FF', // Blue
      'completed': '#008000', // Dark Green
      'failed': '#DC143C', // Crimson
    };
  }

  /// Check if status allows user actions
  bool isStatusUserActionable(String status) {
    switch (status) {
      case 'pending':
        return true; // Can be cancelled (if implemented)
      case 'approved':
      case 'rejected':
      case 'processing':
      case 'completed':
      case 'failed':
        return false;
      default:
        return false;
    }
  }

  /// Check if status is final (no further changes expected)
  bool isStatusFinal(String status) {
    switch (status) {
      case 'completed':
      case 'failed':
      case 'rejected':
        return true;
      case 'pending':
      case 'approved':
      case 'processing':
        return false;
      default:
        return false;
    }
  }
}
