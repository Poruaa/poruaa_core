class ExamDTO {
  final int id;
  final String name;
  final int teacherId;
  ExamDTO(this.id, this.name, this.teacherId);

  static ExamDTO fromJson(Map<String, dynamic> json) {
    return ExamDTO(json["id"], json["name"], json["teacher_id"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "teacher_id": teacherId,
    };
  }
}
