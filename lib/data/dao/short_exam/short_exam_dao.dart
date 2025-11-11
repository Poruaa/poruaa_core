import 'package:drift/drift.dart';
import 'package:poruaa_core/domain/models/exam/exam.dart';
import 'package:poruaa_core/domain/models/short_exam/short_exam.dart';
import '../db/database.dart'; // import your drift database class

part 'short_exam_dao.g.dart'; // necessary for drift to generate DAO code

@DriftAccessor(
  tables: [ShortExamItems],
) // This connects the DAO to the Courses table
class ShortExamDao extends DatabaseAccessor<AppDatabase>
    with _$ShortExamDaoMixin {
  ShortExamDao(super.db);

  // Pagination state - simple variable for session-only storage
  String? _lastLoadedShortExamId;

  Future<int> insertExam(ShortExamItemsCompanion shortExam) async {
    return into(shortExamItems).insertOnConflictUpdate(shortExam);
  }

  Future<int> updateThumbnail(int shortExamId, String thumbnail) async {
    final query = update(shortExamItems)
      ..where((e) => e.id.equals(shortExamId));
    return await query.write(
      ShortExamItemsCompanion(thumbnail: Value(thumbnail)),
    );
  }

  Future<int> deleteShortExamById(int id) async {
    return await (delete(shortExamItems)..where((e) => e.id.equals(id))).go();
  }

  Future<void> insertAll(Iterable<ShortExamItemsCompanion> shortExams) async {
    return batch((batch) {
      batch.insertAllOnConflictUpdate(shortExamItems, shortExams);
    });
  }

  // Get all short exams
  Future<List<ShortExamItem>> getAllShortExams() {
    return (select(
      shortExamItems,
    )..orderBy([(s) => OrderingTerm.desc(s.id)])).get();
  }

  // Pagination state management
  String? getLastLoadedShortExamId() {
    return _lastLoadedShortExamId;
  }

  void setLastLoadedShortExamId(String? shortExamId) {
    _lastLoadedShortExamId = shortExamId;
  }

  void resetPaginationState() {
    _lastLoadedShortExamId = null;
  }

  Stream<List<ShortExam>> watchAllShortExams() {
    return select(shortExamItems).map((e) {
      return ShortExam(
        id: e.id,
        title: e.title,
        examId: e.examId,
        duration: e.duration,
        price: e.price,
        rating: e.rating,
        star1Count: e.star1Count,
        star2Count: e.star2Count,
        star3Count: e.star3Count,
        star4Count: e.star4Count,
        star5Count: e.star5Count,
        enrollmentCount: e.enrollmentCount,
        startAt: e.startAt,
        createdAt: e.createdAt ?? DateTime.now(),
        updatedAt: e.updatedAt ?? DateTime.now(),
        isEnrolled: e.enrolled,
        thumbnail: e.thumbnail,
        teacherId: e.teacherId ?? 0,
        teacherName: e.teacherName,
        questions: null,
        answers: null,
        negativeMarking: e.negativeMarking,
        exam: null,
      );
    }).watch();
  }

  Stream<List<ShortExam>> watchAllEnrolledShortExams() {
    return (select(shortExamItems)..where((e) => e.enrolled.equals(true))).map((
      e,
    ) {
      return ShortExam(
        id: e.id,
        title: e.title,
        examId: e.examId,
        duration: e.duration,
        price: e.price,
        rating: e.rating,
        teacherId: e.teacherId ?? 0,
        teacherName: e.teacherName,
        star1Count: e.star1Count,
        star2Count: e.star2Count,
        star3Count: e.star3Count,
        star4Count: e.star4Count,
        star5Count: e.star5Count,
        enrollmentCount: e.enrollmentCount,
        startAt: e.startAt,
        createdAt: e.createdAt ?? DateTime.now(),
        updatedAt: e.updatedAt ?? DateTime.now(),
        isEnrolled: e.enrolled,
        thumbnail: e.thumbnail,
        questions: null,
        answers: null,
        negativeMarking: e.negativeMarking,
        exam: null,
      );
    }).watch();
  }

  Future<ShortExam?> getShortExamById(int id) {
    final query = select(shortExamItems)..where((e) => e.id.equals(id));

    return query.map((shortExam) {
      return ShortExam(
        id: shortExam.id,
        title: shortExam.title,
        examId: shortExam.examId,
        duration: shortExam.duration,
        price: shortExam.price,
        rating: shortExam.rating,
        teacherId: shortExam.teacherId ?? 0,
        teacherName: shortExam.teacherName,
        star1Count: shortExam.star1Count,
        star2Count: shortExam.star2Count,
        star3Count: shortExam.star3Count,
        star4Count: shortExam.star4Count,
        star5Count: shortExam.star5Count,
        enrollmentCount: shortExam.enrollmentCount,
        isEnrolled: shortExam.enrolled,
        startAt: shortExam.startAt,
        thumbnail: shortExam.thumbnail,
        createdAt: shortExam.createdAt ?? DateTime.now(),
        updatedAt: shortExam.updatedAt ?? DateTime.now(),
        exam: null,
        questions: null,
        answers: null,
      );
    }).getSingleOrNull();
  }

  Stream<ShortExam?> watchShortExamById(int id) {
    final query = select(shortExamItems)..where((e) => e.id.equals(id));

    return query.map((shortExam) {
      return ShortExam(
        id: shortExam.id,
        title: shortExam.title,
        examId: shortExam.examId,
        duration: shortExam.duration,
        price: shortExam.price,
        rating: shortExam.rating,
        teacherId: shortExam.teacherId ?? 0,
        teacherName: shortExam.teacherName,
        star1Count: shortExam.star1Count,
        star2Count: shortExam.star2Count,
        star3Count: shortExam.star3Count,
        star4Count: shortExam.star4Count,
        star5Count: shortExam.star5Count,
        enrollmentCount: shortExam.enrollmentCount,
        isEnrolled: shortExam.enrolled,
        startAt: shortExam.startAt,
        thumbnail: shortExam.thumbnail,
        createdAt: shortExam.createdAt ?? DateTime.now(),
        updatedAt: shortExam.updatedAt ?? DateTime.now(),
        questions: null,
        answers: null,
        negativeMarking: shortExam.negativeMarking,
        exam: null,
      );
    }).watchSingleOrNull();
  }

  Future<ShortExam?> getShortExamByIdWithExam(int id) {
    final query = select(shortExamItems).join([
      innerJoin(examItems, examItems.id.equalsExp(shortExamItems.examId)),
    ])..where(shortExamItems.id.equals(id));

    return query.map((result) {
      var shortExam = result.readTable(shortExamItems);
      var exam = result.readTable(examItems);
      return ShortExam(
        id: shortExam.id,
        title: shortExam.title,
        examId: shortExam.examId,
        duration: shortExam.duration,
        price: shortExam.price,
        rating: shortExam.rating,
        teacherId: shortExam.teacherId ?? 0,
        teacherName: shortExam.teacherName,
        star1Count: shortExam.star1Count,
        star2Count: shortExam.star2Count,
        star3Count: shortExam.star3Count,
        star4Count: shortExam.star4Count,
        star5Count: shortExam.star5Count,
        enrollmentCount: shortExam.enrollmentCount,
        isEnrolled: shortExam.enrolled,
        startAt: shortExam.startAt,
        thumbnail: shortExam.thumbnail,
        createdAt: shortExam.createdAt ?? DateTime.now(),
        updatedAt: shortExam.updatedAt ?? DateTime.now(),
        questions: null,
        answers: null,
        negativeMarking: shortExam.negativeMarking,
        exam: Exam(id: exam.id, name: exam.name, teacherId: exam.teacherId),
      );
    }).getSingleOrNull();
  }

  Stream<ShortExam?> watchShortExamByIdWithExam(int id) {
    final query = select(shortExamItems).join([
      innerJoin(examItems, examItems.id.equalsExp(shortExamItems.examId)),
    ])..where(shortExamItems.id.equals(id));

    return query.map((result) {
      var shortExam = result.readTable(shortExamItems);
      var exam = result.readTable(examItems);
      return ShortExam(
        id: shortExam.id,
        title: shortExam.title,
        examId: shortExam.examId,
        duration: shortExam.duration,
        price: shortExam.price,
        rating: shortExam.rating,
        teacherId: shortExam.teacherId ?? 0,
        teacherName: shortExam.teacherName,
        star1Count: shortExam.star1Count,
        star2Count: shortExam.star2Count,
        star3Count: shortExam.star3Count,
        star4Count: shortExam.star4Count,
        star5Count: shortExam.star5Count,
        enrollmentCount: shortExam.enrollmentCount,
        isEnrolled: shortExam.enrolled,
        startAt: shortExam.startAt,
        createdAt: shortExam.createdAt ?? DateTime.now(),
        updatedAt: shortExam.updatedAt ?? DateTime.now(),
        questions: null,
        thumbnail: shortExam.thumbnail,
        answers: null,
        negativeMarking: shortExam.negativeMarking,
        exam: Exam(id: exam.id, name: exam.name, teacherId: exam.teacherId),
      );
    }).watchSingleOrNull();
  }

  Stream<List<ShortExam>> watchAllShortExamsOfTeacher(int teacherId) {
    final query = select(shortExamItems).join([
      innerJoin(examItems, examItems.id.equalsExp(shortExamItems.examId)),
    ])..where(examItems.teacherId.equals(teacherId));

    return query.map((result) {
      var shortExam = result.readTable(shortExamItems);
      var exam = result.readTable(examItems);
      return ShortExam(
        id: shortExam.id,
        title: shortExam.title,
        examId: shortExam.examId,
        duration: shortExam.duration,
        price: shortExam.price,
        rating: shortExam.rating,
        star1Count: shortExam.star1Count,
        star2Count: shortExam.star2Count,
        star3Count: shortExam.star3Count,
        star4Count: shortExam.star4Count,
        star5Count: shortExam.star5Count,
        enrollmentCount: shortExam.enrollmentCount,
        isEnrolled: shortExam.enrolled,
        startAt: shortExam.startAt,
        thumbnail: shortExam.thumbnail,
        createdAt: shortExam.createdAt ?? DateTime.now(),
        updatedAt: shortExam.updatedAt ?? DateTime.now(),
        questions: null,
        answers: null,
        negativeMarking: shortExam.negativeMarking,
        teacherId: shortExam.teacherId ?? 0,
        teacherName: shortExam.teacherName,
        exam: Exam(id: exam.id, name: exam.name, teacherId: exam.teacherId),
      );
    }).watch();
  }

  Future<bool> updateEnrollmentStatus(int examId) async {
    final query = update(shortExamItems)..where((e) => e.id.equals(examId));
    await query.write(const ShortExamItemsCompanion(enrolled: Value(true)));
    return true;
  }

  Future<bool> updateStartAtStatus(int examId, DateTime startAt) async {
    final query = update(shortExamItems)..where((e) => e.id.equals(examId));
    await query.write(ShortExamItemsCompanion(startAt: Value(startAt)));
    return true;
  }
}
