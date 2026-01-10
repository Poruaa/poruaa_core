class WrittenAnswerForGrading {
  final int studentId;
  final String studentName;
  final int questionId;
  final String questionText;
  final double questionMark;
  final String imageUrl;
  final int? storageFileId;
  final double? awardedMark; // Existing grade if already graded
  final String? feedback; // Existing feedback if any

  WrittenAnswerForGrading({
    required this.studentId,
    required this.studentName,
    required this.questionId,
    required this.questionText,
    required this.questionMark,
    required this.imageUrl,
    this.storageFileId,
    this.awardedMark,
    this.feedback,
  });

  factory WrittenAnswerForGrading.fromJson(Map<String, dynamic> json) {
    return WrittenAnswerForGrading(
      studentId: json["student_id"] as int,
      studentName: json["student_name"] as String,
      questionId: json["question_id"] as int,
      questionText: json["question_text"] as String,
      questionMark: (json["question_mark"] as num).toDouble(),
      imageUrl: json["image_url"] as String,
      storageFileId: json["storage_file_id"] as int?,
      awardedMark: json["awarded_mark"] != null
          ? (json["awarded_mark"] as num).toDouble()
          : null,
      feedback: json["feedback"] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "student_id": studentId,
      "student_name": studentName,
      "question_id": questionId,
      "question_text": questionText,
      "question_mark": questionMark,
      "image_url": imageUrl,
      if (storageFileId != null) "storage_file_id": storageFileId,
      if (awardedMark != null) "awarded_mark": awardedMark,
      if (feedback != null) "feedback": feedback,
    };
  }
}
