class CourseExamResultWithStudentDto {
  int resultId;
  int studentId;
  int courseExamId;
  String name;
  int? rank;
  double? score;

  CourseExamResultWithStudentDto({
    required this.resultId,
    required this.studentId,
    required this.courseExamId,
    required this.name,
    this.rank,
    this.score,
  });

  factory CourseExamResultWithStudentDto.fromJson(Map<String, dynamic> json) {
    return CourseExamResultWithStudentDto(
      resultId: json["result_id"],
      studentId: json["student_id"],
      courseExamId: json["course_exam_id"],
      name: json["name"],
      rank: json["rank"],
      score: json["score"],
    );
  }
}
