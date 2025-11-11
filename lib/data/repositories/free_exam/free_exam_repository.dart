import 'dart:typed_data';

import 'package:poruaa_core/data/services/free_exam/model/free_exam_result_summary_dto.dart';
import 'package:poruaa_core/data/services/free_exam/model/free_exam_individual_result_dto.dart';
import 'package:poruaa_core/domain/models/pagination/pagination_state.dart';
import 'package:poruaa_core/domain/models/free_exam/free_exam.dart';
import 'package:poruaa_core/domain/models/free_exam_result/free_exam_result.dart';
import 'package:poruaa_core/utils/result.dart';

abstract class FreeExamRepository {
  Future<Result<List<FreeExam>>> getFreeExamsOfTeacherByMe();

  Future<Result<FreeExam>> getFreeExamById(int id);

  Stream<Result<FreeExam>> watchFreeExamById(int id);

  Stream<Result<List<FreeExam>>> watchAllFreeExamsOfTeacherByMe();

  Future<Result<FreeExam>> updateFreeExam(FreeExam freeExam, int id);

  Future<Result<FreeExam>> uploadFreeExamThumbnail(
    FreeExam freeExam,
    Uint8List thumbnail,
  );

  Future<Result<bool>> deleteFreeExam(int id);

  Future<Result<FreeExam>> createFreeExam(FreeExam freeExam);

  Future<Result<PaginatedResponse<FreeExam>>>
  getFreeExamsOfStudentByMePaginated(PaginationParams params);

  Future<List<FreeExam>> getAllFreeExamsFromCache();

  // Pagination state management
  String? getLastLoadedFreeExamId();

  void setLastLoadedFreeExamId(String? freeExamId);

  void resetPaginationState();

  Future<PaginationState<FreeExam>> getPaginationState();

  Future<Result<List<FreeExam>>> getAllParticipatedFreeExamsOfStudentByMe();

  Future<Result<FreeExam>> getFreeExamOfStudentByMeByExamId(
    int id, {
    bool refresh = false,
  });

  Stream<Result<FreeExam>> watchFreeExamOfStudentByMeByExamId(int id);

  Future<Result<FreeExam>> getFreeExamOfStudentByMeByExamIdFromServer(int id);

  Stream<Result<List<FreeExam>>> watchAllFreeExamsOfStudentByMe();

  Stream<Result<List<FreeExam>>> watchAllParticipatedFreeExamsOfStudentByMe();

  Future<Result<FreeExam>> startFreeExamOfStudentByMeByFreeExamId(
    int freeExamId,
  );

  Future<Result<FreeExamResult>> submitFreeExamOfStudentByMeByFreeExamId(
    int freeExamId,
    Map<int, int> answers,
  );

  Future<Result<FreeExamResult>> resultFreeExamOfStudentByMeByFreeExamId(
    int freeExamId,
  );

  Future<Result<FreeExam>> updateFreeExamScore(int freeExamId, double score);

  // Teacher results endpoints
  Future<Result<List<FreeExamResultSummaryDto>>> getFreeExamResults(
    int freeExamId,
  );

  Future<Result<FreeExamIndividualResultDTO>> getIndividualFreeExamResult(
    int freeExamId,
    int resultId,
  );

  // Public endpoints
  Future<Result<PaginatedResponse<FreeExam>>> getFreeExamsPaginated(
    PaginationParams params,
  );

  Future<Result<FreeExam>> getFreeExamByIdPublic(int id);
}
