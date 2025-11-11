import 'dart:convert';

import 'package:poruaa_core/data/services/authorized_api/authorized_api_service.dart';
import 'package:poruaa_core/data/services/wallet/dto/payment_contact_info_dto.dart';
import 'package:poruaa_core/data/services/wallet/dto/payment_dto.dart';
import 'package:poruaa_core/data/services/wallet/dto/wallet_dto.dart';
import 'package:poruaa_core/domain/models/pagination/pagination_state.dart';
import 'package:poruaa_core/utils/result.dart';

class WalletService {
  final AuthorizedApiService _apiService;

  WalletService(this._apiService);

  Future<Result<WalletDto>> getWallet() async {
    try {
      var result = await _apiService.get("wallets/me");
      if (result case Ok()) {
      } else {
        return Result.error("Something went wrong");
      }
      var response = result.value;

      var statusCode = response.statusCode;
      if (statusCode != 200) {
        return Result.error("Something went wrong");
      }
      var jsonBody = response.body;
      var body = jsonDecode(jsonBody);
      var walletDto = WalletDto.fromJson(body);
      return Result.ok(walletDto);
    } catch (e) {
      return Result.error("$e");
    }
  }

  Future<Result<WalletDto>> transferMoneyToWithdrawal(double amount) async {
    try {
      var result = await _apiService.post(
        "wallets/me/withdraw",
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"amount": amount}),
      );
      if (result case Ok()) {
      } else {
        return Result.error("Something went wrong");
      }
      var response = result.value;

      var statusCode = response.statusCode;
      if (statusCode != 200) {
        return Result.error(response.body);
      }
      var jsonBody = response.body;
      var body = jsonDecode(jsonBody);
      var walletDto = WalletDto.fromJson(body);
      return Result.ok(walletDto);
    } catch (e) {
      return Result.error("Something went wrong");
    }
  }

  Future<Result<PaymentContactInfoDTO>> getPaymentContactInfo() async {
    try {
      var result = await _apiService.get("wallets/me/payment-contact-info");
      if (result case Ok()) {
      } else {
        return Result.error("Something went wrong");
      }
      var response = result.value;

      var statusCode = response.statusCode;
      if (statusCode != 200) {
        return Result.error("Something went wrong");
      }
      var jsonBody = response.body;
      var body = jsonDecode(jsonBody);
      var walletDto = PaymentContactInfoDTO.fromJson(body);
      return Result.ok(walletDto);
    } catch (e) {
      return Result.error("Something went wrong");
    }
  }

  Future<Result<PaymentContactInfoDTO>> addPaymentContactInfo(
    PaymentContactInfoDTO paymentContactInfo,
  ) async {
    try {
      var result = await _apiService.post(
        "wallets/me/payment-contact-info",
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(paymentContactInfo.toJson()),
      );
      if (result case Ok()) {
      } else {
        return Result.error("Something went wrong");
      }
      var response = result.value;

      var statusCode = response.statusCode;
      if (statusCode != 200) {
        return Result.error("Something went wrong");
      }
      var jsonBody = response.body;
      var body = jsonDecode(jsonBody);
      var walletDto = PaymentContactInfoDTO.fromJson(body);
      return Result.ok(walletDto);
    } catch (e) {
      return Result.error("Something went wrong");
    }
  }

  /// Get paginated payment history
  Future<Result<PaginatedResponse<PaymentDto>>> getMyPayments(
    PaginationParams params,
  ) async {
    try {
      final queryParams = params.toQueryParams();
      final queryString = queryParams.entries
          .map((e) => '${e.key}=${Uri.encodeComponent(e.value)}')
          .join('&');

      var result = await _apiService.get("payments?$queryString");
      if (result case Ok()) {
      } else {
        return Result.error("Something went wrong");
      }
      var response = result.value;

      var statusCode = response.statusCode;
      if (statusCode != 200) {
        return Result.error("Something went wrong");
      }
      var jsonBody = response.body;
      var body = jsonDecode(jsonBody);
      var paginatedResponse = PaginatedResponse<PaymentDto>.fromJson(
        body,
        (json) => PaymentDto.fromJson(json),
      );
      return Result.ok(paginatedResponse);
    } catch (e) {
      return Result.error("Something went wrong");
    }
  }

  /// Get payment by transaction ID
  Future<Result<PaymentDto>> getPaymentByTranId(String tranId) async {
    try {
      var result = await _apiService.get("payments/by-tran-id?tran_id=$tranId");
      if (result case Ok()) {
      } else {
        return Result.error("Something went wrong");
      }
      var response = result.value;

      var statusCode = response.statusCode;
      if (statusCode != 200) {
        return Result.error("Something went wrong");
      }
      var jsonBody = response.body;
      var body = jsonDecode(jsonBody);
      var paymentDto = PaymentDto.fromJson(body);
      return Result.ok(paymentDto);
    } catch (e) {
      return Result.error("Something went wrong");
    }
  }

  /// Recheck payment status
  Future<Result<String>> recheckPaymentStatus(int paymentId) async {
    try {
      var result = await _apiService.post(
        "payments/recheck",
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"payment_id": paymentId}),
      );
      if (result case Ok()) {
      } else {
        return Result.error("Network error");
      }
      var response = result.value;

      var statusCode = response.statusCode;
      if (statusCode == 200) {
        return Result.ok(response.body);
      } else if (statusCode == 404) {
        return Result.error(response.body);
      } else if (statusCode == 403) {
        return Result.error(response.body);
      } else if (statusCode == 400) {
        return Result.error(response.body);
      } else {
        return Result.error(response.body);
      }
    } catch (e) {
      return Result.error("Something went wrong: $e");
    }
  }
}
