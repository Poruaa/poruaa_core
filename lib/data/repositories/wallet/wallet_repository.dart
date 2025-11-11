import 'package:poruaa_core/data/services/payment/payment_service.dart';
import 'package:poruaa_core/data/services/wallet/wallet_service.dart';
import 'package:poruaa_core/domain/models/payment/payment.dart';
import 'package:poruaa_core/domain/models/payment_contact_info/payment_contact_info.dart';
import 'package:poruaa_core/domain/models/pagination/pagination_state.dart';
import 'package:poruaa_core/domain/models/wallet/wallet.dart';
import 'package:poruaa_core/utils/result.dart';

class WalletRepository {
  final WalletService _walletService;
  final PaymentService _paymentService;
  WalletRepository(this._walletService, this._paymentService);

  Future<Result<Wallet>> getWallet() async {
    var result = await _walletService.getWallet();

    return result.map((wallet) => Wallet.fromDTO(wallet));
  }

  Future<Result<String>> makePayment(double amount) async {
    var result = await _paymentService.makeKPayment(amount);
    return result;
  }

  Future<Result<Wallet>> transferMoneyToWithdraw(double amount) async {
    var result = await _walletService.transferMoneyToWithdrawal(amount);
    return result.map((wallet) => Wallet.fromDTO(wallet));
  }

  Future<Result<PaymentContactInfo>> getPaymentContactInfo() async {
    var result = await _walletService.getPaymentContactInfo();

    return result.map((wallet) => PaymentContactInfo.fromDTO(wallet));
  }

  Future<Result<PaymentContactInfo>> addPaymentContactInfo(
    PaymentContactInfo paymentContactInfo,
  ) async {
    var result = await _walletService.addPaymentContactInfo(
      paymentContactInfo.toDTO(),
    );

    return result.map((wallet) => PaymentContactInfo.fromDTO(wallet));
  }

  /// Get paginated payment history
  Future<Result<PaginatedResponse<Payment>>> getMyPayments(
    PaginationParams params,
  ) async {
    var result = await _walletService.getMyPayments(params);

    return result.map(
      (paginatedResponse) => PaginatedResponse<Payment>(
        items: paginatedResponse.items
            .map((dto) => Payment.fromJson(dto.toJson()))
            .toList(),
        nextCursor: paginatedResponse.nextCursor,
        hasMore: paginatedResponse.hasMore,
        total: paginatedResponse.total,
      ),
    );
  }

  /// Get payment by transaction ID
  Future<Result<Payment>> getPaymentByTranId(String tranId) async {
    var result = await _walletService.getPaymentByTranId(tranId);

    return result.map((paymentDto) => Payment.fromJson(paymentDto.toJson()));
  }
}
