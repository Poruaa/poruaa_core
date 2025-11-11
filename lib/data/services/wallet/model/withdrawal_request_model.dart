import 'package:poruaa_core/data/services/wallet/model/payment_method_model.dart';

/// API service model for withdrawal requests
class WithdrawalRequestModel {
  final int id;
  final int walletId;
  final int paymentMethodId;
  final double amount;
  final String status;
  final String? adminNotes;
  final int? processedBy;
  final DateTime? processedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  // Payment method details (populated when fetching with details)
  final PaymentMethodModel? paymentMethod;

  WithdrawalRequestModel({
    required this.id,
    required this.walletId,
    required this.paymentMethodId,
    required this.amount,
    required this.status,
    this.adminNotes,
    this.processedBy,
    this.processedAt,
    required this.createdAt,
    required this.updatedAt,
    this.paymentMethod,
  });

  factory WithdrawalRequestModel.fromJson(Map<String, dynamic> json) {
    // Handle WithdrawalRequestWithDetailsDTO (flattened payment method details)
    PaymentMethodModel? paymentMethod;

    // Check if payment method details are flattened in the response
    if (json.containsKey('method_type') || json.containsKey('method_name')) {
      paymentMethod = PaymentMethodModel.fromWithdrawalRequestDetails(json);
    } else if (json['payment_method'] != null) {
      // Handle nested payment_method object (legacy format)
      paymentMethod = PaymentMethodModel.fromJson(json['payment_method']);
    }

    return WithdrawalRequestModel(
      id: json['id'],
      walletId: json['wallet_id'],
      paymentMethodId: json['payment_method_id'],
      amount: double.parse(json['amount'].toString()),
      status: json['status'],
      adminNotes: json['admin_notes'],
      processedBy: json['processed_by'],
      processedAt: json['processed_at'] != null
          ? DateTime.parse(json['processed_at'])
          : null,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      paymentMethod: paymentMethod,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'wallet_id': walletId,
      'payment_method_id': paymentMethodId,
      'amount': amount.toString(),
      'status': status,
      'admin_notes': adminNotes,
      'processed_by': processedBy,
      'processed_at': processedAt?.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      if (paymentMethod != null) 'payment_method': paymentMethod!.toJson(),
    };
  }

  /// Create request payload for creating withdrawal requests
  Map<String, dynamic> toCreatePayload() {
    return {'payment_method_id': paymentMethodId, 'amount': amount.toString()};
  }

  WithdrawalRequestModel copyWith({
    int? id,
    int? walletId,
    int? paymentMethodId,
    double? amount,
    String? status,
    String? adminNotes,
    int? processedBy,
    DateTime? processedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    PaymentMethodModel? paymentMethod,
  }) {
    return WithdrawalRequestModel(
      id: id ?? this.id,
      walletId: walletId ?? this.walletId,
      paymentMethodId: paymentMethodId ?? this.paymentMethodId,
      amount: amount ?? this.amount,
      status: status ?? this.status,
      adminNotes: adminNotes ?? this.adminNotes,
      processedBy: processedBy ?? this.processedBy,
      processedAt: processedAt ?? this.processedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      paymentMethod: paymentMethod ?? this.paymentMethod,
    );
  }

  @override
  String toString() {
    return 'WithdrawalRequestModel(id: $id, amount: $amount, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WithdrawalRequestModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
