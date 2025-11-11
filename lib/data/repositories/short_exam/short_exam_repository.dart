import 'dart:typed_data';

import 'package:poruaa_core/domain/models/pagination/pagination_state.dart';
import 'package:poruaa_core/domain/models/short_exam/short_exam.dart';
import 'package:poruaa_core/domain/models/short_exam_result/short_exam_result.dart';
import 'package:poruaa_core/utils/result.dart';

abstract class ShortExamRepository {
  Future<Result<List<ShortExam>>> getShortExamsOfTeacherByMe();

  Future<Result<ShortExam>> getShortExamById(int id);

  Stream<Result<ShortExam>> watchShortExamById(int id);

  Stream<Result<List<ShortExam>>> watchAllShortExamsOfTeacherByMe();

  Future<Result<ShortExam>> updateShortExam(ShortExam shortExam, int id);

  Future<Result<ShortExam>> uploadShortExamThumbnail(
    ShortExam shortExam,
    Uint8List thumbnail,
  );

  Future<Result<ShortExam>> deleteShortExam(int id);

  Future<Result<ShortExam>> createShortExam(ShortExam shortExam);

  // Future<Result<List<ShortExam>>> getAllShortExamsOfStudentByMe();

  Future<Result<PaginatedResponse<ShortExam>>>
  getShortExamsOfStudentByMePaginated(PaginationParams params);

  Future<List<ShortExam>> getAllShortExamsFromCache();

  // Pagination state management
  String? getLastLoadedShortExamId();

  void setLastLoadedShortExamId(String? shortExamId);

  void resetPaginationState();

  Future<PaginationState<ShortExam>> getPaginationState();

  Future<Result<List<ShortExam>>> getAllEnrolledShortExamsOfStudentByMe();

  Future<Result<ShortExam>> getShortExamOfStudentByMeByExamId(
    int id, {
    bool refresh = false,
  });

  Future<Result<ShortExam>> getShortExamOfStudentByMeByExamIdFromServer(int id);

  Stream<Result<List<ShortExam>>> watchAllShortExamsOfStudentByMe();

  Stream<Result<List<ShortExam>>> watchAllEnrolledShortExamsOfStudentByMe();

  Future<Result<ShortExam>> startShortExamOfStudentByMeByShortExamId(
    int shortExamId,
  );

  Future<Result<ShortExamResult>> submitShortExamOfStudentByMeByShortExamId(
    int shortExamId,
    Map<int, int> answers,
  );

  Future<Result<ShortExamResult>> resultShortExamOfStudentByMeByShortExamId(
    int shortExamId,
  );

  Stream<Result<ShortExam>> watchShortExamOfStudentByMeById(int id);

  Future<Result<bool>> enrollShortExam(int examId);
}
