import 'package:poruaa_core/domain/models/exam/exam.dart';
import 'package:poruaa_core/utils/result.dart';

abstract class ExamRepository {
  Future<Result<List<Exam>>> getAllExamsOfTeacher(int teacherId);

  // Stream<Result<List<Exam>>?> get stream;
  Stream<Result<List<Exam>>?> watchAllExamsOffTeacher(int teacherId);

  Future<Result<Exam>> create(Exam course);

  Future<bool> update(Exam course);

  Future<Result<Exam>> getExam(int id);
  Stream<Result<Exam>> watchExam(int id);

  Future<Result<bool>> delete(int id);
}
