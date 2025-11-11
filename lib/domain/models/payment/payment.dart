import 'package:flutter/material.dart';

class Payment {
  final int id;
  final String tranId;
  final String amount;
  final String currency;
  final String status;
  final String? description;
  final DateTime createdAt;
  final DateTime? updatedAt;

  Payment({
    required this.id,
    required this.tranId,
    required this.amount,
    required this.currency,
    required this.status,
    this.description,
    required this.createdAt,
    this.updatedAt,
  });

  Payment copyWith({
    int? id,
    String? tranId,
    String? amount,
    String? currency,
    String? status,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Payment(
      id: id ?? this.id,
      tranId: tranId ?? this.tranId,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      status: status ?? this.status,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'] as int,
      tranId: json['sslcommerz_tran_id'] as String,
      amount: json['amount'] as String,
      currency: json['currency'] as String,
      status: json['status'] as String,
      description: json['description'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sslcommerz_tran_id': tranId,
      'amount': amount,
      'currency': currency,
      'status': status,
      'description': description,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  /// Get display status with proper formatting
  String get displayStatus {
    switch (status.toLowerCase()) {
      case 'processed':
        return 'Processed';
      case 'failed':
        return 'Failed';
      case 'cancelled':
        return 'Cancelled';
      case 'pending':
        return 'Pending';
      case 'hold':
        return 'Hold';
      default:
        return status;
    }
  }

  Color getStatusColor(ThemeData theme) {
    final brightness = theme.colorScheme.brightness;
    final colorScheme = theme.colorScheme;
    double lightness = 1;
    if (brightness == Brightness.light) {
      lightness = 0.4;
    } else {
      lightness = 0.7;
    }
    switch (status.toLowerCase()) {
      case 'processed':
        return HSLColor.fromColor(Colors.green)
            .withLightness(lightness)
            .toColor();
      case 'failed':
        return HSLColor.fromColor(Colors.red)
            .withLightness(lightness)
            .toColor();
      case 'cancelled':
        return HSLColor.fromColor(Colors.orange)
            .withLightness(lightness)
            .toColor();
      case 'pending':
        return HSLColor.fromColor(Colors.blue)
            .withLightness(lightness)
            .toColor();
      case 'hold':
        return HSLColor.fromColor(Colors.blueGrey)
            .withLightness(lightness)
            .toColor();
      default:
        return colorScheme.onSurfaceVariant;
    }
  }
  // /// Get status color for UI
  // String get statusColor {
  //   switch (status.toLowerCase()) {
  //     case 'processed':
  //       return 'green';
  //     case 'failed':
  //       return 'red';
  //     case 'cancelled':
  //       return 'orange';
  //     case 'pending':
  //       return 'blue';
  //     case 'hold':
  //       return 'yellow';
  //     default:
  //       return 'grey';
  //   }
  // }

  /// Get formatted amount with currency
  String get formattedAmount {
    return '$amount $currency';
  }

  /// Get formatted date
  String get formattedDate {
    return '${createdAt.day}/${createdAt.month}/${createdAt.year}';
  }

  /// Get formatted time
  String get formattedTime {
    return '${createdAt.hour.toString().padLeft(2, '0')}:${createdAt.minute.toString().padLeft(2, '0')}';
  }

  @override
  String toString() {
    return 'Payment(id: $id, tranId: $tranId, amount: $amount, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Payment &&
        other.id == id &&
        other.tranId == tranId &&
        other.amount == amount &&
        other.currency == currency &&
        other.status == status &&
        other.description == description &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      tranId,
      amount,
      currency,
      status,
      description,
      createdAt,
      updatedAt,
    );
  }
}
