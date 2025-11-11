import 'package:poruaa_core/data/services/wallet/model/payment_method_model.dart';

/// Domain model for withdrawal payment methods
class PaymentMethod {
  final int id;
  final int walletId;
  final PaymentMethodType methodType;
  final String methodName;
  final String? bankName;
  final String? accountNumber;
  final String? accountHolderName;
  final String? routingNumber;
  final String? branchName;
  final MobileBankingProvider? mobileBankingProvider;
  final String? mobileNumber;
  final AccountType? accountType;
  final String? cashOutLocation;
  final String? cashOutContact;
  final bool isVerified;
  final bool isPrimary;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  PaymentMethod({
    required this.id,
    required this.walletId,
    required this.methodType,
    required this.methodName,
    this.bankName,
    this.accountNumber,
    this.accountHolderName,
    this.routingNumber,
    this.branchName,
    this.mobileBankingProvider,
    this.mobileNumber,
    this.accountType,
    this.cashOutLocation,
    this.cashOutContact,
    required this.isVerified,
    required this.isPrimary,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PaymentMethod.fromModel(PaymentMethodModel model) {
    return PaymentMethod(
      id: model.id,
      walletId: model.walletId,
      methodType: PaymentMethodType.fromString(model.methodType),
      methodName: model.methodName,
      bankName: model.bankName,
      accountNumber: model.accountNumber,
      accountHolderName: model.accountHolderName,
      routingNumber: model.routingNumber,
      branchName: model.branchName,
      mobileBankingProvider: model.mobileBankingProvider != null
          ? MobileBankingProvider.fromString(model.mobileBankingProvider!)
          : null,
      mobileNumber: model.mobileNumber,
      accountType: model.accountType != null
          ? AccountType.fromString(model.accountType!)
          : null,
      cashOutLocation: model.cashOutLocation,
      cashOutContact: model.cashOutContact,
      isVerified: model.isVerified,
      isPrimary: model.isPrimary,
      isActive: model.isActive,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  PaymentMethodModel toModel() {
    return PaymentMethodModel(
      id: id,
      walletId: walletId,
      methodType: methodType.value,
      methodName: methodName,
      bankName: bankName,
      accountNumber: accountNumber,
      accountHolderName: accountHolderName,
      routingNumber: routingNumber,
      branchName: branchName,
      mobileBankingProvider: mobileBankingProvider?.value,
      mobileNumber: mobileNumber,
      accountType: accountType?.value,
      cashOutLocation: cashOutLocation,
      cashOutContact: cashOutContact,
      isVerified: isVerified,
      isPrimary: isPrimary,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  PaymentMethod copyWith({
    int? id,
    int? walletId,
    PaymentMethodType? methodType,
    String? methodName,
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
    bool? isVerified,
    bool? isPrimary,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return PaymentMethod(
      id: id ?? this.id,
      walletId: walletId ?? this.walletId,
      methodType: methodType ?? this.methodType,
      methodName: methodName ?? this.methodName,
      bankName: bankName ?? this.bankName,
      accountNumber: accountNumber ?? this.accountNumber,
      accountHolderName: accountHolderName ?? this.accountHolderName,
      routingNumber: routingNumber ?? this.routingNumber,
      branchName: branchName ?? this.branchName,
      mobileBankingProvider:
          mobileBankingProvider ?? this.mobileBankingProvider,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      accountType: accountType ?? this.accountType,
      cashOutLocation: cashOutLocation ?? this.cashOutLocation,
      cashOutContact: cashOutContact ?? this.cashOutContact,
      isVerified: isVerified ?? this.isVerified,
      isPrimary: isPrimary ?? this.isPrimary,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'wallet_id': walletId,
      'method_type': methodType.value,
      'method_name': methodName,
      'bank_name': bankName,
      'account_number': accountNumber,
      'account_holder_name': accountHolderName,
      'routing_number': routingNumber,
      'branch_name': branchName,
      'mobile_banking_provider': mobileBankingProvider?.value,
      'mobile_number': mobileNumber,
      'account_type': accountType?.value,
      'cash_out_location': cashOutLocation,
      'cash_out_contact': cashOutContact,
      'is_verified': isVerified,
      'is_primary': isPrimary,
      'is_active': isActive,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
      id: json['id'],
      walletId: json['wallet_id'],
      methodType: PaymentMethodType.fromString(json['method_type']),
      methodName: json['method_name'],
      bankName: json['bank_name'],
      accountNumber: json['account_number'],
      accountHolderName: json['account_holder_name'],
      routingNumber: json['routing_number'],
      branchName: json['branch_name'],
      mobileBankingProvider: json['mobile_banking_provider'] != null
          ? MobileBankingProvider.fromString(json['mobile_banking_provider'])
          : null,
      mobileNumber: json['mobile_number'],
      accountType: json['account_type'] != null
          ? AccountType.fromString(json['account_type'])
          : null,
      cashOutLocation: json['cash_out_location'],
      cashOutContact: json['cash_out_contact'],
      isVerified: json['is_verified'] ?? false,
      isPrimary: json['is_primary'] ?? false,
      isActive: json['is_active'] ?? true,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  @override
  String toString() {
    return 'PaymentMethod(id: $id, methodType: $methodType, methodName: $methodName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PaymentMethod && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

/// Payment method types
enum PaymentMethodType {
  bankAccount('bank_account'),
  mobileBanking('mobile_banking'),
  cashOut('cash_out');

  const PaymentMethodType(this.value);
  final String value;

  static PaymentMethodType fromString(String value) {
    switch (value) {
      case 'bank_account':
        return PaymentMethodType.bankAccount;
      case 'mobile_banking':
        return PaymentMethodType.mobileBanking;
      case 'cash_out':
        return PaymentMethodType.cashOut;
      default:
        throw ArgumentError('Invalid payment method type: $value');
    }
  }

  String get displayName {
    switch (this) {
      case PaymentMethodType.bankAccount:
        return 'Bank Account';
      case PaymentMethodType.mobileBanking:
        return 'Mobile Banking';
      case PaymentMethodType.cashOut:
        return 'Cash Out';
    }
  }
}

/// Mobile banking providers
enum MobileBankingProvider {
  bkash('bkash');

  const MobileBankingProvider(this.value);
  final String value;

  static MobileBankingProvider fromString(String value) {
    switch (value) {
      case 'bkash':
        return MobileBankingProvider.bkash;
      default:
        throw ArgumentError('Invalid mobile banking provider: $value');
    }
  }

  String get displayName {
    switch (this) {
      case MobileBankingProvider.bkash:
        return 'bKash';
    }
  }
}

/// Account types for mobile banking
enum AccountType {
  personal('personal'),
  merchant('merchant');

  const AccountType(this.value);
  final String value;

  static AccountType fromString(String value) {
    switch (value) {
      case 'personal':
        return AccountType.personal;
      case 'merchant':
        return AccountType.merchant;
      default:
        throw ArgumentError('Invalid account type: $value');
    }
  }

  String get displayName {
    switch (this) {
      case AccountType.personal:
        return 'Personal';
      case AccountType.merchant:
        return 'Merchant';
    }
  }
}
