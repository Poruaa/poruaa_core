import 'package:poruaa_core/data/repositories/short_exam/short_exam_repository.dart';

class GetShortExamsOfTeacherUseCase {
  final ShortExamRepository _examRepository;
  GetShortExamsOfTeacherUseCase(this._examRepository);
  bool _loaded = false;
  Future<void> call() async {
    if (_loaded) {
      return;
    }
    _loaded = true;
    await _examRepository.getShortExamsOfTeacherByMe();
  }
}
