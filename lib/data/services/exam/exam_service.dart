import 'package:poruaa_core/data/services/exam/model/exam_model.dart';
import 'package:poruaa_core/utils/result.dart';

abstract class ExamService {
  Future<Result<List<ExamDTO>>> getExamsOfTeacher(int teacherId);

  Future<Result<ExamDTO>> getExamOfTeacherById(int teacherId, int examId);

  Future<Result<ExamDTO>> create(int teacherId, String name);

  Future<bool> update(int teacherId, int id, String name);

  Future<Result<bool>> delete(int teacherId, int id);
}
