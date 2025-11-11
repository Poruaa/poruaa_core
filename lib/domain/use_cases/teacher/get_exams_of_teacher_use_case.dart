import 'package:poruaa_core/data/repositories/exam/exam_repository.dart';

class GetExamsOfTeacherUseCase {
  final ExamRepository _examRepository;
  GetExamsOfTeacherUseCase(this._examRepository);
  bool _loaded = false;
  Future<void> call(int teacherId) async {
    if (_loaded) {
      return;
    }
    _loaded = true;
    await _examRepository.getAllExamsOfTeacher(teacherId);
  }
}
