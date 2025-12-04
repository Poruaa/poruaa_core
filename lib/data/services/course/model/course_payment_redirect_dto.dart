class CoursePaymentRedirectDTO {
  final String redirectUrl;

  CoursePaymentRedirectDTO({required this.redirectUrl});

  factory CoursePaymentRedirectDTO.fromJson(Map<String, dynamic> json) {
    return CoursePaymentRedirectDTO(
      redirectUrl: json['redirect_url'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'redirect_url': redirectUrl};
  }
}
