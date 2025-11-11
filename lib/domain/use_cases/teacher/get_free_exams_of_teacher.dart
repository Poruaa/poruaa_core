import 'package:poruaa_core/data/repositories/free_exam/free_exam_repository.dart';
import 'package:poruaa_core/domain/models/free_exam/free_exam.dart';
import 'package:poruaa_core/utils/result.dart';

class GetFreeExamsOfTeacher {
  final FreeExamRepository _freeExamRepository;

  GetFreeExamsOfTeacher(this._freeExamRepository);

  Future<Result<List<FreeExam>>> execute() async {
    return await _freeExamRepository.getFreeExamsOfTeacherByMe();
  }
}
