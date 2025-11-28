class CourseExpirationInput {
  final DateTime expiresAt;

  CourseExpirationInput({required this.expiresAt});

  Map<String, dynamic> toJson() {
    return {'expires_at': expiresAt.toUtc().toIso8601String()};
  }

  factory CourseExpirationInput.fromJson(Map<String, dynamic> json) {
    return CourseExpirationInput(
      expiresAt: DateTime.parse(json['expires_at'] as String).toLocal(),
    );
  }
}

class CourseExtensionInvoiceDTO {
  final int courseId;
  final DateTime currentExpiresAt;
  final DateTime newExpiresAt;
  final int extraMonths;
  final int examCount;
  final int enrollmentCount;
  final double perExamCost;
  final double costPerStudent;
  final double totalCost;
  final double walletBalance;
  final double walletFreeCredit;
  final bool canExtend;
  final double afterExtendBalance;
  final double afterExtendFreeCredit;
  final String message;

  CourseExtensionInvoiceDTO({
    required this.courseId,
    required this.currentExpiresAt,
    required this.newExpiresAt,
    required this.extraMonths,
    required this.examCount,
    required this.enrollmentCount,
    required this.perExamCost,
    required this.costPerStudent,
    required this.totalCost,
    required this.walletBalance,
    required this.walletFreeCredit,
    required this.canExtend,
    required this.afterExtendBalance,
    required this.afterExtendFreeCredit,
    required this.message,
  });

  factory CourseExtensionInvoiceDTO.fromJson(Map<String, dynamic> json) {
    return CourseExtensionInvoiceDTO(
      courseId: json['course_id'] as int,
      currentExpiresAt: DateTime.parse(
        json['current_expires_at'] as String,
      ).toLocal(),
      newExpiresAt: DateTime.parse(json['new_expires_at'] as String).toLocal(),
      extraMonths: json['extra_months'] as int,
      examCount: json['exam_count'] as int,
      enrollmentCount: json['enrollment_count'] as int,
      perExamCost: (json['per_exam_cost'] as num).toDouble(),
      costPerStudent: (json['cost_per_student'] as num).toDouble(),
      totalCost: (json['total_cost'] as num).toDouble(),
      walletBalance: (json['wallet_balance'] as num).toDouble(),
      walletFreeCredit: (json['wallet_free_credit'] as num).toDouble(),
      canExtend: json['can_extend'] as bool,
      afterExtendBalance: (json['after_extend_balance'] as num).toDouble(),
      afterExtendFreeCredit: (json['after_extend_free_credit'] as num)
          .toDouble(),
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'course_id': courseId,
      'current_expires_at': currentExpiresAt.toUtc().toIso8601String(),
      'new_expires_at': newExpiresAt.toUtc().toIso8601String(),
      'extra_months': extraMonths,
      'exam_count': examCount,
      'enrollment_count': enrollmentCount,
      'per_exam_cost': perExamCost,
      'cost_per_student': costPerStudent,
      'total_cost': totalCost,
      'wallet_balance': walletBalance,
      'wallet_free_credit': walletFreeCredit,
      'can_extend': canExtend,
      'after_extend_balance': afterExtendBalance,
      'after_extend_free_credit': afterExtendFreeCredit,
      'message': message,
    };
  }
}
