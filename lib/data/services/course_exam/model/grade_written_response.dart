class GradeWrittenResponse {
  final bool success;
  final double awardedMark;
  final double totalScore; // Recalculated total (MCQ + written)
  final int? rank; // Updated rank

  GradeWrittenResponse({
    required this.success,
    required this.awardedMark,
    required this.totalScore,
    this.rank,
  });

  factory GradeWrittenResponse.fromJson(Map<String, dynamic> json) {
    return GradeWrittenResponse(
      success: json["success"] as bool,
      awardedMark: (json["awarded_mark"] as num).toDouble(),
      totalScore: (json["total_score"] as num).toDouble(),
      rank: json["rank"] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "success": success,
      "awarded_mark": awardedMark,
      "total_score": totalScore,
      if (rank != null) "rank": rank,
    };
  }
}
