import 'package:decimal/decimal.dart';

class WalletDto {
  final int id;
  final Decimal balance;
  final String currency;
  final Decimal withdrawal;
  final Decimal investment;
  final Decimal pendingCharges;
  final Decimal freeCredit;
  final bool isPremium;

  WalletDto({
    required this.id,
    required this.balance,
    required this.currency,
    required this.withdrawal,
    required this.investment,
    required this.pendingCharges,
    required this.freeCredit,
    required this.isPremium,
  });

  factory WalletDto.fromJson(Map<String, dynamic> json) {
    return WalletDto(
      id: json['id'],
      balance: Decimal.parse(json['balance']),
      currency: json['currency'],
      withdrawal: Decimal.parse(json['withdrawal']),
      investment: Decimal.parse(json['investment']),
      pendingCharges: Decimal.parse(json['pending_charges']),
      freeCredit: Decimal.parse(json['free_credit']),
      isPremium: json['is_premium'],
    );
  }
}
