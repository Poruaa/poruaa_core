import 'package:drift/drift.dart';
import 'package:poruaa_core/data/dao/db/database.dart';
import 'package:poruaa_core/domain/models/free_exam/free_exam.dart';

part 'free_exam_dao.g.dart'; // necessary for drift to generate DAO code

@DriftAccessor(
  tables: [FreeExamItems],
) // This connects the DAO to the FreeExamItems table
class FreeExamDao extends DatabaseAccessor<AppDatabase>
    with _$FreeExamDaoMixin {
  FreeExamDao(super.db);

  // Pagination state - simple variable for session-only storage
  String? _lastLoadedFreeExamId;

  Future<int> insertExam(FreeExamItemsCompanion freeExam) async {
    return into(freeExamItems).insertOnConflictUpdate(freeExam);
  }

  Future<int> updateFreeExamScore(int freeExamId, double score) async {
    final query = update(freeExamItems)..where((e) => e.id.equals(freeExamId));
    return await query.write(
      FreeExamItemsCompanion(participated: Value(true), score: Value(score)),
    );
  }

  Future<int> deleteFreeExamById(int id) async {
    return await (delete(freeExamItems)..where((e) => e.id.equals(id))).go();
  }

  Future<void> insertAll(Iterable<FreeExamItemsCompanion> freeExams) async {
    return batch((batch) {
      batch.insertAllOnConflictUpdate(freeExamItems, freeExams);
    });
  }

  // Get all free exams
  Future<List<FreeExamItem>> getAllFreeExams() {
    return (select(
      freeExamItems,
    )..orderBy([(s) => OrderingTerm.desc(s.id)])).get();
  }

  // Pagination state management
  String? getLastLoadedFreeExamId() {
    return _lastLoadedFreeExamId;
  }

  void setLastLoadedFreeExamId(String? freeExamId) {
    _lastLoadedFreeExamId = freeExamId;
  }

  void resetPaginationState() {
    _lastLoadedFreeExamId = null;
  }

  Stream<List<FreeExam>> watchAllFreeExams() {
    return (select(freeExamItems)..orderBy([(s) => OrderingTerm.desc(s.id)]))
        .watch()
        .map((items) => items.map((item) => FreeExam.fromItem(item)).toList());
  }

  Stream<List<FreeExam>> watchAllParticipatedFreeExams() {
    return (select(freeExamItems)
          ..where((e) => e.participated.equals(true))
          ..orderBy([(s) => OrderingTerm.desc(s.id)]))
        .watch()
        .map((items) => items.map((item) => FreeExam.fromItem(item)).toList());
  }

  Stream<FreeExam?> watchFreeExamById(int id) {
    return (select(freeExamItems)..where((e) => e.id.equals(id)))
        .watchSingleOrNull()
        .map((item) => item != null ? FreeExam.fromItem(item) : null);
  }

  Future<FreeExamItem?> getFreeExamById(int id) async {
    return await (select(
      freeExamItems,
    )..where((e) => e.id.equals(id))).getSingleOrNull();
  }

  Future<List<FreeExamItem>> getFreeExamsOfTeacher(int teacherId) async {
    return await (select(freeExamItems)
          ..where((e) => e.teacherId.equals(teacherId))
          ..orderBy([(s) => OrderingTerm.desc(s.id)]))
        .get();
  }

  Stream<List<FreeExam>> watchFreeExamsOfTeacher(int teacherId) {
    return (select(freeExamItems)
          ..where((e) => e.teacherId.equals(teacherId))
          ..orderBy([(s) => OrderingTerm.desc(s.id)]))
        .watch()
        .map((items) => items.map((item) => FreeExam.fromItem(item)).toList());
  }
}
