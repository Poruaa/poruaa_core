import 'package:decimal/decimal.dart';
import 'package:poruaa_core/data/services/wallet/dto/wallet_dto.dart';

class Wallet {
  final int id;
  final Decimal balance;
  final Decimal withdrawal;
  final String currency;
  final Decimal investment;
  final Decimal pendingCharges;
  final Decimal freeCredit;
  final bool isPremium;

  Wallet({
    required this.id,
    required this.balance,
    required this.withdrawal,
    required this.currency,
    required this.investment,
    required this.pendingCharges,
    required this.freeCredit,
    required this.isPremium,
  });

  Wallet copyWith({
    int? id,
    Decimal? balance,
    Decimal? withdrawal,
    String? currency,
    Decimal? investment,
    Decimal? pendingCharges,
    Decimal? freeCredit,
    bool? isPremium,
  }) {
    return Wallet(
      id: id ?? this.id,
      balance: balance ?? this.balance,
      withdrawal: withdrawal ?? this.withdrawal,
      currency: currency ?? this.currency,
      investment: investment ?? this.investment,
      pendingCharges: pendingCharges ?? this.pendingCharges,
      freeCredit: freeCredit ?? this.freeCredit,
      isPremium: isPremium ?? this.isPremium,
    );
  }

  factory Wallet.fromDTO(WalletDto dto) {
    return Wallet(
      id: dto.id,
      balance: dto.balance,
      withdrawal: dto.withdrawal,
      currency: dto.currency,
      investment: dto.investment,
      pendingCharges: dto.pendingCharges,
      freeCredit: dto.freeCredit,
      isPremium: dto.isPremium,
    );
  }

  WalletDto toDTO() {
    return WalletDto(
      id: id,
      balance: balance,
      withdrawal: withdrawal,
      currency: currency,
      investment: investment,
      pendingCharges: pendingCharges,
      freeCredit: freeCredit,
      isPremium: isPremium,
    );
  }
}
