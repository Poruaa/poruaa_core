import 'dart:convert';
import 'package:poruaa_core/data/services/authorized_api/authorized_api_service.dart';
import 'package:poruaa_core/data/services/wallet/model/payment_method_model.dart';
import 'package:poruaa_core/utils/result.dart';

/// Service for managing withdrawal payment methods
class WithdrawalPaymentMethodService {
  final AuthorizedApiService _apiService;

  WithdrawalPaymentMethodService(this._apiService);

  /// Get all payment methods for the authenticated user
  Future<Result<List<PaymentMethodModel>>> getPaymentMethods() async {
    try {
      final result = await _apiService.get('wallets/me/payment-methods');

      switch (result) {
        case Ok():
          final response = result.value;
          final body = response.body;
          final jsonBody = jsonDecode(body);

          // Handle direct array response (no wrapper object)
          if (jsonBody is List) {
            final paymentMethods = jsonBody
                .map((json) => PaymentMethodModel.fromJson(json))
                .toList();
            return Ok(paymentMethods);
          }
          // Handle wrapped response with success field
          else if (jsonBody['success'] == true) {
            final List<dynamic> data = jsonBody['data'] ?? [];
            final paymentMethods = data
                .map((json) => PaymentMethodModel.fromJson(json))
                .toList();
            return Ok(paymentMethods);
          } else {
            final error = jsonBody['error'];
            final errorMessage = error is String
                ? error
                : error?.toString() ?? 'Failed to fetch payment methods';
            return Err(errorMessage);
          }
        case Err():
          return Err('Network error: ${result.error}');
      }
    } catch (e) {
      return Err('Network error: $e');
    }
  }

  /// Get a specific payment method by ID
  Future<Result<PaymentMethodModel>> getPaymentMethod(int id) async {
    try {
      final result = await _apiService.get('wallets/me/payment-methods/$id');

      switch (result) {
        case Ok():
          final response = result.value;
          final body = response.body;
          final jsonBody = jsonDecode(body);

          if (jsonBody['success'] == true) {
            final paymentMethod = PaymentMethodModel.fromJson(jsonBody['data']);
            return Ok(paymentMethod);
          } else {
            final error = jsonBody['error'];
            final errorMessage = error is String
                ? error
                : error?.toString() ?? 'Failed to fetch payment method';
            return Err(errorMessage);
          }
        case Err():
          return Err('Network error: ${result.error}');
      }
    } catch (e) {
      return Err('Network error: $e');
    }
  }

  /// Create a new payment method
  Future<Result<PaymentMethodModel>> createPaymentMethod(
    PaymentMethodModel paymentMethod,
  ) async {
    try {
      final payload = paymentMethod.toCreatePayload();
      final result = await _apiService.post(
        'wallets/me/payment-methods',
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(payload),
      );

      switch (result) {
        case Ok():
          final response = result.value;
          final body = response.body;
          final jsonBody = jsonDecode(body);

          // Check for success either by status code or success field
          if (response.statusCode == 201 || jsonBody['success'] == true) {
            // Try to get data from different possible locations
            final data = jsonBody['data'] ?? jsonBody;
            final createdPaymentMethod = PaymentMethodModel.fromJson(data);
            return Ok(createdPaymentMethod);
          } else {
            final error = jsonBody['error'];
            final errorMessage = error is String
                ? error
                : error?.toString() ?? 'Failed to create payment method';
            return Err(errorMessage);
          }
        case Err():
          return Err('Network error: ${result.error}');
      }
    } catch (e) {
      return Err('Network error: $e');
    }
  }

  /// Update an existing payment method
  Future<Result<PaymentMethodModel>> updatePaymentMethod(
    int id,
    PaymentMethodModel paymentMethod,
  ) async {
    try {
      final payload = paymentMethod.toUpdatePayload();
      final result = await _apiService.put(
        'wallets/me/payment-methods/$id',
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(payload),
      );

      switch (result) {
        case Ok():
          final response = result.value;
          final body = response.body;

          // Handle 200 OK (typical for PUT operations)
          if (response.statusCode == 200) {
            try {
              final jsonBody = jsonDecode(body);
              // Try to get data from different possible locations
              final data = jsonBody['data'] ?? jsonBody;
              final updatedPaymentMethod = PaymentMethodModel.fromJson(data);
              return Ok(updatedPaymentMethod);
            } catch (jsonError) {
              // If JSON parsing fails but we have 200 status, try to parse the body directly
              try {
                final updatedPaymentMethod = PaymentMethodModel.fromJson(
                  jsonDecode(body),
                );
                return Ok(updatedPaymentMethod);
              } catch (e) {
                return Err('Failed to parse update response');
              }
            }
          }

          // Handle other success status codes
          if (response.statusCode >= 200 && response.statusCode < 300) {
            try {
              final jsonBody = jsonDecode(body);
              if (jsonBody['success'] == true) {
                final updatedPaymentMethod = PaymentMethodModel.fromJson(
                  jsonBody['data'],
                );
                return Ok(updatedPaymentMethod);
              } else {
                final error = jsonBody['error'];
                final errorMessage = error is String
                    ? error
                    : error?.toString() ?? 'Failed to update payment method';
                return Err(errorMessage);
              }
            } catch (jsonError) {
              return Err(
                'Failed to update payment method: ${response.statusCode}',
              );
            }
          } else {
            return Err(
              'Failed to update payment method: ${response.statusCode}',
            );
          }
        case Err():
          return Err('Network error: ${result.error}');
      }
    } catch (e) {
      return Err('Network error: $e');
    }
  }

  /// Delete a payment method
  Future<Result<void>> deletePaymentMethod(int id) async {
    try {
      final result = await _apiService.delete('wallets/me/payment-methods/$id');

      switch (result) {
        case Ok():
          final response = result.value;
          final body = response.body;

          // Handle 204 No Content (typical for DELETE operations)
          if (response.statusCode == 204) {
            return Ok(null);
          }

          // Handle empty body (also common for DELETE)
          if (body.isEmpty) {
            return Ok(null);
          }

          // Try to parse JSON response
          try {
            final jsonBody = jsonDecode(body);
            if (jsonBody['success'] == true) {
              return Ok(null);
            } else {
              final error = jsonBody['error'];
              final errorMessage = error is String
                  ? error
                  : error?.toString() ?? 'Failed to delete payment method';
              return Err(errorMessage);
            }
          } catch (jsonError) {
            // If JSON parsing fails but we have a 2xx status code, consider it successful
            if (response.statusCode >= 200 && response.statusCode < 300) {
              return Ok(null);
            } else {
              return Err(
                'Failed to delete payment method: ${response.statusCode}',
              );
            }
          }
        case Err():
          return Err('Network error: ${result.error}');
      }
    } catch (e) {
      return Err('Network error: $e');
    }
  }

  /// Set a payment method as primary
  Future<Result<PaymentMethodModel>> setPrimaryPaymentMethod(int id) async {
    try {
      final result = await _apiService.patch(
        'wallets/me/payment-methods/$id/set-primary',
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({}),
      );

      switch (result) {
        case Ok():
          final response = result.value;
          final body = response.body;
          final jsonBody = jsonDecode(body);
          final statusCode = response.statusCode;

          if (statusCode == 200) {
            final paymentMethod = PaymentMethodModel.fromJson(jsonBody);
            return Ok(paymentMethod);
          } else {
            return Err(
              (jsonBody['error'] is String
                      ? jsonBody['error']
                      : jsonBody['error']?.toString()) ??
                  'Failed to set primary payment method',
            );
          }
        case Err():
          return Err('Network error: ${result.error}');
      }
    } catch (e) {
      return Err('Network error: $e');
    }
  }

  /// Validate payment method data before submission
  Result<void> validatePaymentMethod(PaymentMethodModel paymentMethod) {
    if (paymentMethod.methodName.trim().isEmpty) {
      return Err('Method name is required');
    }

    switch (paymentMethod.methodType) {
      case 'bank_account':
        if (paymentMethod.bankName?.trim().isEmpty ?? true) {
          return Err('Bank name is required for bank account');
        }
        if (paymentMethod.accountNumber?.trim().isEmpty ?? true) {
          return Err('Account number is required for bank account');
        }
        if (paymentMethod.accountHolderName?.trim().isEmpty ?? true) {
          return Err('Account holder name is required for bank account');
        }
        break;
      case 'mobile_banking':
        if (paymentMethod.mobileBankingProvider?.trim().isEmpty ?? true) {
          return Err('Mobile banking provider is required');
        }
        if (paymentMethod.mobileNumber?.trim().isEmpty ?? true) {
          return Err('Mobile number is required for mobile banking');
        }
        if (paymentMethod.accountType?.trim().isEmpty ?? true) {
          return Err('Account type is required for mobile banking');
        }
        break;
      case 'cash_out':
        if (paymentMethod.cashOutLocation?.trim().isEmpty ?? true) {
          return Err('Cash out location is required');
        }
        if (paymentMethod.cashOutContact?.trim().isEmpty ?? true) {
          return Err('Cash out contact is required');
        }
        break;
      default:
        return Err('Invalid payment method type');
    }

    return Ok(null);
  }

  /// Get available mobile banking providers
  List<String> getMobileBankingProviders() {
    return ['bkash', 'nagad', 'rocket', 'upay', 'tap', 'mcash'];
  }

  /// Get available account types
  List<String> getAccountTypes() {
    return ['personal', 'merchant'];
  }

  /// Get payment method type display names
  Map<String, String> getPaymentMethodTypeNames() {
    return {
      'bank_account': 'Bank Account',
      'mobile_banking': 'Mobile Banking',
      'cash_out': 'Cash Out',
    };
  }
}
