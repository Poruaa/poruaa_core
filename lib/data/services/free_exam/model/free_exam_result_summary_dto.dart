class FreeExamResultSummaryDto {
  int resultId;
  int studentId;
  int freeExamId;
  String name;
  int? rank;
  double? score;

  FreeExamResultSummaryDto({
    required this.resultId,
    required this.studentId,
    required this.freeExamId,
    required this.name,
    this.rank,
    this.score,
  });

  factory FreeExamResultSummaryDto.fromJson(Map<String, dynamic> json) {
    return FreeExamResultSummaryDto(
      resultId: json["result_id"],
      studentId: json["student_id"],
      freeExamId: json["free_exam_id"],
      name: json["name"],
      rank: json["rank"],
      score: json["score"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "result_id": resultId,
      "student_id": studentId,
      "free_exam_id": freeExamId,
      "name": name,
      "rank": rank,
      "score": score,
    };
  }
}
