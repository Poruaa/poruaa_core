class QuestionModel {
  final int id;
  final String question;
  final List<String> options;
  final int answer;
  final int examId;
  final String solve;
  final DateTime createdAt;
  QuestionModel({
    required this.id,
    required this.question,
    required this.options,
    required this.answer,
    required this.examId,
    required this.solve,
    required this.createdAt,
  });

  static QuestionModel fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json["id"],
      question: json["question"],
      options: (json["options"] as List?)?.whereType<String>().toList() ?? [],
      answer: json["answer"],
      examId: json["exam_id"],
      solve: json["solve"],
      createdAt: DateTime.parse(json["created_at"]),
    );
  }

  Map<String, Object> toInputJson() {
    return {
      "question": question,
      "options": options,
      "answer": answer,
      "solve": solve,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "question": question,
      "answer": answer,
      "options": options,
      "exam_id": examId,
      "solve": solve,
      "created_at": createdAt.toIso8601String(),
    };
  }
}
