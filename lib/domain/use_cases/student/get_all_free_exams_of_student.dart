import 'package:poruaa_core/data/repositories/free_exam/free_exam_repository.dart';
import 'package:poruaa_core/domain/models/free_exam/free_exam.dart';
import 'package:poruaa_core/domain/models/pagination/pagination_state.dart';
import 'package:poruaa_core/utils/result.dart';

class GetAllFreeExamsOfStudent {
  final FreeExamRepository _freeExamRepository;

  GetAllFreeExamsOfStudent(this._freeExamRepository);

  Future<Result<PaginatedResponse<FreeExam>>> execute(
    PaginationParams params,
  ) async {
    return await _freeExamRepository.getFreeExamsPaginated(params);
  }
}
