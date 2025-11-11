import 'package:drift/drift.dart';
import 'package:poruaa_core/data/services/exam/model/exam_model.dart';
import '../db/database.dart'; // import your drift database class

part 'exam_dao.g.dart'; // necessary for drift to generate DAO code

@DriftAccessor(
  tables: [ExamItems],
) // This connects the DAO to the Courses table
class ExamDao extends DatabaseAccessor<AppDatabase> with _$ExamDaoMixin {
  ExamDao(super.db);

  Future<int> insertExam(ExamItemsCompanion exam) async {
    return into(examItems).insertOnConflictUpdate(exam);
  }

  Future<void> insertAllExams(Iterable<ExamItemsCompanion> exams) async {
    return batch((batch) {
      batch.insertAllOnConflictUpdate(examItems, exams);
    });
  }

  Future<List<ExamItem>> getAllExams() async {
    return select(examItems).get();
  }

  Future<List<ExamItem>> getAllExamsOfTeacher(int teacherId) async {
    return (select(
      examItems,
    )..where((itm) => itm.teacherId.equals(teacherId))).get();
  }

  Stream<List<ExamDTO>> watchAllExams() {
    return select(
      examItems,
    ).map((e) => ExamDTO(e.id, e.name, e.teacherId)).watch();
  }

  Stream<List<ExamDTO>> watchAllExamsOfTeacher(int teacherId) {
    return (select(examItems)..where((itm) => itm.teacherId.equals(teacherId)))
        .map((e) => ExamDTO(e.id, e.name, e.teacherId))
        .watch();
  }

  Future<ExamItem?> getExamById(int id) async {
    return (select(
      examItems,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  Stream<ExamItem?> watchExamById(int id) {
    return (select(
      examItems,
    )..where((tbl) => tbl.id.equals(id))).watchSingleOrNull();
  }

  Future<bool> updateExam(ExamItemsCompanion exam) async {
    return update(examItems).replace(exam);
  }

  Future<int> deleteExam(int id) async {
    return (delete(examItems)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<int> deleteAllExams() async {
    return (delete(examItems)).go();
  }

  Future<void> replaceAllExams(
    List<ExamItemsCompanion> exams,
    int teacherId,
  ) async {
    await transaction(() async {
      await (delete(
        examItems,
      )..where((itm) => itm.teacherId.equals(teacherId))).go();
      await batch((batch) {
        batch.insertAll(examItems, exams);
      });
    });
  }

  // // Insert a course
  // Future<int> insertCourse(CoursesCompanion course) {
  //   return into(courses).insert(course);
  // }

  // // Get all courses
  // Future<List<Course>> getAllCourses() {
  //   return select(courses).get();
  // }

  // Stream<List<Course>> watchAllCourses() {
  //   return select(courses).watch();
  // }

  // // Get a course by ID
  // Future<Course?> getCourseById(int id) {
  //   return (select(courses)..where((tbl) => tbl.id.equals(id)))
  //       .getSingleOrNull();
  // }

  // // Update a course
  // Future<bool> updateCourse(Course course) {
  //   return update(courses).replace(course);
  // }

  // // Delete a course
  // Future<int> deleteCourse(int id) {
  //   return (delete(courses)..where((tbl) => tbl.id.equals(id))).go();
  // }
}
