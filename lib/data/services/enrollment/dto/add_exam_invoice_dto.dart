class AddExamInvoiceDto {
  final int courseId;
  final String courseName;
  final String courseSubtitle;
  final int currentExamCount;
  final double coursePrice;
  final int enrollmentCount;
  final double costPerExam;
  final double totalCost;
  final double currentWalletBalance;
  final double currentFreeCredit;
  final double totalAvailable;
  final double balanceAfterPayment;
  final double freeCreditAfterPayment;
  final bool canAfford;
  final bool canAddMoreExams;

  AddExamInvoiceDto({
    required this.courseId,
    required this.courseName,
    required this.courseSubtitle,
    required this.currentExamCount,
    required this.coursePrice,
    required this.enrollmentCount,
    required this.costPerExam,
    required this.totalCost,
    required this.currentWalletBalance,
    required this.currentFreeCredit,
    required this.totalAvailable,
    required this.balanceAfterPayment,
    required this.freeCreditAfterPayment,
    required this.canAfford,
    required this.canAddMoreExams,
  });

  factory AddExamInvoiceDto.fromJson(Map<String, dynamic> json) {
    return AddExamInvoiceDto(
      courseId: json['course_id'] as int,
      courseName: json['course_name'] as String,
      courseSubtitle: json['course_subtitle'] as String,
      currentExamCount: json['current_exam_count'] as int,
      coursePrice: (json['course_price'] as num).toDouble(),
      enrollmentCount: json['enrollment_count'] as int,
      costPerExam: (json['cost_per_exam'] as num).toDouble(),
      totalCost: (json['total_cost'] as num).toDouble(),
      currentWalletBalance: (json['current_wallet_balance'] as num).toDouble(),
      currentFreeCredit: (json['current_free_credit'] as num).toDouble(),
      totalAvailable: (json['total_available'] as num).toDouble(),
      balanceAfterPayment: (json['balance_after_payment'] as num).toDouble(),
      freeCreditAfterPayment: (json['free_credit_after_payment'] as num)
          .toDouble(),
      canAfford: json['can_afford'] as bool,
      canAddMoreExams: json['can_add_more_exams'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'course_id': courseId,
      'course_name': courseName,
      'course_subtitle': courseSubtitle,
      'current_exam_count': currentExamCount,
      'course_price': coursePrice,
      'enrollment_count': enrollmentCount,
      'cost_per_exam': costPerExam,
      'total_cost': totalCost,
      'current_wallet_balance': currentWalletBalance,
      'current_free_credit': currentFreeCredit,
      'total_available': totalAvailable,
      'balance_after_payment': balanceAfterPayment,
      'free_credit_after_payment': freeCreditAfterPayment,
      'can_afford': canAfford,
      'can_add_more_exams': canAddMoreExams,
    };
  }
}
