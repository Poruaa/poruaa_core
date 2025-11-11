class InvoiceModel {
  final int studentId;
  final String studentName;
  final String studentEmail;
  final String itemType; // "course" or "short_exam"
  final int itemId;
  final String itemName;
  final String? itemThumbnail;
  final double price;
  final double? regularPrice;
  final double? discountPercentage;
  final double walletBalance;
  final double remainingBalance;
  final bool canPayWithWallet;
  final bool hasPaymentContactInfo;
  final DateTime createdAt;
  final DateTime expiresAt;

  InvoiceModel({
    required this.studentId,
    required this.studentName,
    required this.studentEmail,
    required this.itemType,
    required this.itemId,
    required this.itemName,
    this.itemThumbnail,
    required this.price,
    this.regularPrice,
    this.discountPercentage,
    required this.walletBalance,
    required this.remainingBalance,
    required this.canPayWithWallet,
    required this.hasPaymentContactInfo,
    required this.createdAt,
    required this.expiresAt,
  });

  factory InvoiceModel.fromJson(Map<String, dynamic> json) {
    return InvoiceModel(
      studentId: json['student_id'] as int,
      studentName: json['student_name'] as String,
      studentEmail: json['student_email'] as String,
      itemType: json['item_type'] as String,
      itemId: json['item_id'] as int,
      itemName: json['item_name'] as String,
      itemThumbnail: json['item_thumbnail'] as String?,
      price: (json['price'] as num).toDouble(),
      regularPrice: json['regular_price'] != null
          ? (json['regular_price'] as num).toDouble()
          : null,
      discountPercentage: json['discount_percentage'] != null
          ? (json['discount_percentage'] as num).toDouble()
          : null,
      walletBalance: double.parse(json['wallet_balance'] as String),
      remainingBalance: double.parse(json['remaining_balance'] as String),
      canPayWithWallet: json['can_pay_with_wallet'] as bool,
      hasPaymentContactInfo: json['has_payment_contact_info'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      expiresAt: DateTime.parse(json['expires_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'student_id': studentId,
      'student_name': studentName,
      'student_email': studentEmail,
      'item_type': itemType,
      'item_id': itemId,
      'item_name': itemName,
      'item_thumbnail': itemThumbnail,
      'price': price,
      'regular_price': regularPrice,
      'discount_percentage': discountPercentage,
      'wallet_balance': walletBalance,
      'remaining_balance': remainingBalance,
      'can_pay_with_wallet': canPayWithWallet,
      'has_payment_contact_info': hasPaymentContactInfo,
      'created_at': createdAt.toIso8601String(),
      'expires_at': expiresAt.toIso8601String(),
    };
  }
}
