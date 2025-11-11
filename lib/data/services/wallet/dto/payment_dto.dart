class PaymentDto {
  final int id;
  final String tranId;
  final String amount;
  final String currency;
  final String status;
  final String? description;
  final String createdAt;
  final String? updatedAt;

  PaymentDto({
    required this.id,
    required this.tranId,
    required this.amount,
    required this.currency,
    required this.status,
    this.description,
    required this.createdAt,
    this.updatedAt,
  });

  factory PaymentDto.fromJson(Map<String, dynamic> json) {
    return PaymentDto(
      id: json['id'] as int,
      tranId: json['sslcommerz_tran_id'] as String,
      amount: json['amount'] as String,
      currency: json['currency'] as String,
      status: json['status'] as String,
      description: json['description'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String?,
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
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
