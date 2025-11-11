import 'package:poruaa_core/data/repositories/short_exam/short_exam_repository.dart';
import 'package:poruaa_core/utils/result.dart';
import 'package:poruaa_core/utils/result_loading_use_case_mixin.dart';

class GetAllEnrolledShortExamsOfStudentUseCase with ResultLoadingUseCaseMixin {
  final ShortExamRepository _examRepository;
  GetAllEnrolledShortExamsOfStudentUseCase(this._examRepository);
  Future<Result> call() async {
    return execute(
      () => _examRepository.getAllEnrolledShortExamsOfStudentByMe(),
    );
  }
}
