class AddStudentInvoiceDto {
  final int studentId;
  final String studentName;
  final String? studentEmail;
  final String? studentPhone;
  final String? studentCollege;
  final int courseId;
  final String courseName;
  final String courseSubtitle;
  final int examCount;
  final double costPerExam;
  final double totalCost;
  final double currentWalletBalance;
  final double currentFreeCredit;
  final double totalAvailable;
  final double balanceAfterPayment;
  final double freeCreditAfterPayment;
  final bool canAfford;

  AddStudentInvoiceDto({
    required this.studentId,
    required this.studentName,
    this.studentEmail,
    this.studentPhone,
    this.studentCollege,
    required this.courseId,
    required this.courseName,
    required this.courseSubtitle,
    required this.examCount,
    required this.costPerExam,
    required this.totalCost,
    required this.currentWalletBalance,
    required this.currentFreeCredit,
    required this.totalAvailable,
    required this.balanceAfterPayment,
    required this.freeCreditAfterPayment,
    required this.canAfford,
  });

  factory AddStudentInvoiceDto.fromJson(Map<String, dynamic> json) {
    return AddStudentInvoiceDto(
      studentId: json['student_id'] as int,
      studentName: json['student_name'] as String,
      studentEmail: json['student_email'] as String?,
      studentPhone: json['student_phone'] as String?,
      studentCollege: json['student_college'] as String?,
      courseId: json['course_id'] as int,
      courseName: json['course_name'] as String,
      courseSubtitle: json['course_subtitle'] as String,
      examCount: json['exam_count'] as int,
      costPerExam: (json['cost_per_exam'] as num).toDouble(),
      totalCost: (json['total_cost'] as num).toDouble(),
      currentWalletBalance: (json['current_wallet_balance'] as num).toDouble(),
      currentFreeCredit: (json['current_free_credit'] as num).toDouble(),
      totalAvailable: (json['total_available'] as num).toDouble(),
      balanceAfterPayment: (json['balance_after_payment'] as num).toDouble(),
      freeCreditAfterPayment: (json['free_credit_after_payment'] as num)
          .toDouble(),
      canAfford: json['can_afford'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'student_id': studentId,
      'student_name': studentName,
      'student_email': studentEmail,
      'student_phone': studentPhone,
      'student_college': studentCollege,
      'course_id': courseId,
      'course_name': courseName,
      'course_subtitle': courseSubtitle,
      'exam_count': examCount,
      'cost_per_exam': costPerExam,
      'total_cost': totalCost,
      'current_wallet_balance': currentWalletBalance,
      'current_free_credit': currentFreeCredit,
      'total_available': totalAvailable,
      'balance_after_payment': balanceAfterPayment,
      'free_credit_after_payment': freeCreditAfterPayment,
      'can_afford': canAfford,
    };
  }
}
