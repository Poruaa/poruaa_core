/// API service model for payment methods
class PaymentMethodModel {
  final int id;
  final int walletId;
  final String methodType;
  final String methodName;
  final String? bankName;
  final String? accountNumber;
  final String? accountHolderName;
  final String? routingNumber;
  final String? branchName;
  final String? mobileBankingProvider;
  final String? mobileNumber;
  final String? accountType;
  final String? cashOutLocation;
  final String? cashOutContact;
  final bool isVerified;
  final bool isPrimary;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  PaymentMethodModel({
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

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    return PaymentMethodModel(
      id: json['id'],
      walletId: json['wallet_id'],
      methodType: json['method_type'],
      methodName: json['method_name'],
      bankName: json['bank_name'],
      accountNumber: json['account_number'],
      accountHolderName: json['account_holder_name'],
      routingNumber: json['routing_number'],
      branchName: json['branch_name'],
      mobileBankingProvider: json['mobile_banking_provider'],
      mobileNumber: json['mobile_number'],
      accountType: json['account_type'],
      cashOutLocation: json['cash_out_location'],
      cashOutContact: json['cash_out_contact'],
      isVerified: json['is_verified'] ?? false,
      isPrimary: json['is_primary'] ?? false,
      isActive: json['is_active'] ?? true,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  /// Create PaymentMethodModel from flattened WithdrawalRequestWithDetailsDTO
  factory PaymentMethodModel.fromWithdrawalRequestDetails(
      Map<String, dynamic> json) {
    return PaymentMethodModel(
      id: json['payment_method_id'] ?? 0, // Use payment_method_id as id
      walletId: json['wallet_id'] ?? 0,
      methodType: json['method_type'] ?? '',
      methodName: json['method_name'] ?? '',
      bankName: json['bank_name'],
      accountNumber: json['account_number'],
      accountHolderName: json['account_holder_name'],
      routingNumber: json['routing_number'],
      branchName: json['branch_name'],
      mobileBankingProvider: json['mobile_banking_provider'],
      mobileNumber: json['mobile_number'],
      accountType: json['account_type'],
      cashOutLocation: json['cash_out_location'],
      cashOutContact: json['cash_out_contact'],
      isVerified:
          false, // Default values since not provided in WithdrawalRequestWithDetailsDTO
      isPrimary: false,
      isActive: true,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'wallet_id': walletId,
      'method_type': methodType,
      'method_name': methodName,
      'bank_name': bankName,
      'account_number': accountNumber,
      'account_holder_name': accountHolderName,
      'routing_number': routingNumber,
      'branch_name': branchName,
      'mobile_banking_provider': mobileBankingProvider,
      'mobile_number': mobileNumber,
      'account_type': accountType,
      'cash_out_location': cashOutLocation,
      'cash_out_contact': cashOutContact,
      'is_verified': isVerified,
      'is_primary': isPrimary,
      'is_active': isActive,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  /// Create request payload for creating/updating payment methods
  Map<String, dynamic> toCreatePayload() {
    final payload = <String, dynamic>{
      'method_type': methodType,
      'method_name': methodName,
      'is_primary': isPrimary,
    };

    // Add fields based on method type
    switch (methodType) {
      case 'bank_account':
        if (bankName != null) payload['bank_name'] = bankName;
        if (accountNumber != null) payload['account_number'] = accountNumber;
        if (accountHolderName != null) {
          payload['account_holder_name'] = accountHolderName;
        }
        if (routingNumber != null) {
          payload['routing_number'] = routingNumber;
        }
        if (branchName != null) {
          payload['branch_name'] = branchName;
        }
        break;
      case 'mobile_banking':
        if (mobileBankingProvider != null) {
          payload['mobile_banking_provider'] = mobileBankingProvider;
        }
        if (mobileNumber != null) {
          payload['mobile_number'] = mobileNumber;
        }
        if (accountType != null) {
          payload['account_type'] = accountType;
        }
        break;
      case 'cash_out':
        if (cashOutLocation != null) {
          payload['cash_out_location'] = cashOutLocation;
        }
        if (cashOutContact != null) {
          payload['cash_out_contact'] = cashOutContact;
        }
        break;
    }

    return payload;
  }

  /// Create update payload (excludes method_type and id)
  Map<String, dynamic> toUpdatePayload() {
    final payload = <String, dynamic>{
      'method_name': methodName,
      'is_primary': isPrimary,
      'is_active': isActive,
    };

    // Add fields based on method type
    switch (methodType) {
      case 'bank_account':
        if (bankName != null) payload['bank_name'] = bankName;
        if (accountNumber != null) payload['account_number'] = accountNumber;
        if (accountHolderName != null) {
          payload['account_holder_name'] = accountHolderName;
        }
        if (routingNumber != null) {
          payload['routing_number'] = routingNumber;
        }
        if (branchName != null) {
          payload['branch_name'] = branchName;
        }
        break;
      case 'mobile_banking':
        if (mobileBankingProvider != null) {
          payload['mobile_banking_provider'] = mobileBankingProvider;
        }
        if (mobileNumber != null) {
          payload['mobile_number'] = mobileNumber;
        }
        if (accountType != null) {
          payload['account_type'] = accountType;
        }
        break;
      case 'cash_out':
        if (cashOutLocation != null) {
          payload['cash_out_location'] = cashOutLocation;
        }
        if (cashOutContact != null) {
          payload['cash_out_contact'] = cashOutContact;
        }
        break;
    }

    return payload;
  }

  PaymentMethodModel copyWith({
    int? id,
    int? walletId,
    String? methodType,
    String? methodName,
    String? bankName,
    String? accountNumber,
    String? accountHolderName,
    String? routingNumber,
    String? branchName,
    String? mobileBankingProvider,
    String? mobileNumber,
    String? accountType,
    String? cashOutLocation,
    String? cashOutContact,
    bool? isVerified,
    bool? isPrimary,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return PaymentMethodModel(
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

  @override
  String toString() {
    return 'PaymentMethodModel(id: $id, methodType: $methodType, methodName: $methodName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PaymentMethodModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
