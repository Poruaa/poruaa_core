import 'package:poruaa_core/data/services/wallet/model/withdrawal_request_model.dart';
import 'package:poruaa_core/domain/models/withdrawal/payment_method.dart';

/// Domain model for withdrawal requests
class WithdrawalRequest {
  final int id;
  final int walletId;
  final int paymentMethodId;
  final double amount;
  final WithdrawalStatus status;
  final String? adminNotes;
  final int? processedBy;
  final DateTime? processedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  // Payment method details (populated when fetching with details)
  final PaymentMethod? paymentMethod;

  WithdrawalRequest({
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

  factory WithdrawalRequest.fromModel(WithdrawalRequestModel model) {
    return WithdrawalRequest(
      id: model.id,
      walletId: model.walletId,
      paymentMethodId: model.paymentMethodId,
      amount: model.amount,
      status: WithdrawalStatus.fromString(model.status),
      adminNotes: model.adminNotes,
      processedBy: model.processedBy,
      processedAt: model.processedAt,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      paymentMethod: model.paymentMethod != null
          ? PaymentMethod.fromModel(model.paymentMethod!)
          : null,
    );
  }

  WithdrawalRequestModel toModel() {
    return WithdrawalRequestModel(
      id: id,
      walletId: walletId,
      paymentMethodId: paymentMethodId,
      amount: amount,
      status: status.value,
      adminNotes: adminNotes,
      processedBy: processedBy,
      processedAt: processedAt,
      createdAt: createdAt,
      updatedAt: updatedAt,
      paymentMethod: paymentMethod?.toModel(),
    );
  }

  WithdrawalRequest copyWith({
    int? id,
    int? walletId,
    int? paymentMethodId,
    double? amount,
    WithdrawalStatus? status,
    String? adminNotes,
    int? processedBy,
    DateTime? processedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    PaymentMethod? paymentMethod,
  }) {
    return WithdrawalRequest(
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'wallet_id': walletId,
      'payment_method_id': paymentMethodId,
      'amount': amount.toString(),
      'status': status.value,
      'admin_notes': adminNotes,
      'processed_by': processedBy,
      'processed_at': processedAt?.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      if (paymentMethod != null) 'payment_method': paymentMethod!.toJson(),
    };
  }

  factory WithdrawalRequest.fromJson(Map<String, dynamic> json) {
    return WithdrawalRequest(
      id: json['id'],
      walletId: json['wallet_id'],
      paymentMethodId: json['payment_method_id'],
      amount: double.parse(json['amount'].toString()),
      status: WithdrawalStatus.fromString(json['status']),
      adminNotes: json['admin_notes'],
      processedBy: json['processed_by'],
      processedAt: json['processed_at'] != null
          ? DateTime.parse(json['processed_at'])
          : null,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      paymentMethod: json['payment_method'] != null
          ? PaymentMethod.fromJson(json['payment_method'])
          : null,
    );
  }

  @override
  String toString() {
    return 'WithdrawalRequest(id: $id, amount: $amount, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WithdrawalRequest && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

/// Withdrawal request statuses
enum WithdrawalStatus {
  pending('pending'),
  approved('approved'),
  rejected('rejected'),
  processing('processing'),
  completed('completed'),
  failed('failed');

  const WithdrawalStatus(this.value);
  final String value;

  static WithdrawalStatus fromString(String value) {
    switch (value) {
      case 'pending':
        return WithdrawalStatus.pending;
      case 'approved':
        return WithdrawalStatus.approved;
      case 'rejected':
        return WithdrawalStatus.rejected;
      case 'processing':
        return WithdrawalStatus.processing;
      case 'completed':
        return WithdrawalStatus.completed;
      case 'failed':
        return WithdrawalStatus.failed;
      default:
        throw ArgumentError('Invalid withdrawal status: $value');
    }
  }

  String get displayName {
    switch (this) {
      case WithdrawalStatus.pending:
        return 'Pending';
      case WithdrawalStatus.approved:
        return 'Approved';
      case WithdrawalStatus.rejected:
        return 'Rejected';
      case WithdrawalStatus.processing:
        return 'Processing';
      case WithdrawalStatus.completed:
        return 'Completed';
      case WithdrawalStatus.failed:
        return 'Failed';
    }
  }

  /// Get status color for UI
  String get colorHex {
    switch (this) {
      case WithdrawalStatus.pending:
        return '#FFA500'; // Orange
      case WithdrawalStatus.approved:
        return '#32CD32'; // Green
      case WithdrawalStatus.rejected:
        return '#FF0000'; // Red
      case WithdrawalStatus.processing:
        return '#1E90FF'; // Blue
      case WithdrawalStatus.completed:
        return '#008000'; // Dark Green
      case WithdrawalStatus.failed:
        return '#DC143C'; // Crimson
    }
  }

  /// Check if status allows user actions
  bool get isUserActionable {
    switch (this) {
      case WithdrawalStatus.pending:
        return true; // Can be cancelled (if implemented)
      case WithdrawalStatus.approved:
      case WithdrawalStatus.rejected:
      case WithdrawalStatus.processing:
      case WithdrawalStatus.completed:
      case WithdrawalStatus.failed:
        return false;
    }
  }

  /// Check if status is final (no further changes expected)
  bool get isFinal {
    switch (this) {
      case WithdrawalStatus.completed:
      case WithdrawalStatus.failed:
      case WithdrawalStatus.rejected:
        return true;
      case WithdrawalStatus.pending:
      case WithdrawalStatus.approved:
      case WithdrawalStatus.processing:
        return false;
    }
  }
}
