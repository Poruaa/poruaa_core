import 'package:drift/drift.dart';
import 'package:poruaa_core/data/dao/db/database.dart';
import 'package:poruaa_core/data/services/exam/model/exam_model.dart';

class Exam {
  final int id;
  final String name;
  final int teacherId;
  Exam({required this.id, required this.name, required this.teacherId});

  static Exam fromDTO(ExamDTO examModel) {
    return Exam(
      id: examModel.id,
      name: examModel.name,
      teacherId: examModel.teacherId,
    );
  }

  factory Exam.zero() {
    return Exam(id: 0, name: "", teacherId: 0);
  }

  ExamDTO toDTO() {
    return ExamDTO(id, name, teacherId);
  }

  Exam copyWith({
    int? id,
    String? name,
    int? teacherId,
  }) {
    return Exam(
      id: id ?? this.id,
      name: name ?? this.name,
      teacherId: teacherId ?? this.teacherId,
    );
  }

  factory Exam.fromItem(ExamItem item) {
    return Exam(
      id: item.id,
      name: item.name,
      teacherId: item.teacherId,
    );
  }

  ExamItemsCompanion toCompanion() {
    return ExamItemsCompanion(
      id: Value(id),
      name: Value(name),
      teacherId: Value(teacherId),
    );
  }
}
