import 'package:drift/drift.dart';
import 'package:poruaa_core/data/services/course_exam/model/course_exam_dto.dart';
import '../db/database.dart'; // import your drift database class

part 'course_exam_dao.g.dart'; // necessary for drift to generate DAO code

@DriftAccessor(
  tables: [CourseExamItems, CourseItems, ExamItems],
) // This connects the DAO to the Courses table
class CourseExamDao extends DatabaseAccessor<AppDatabase>
    with _$CourseExamDaoMixin {
  CourseExamDao(super.db);

  Future<int> insertCourseExam(CourseExamItemsCompanion courseExam) async {
    return into(courseExamItems).insert(courseExam);
  }

  Future<List<CourseExamItem>> getAllCourseExams() async {
    return select(courseExamItems).get();
  }

  Stream<List<CourseExamItem>> watchAllCourseExams() {
    return select(courseExamItems).watch();
  }

  Future<CourseExamItem?> getCourseExamById(int id) async {
    return (select(
      courseExamItems,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  Stream<CourseExamModel?> watchCourseExamById(int id) {
    return (select(courseExamItems).join([
      innerJoin(
        courseItems,
        courseItems.id.equalsExp(courseExamItems.courseId),
      ),
      innerJoin(examItems, examItems.id.equalsExp(courseExamItems.examId)),
    ])..where(courseExamItems.id.equals(id))).map((result) {
      var courseItem = result.readTable(courseItems);
      var examItem = result.readTable(examItems);
      var courseExamItem = result.readTable(courseExamItems);

      return CourseExamModel(
        id: courseExamItem.id,
        examName: examItem.name,
        courseName: courseItem.name,
        price: courseItem.price,
        regularPrice: courseItem.regularPrice ?? courseItem.price,
        courseId: courseExamItem.courseId,
        examId: courseExamItem.examId,
        title: courseExamItem.title,
        startAt: courseExamItem.startAt,
        endAt: courseExamItem.endAt,
        free: courseExamItem.free,
        teacherId: courseItem.teacherId,
        negativeMarking: courseExamItem.negativeMarking,
      );
    }).watchSingleOrNull();
  }

  Future<CourseExamModel?> getFlatCourseExamById(int id) {
    return (select(courseExamItems).join([
      innerJoin(
        courseItems,
        courseItems.id.equalsExp(courseExamItems.courseId),
      ),
      innerJoin(examItems, examItems.id.equalsExp(courseExamItems.examId)),
    ])..where(courseExamItems.id.equals(id))).map((result) {
      var courseItem = result.readTable(courseItems);
      var examItem = result.readTable(examItems);
      var courseExamItem = result.readTable(courseExamItems);

      return CourseExamModel(
        id: courseExamItem.id,
        examName: examItem.name,
        courseName: courseItem.name,
        price: courseItem.price,
        regularPrice: courseItem.regularPrice ?? courseItem.price,
        courseId: courseExamItem.courseId,
        examId: courseExamItem.examId,
        title: courseExamItem.title,
        startAt: courseExamItem.startAt,
        endAt: courseExamItem.endAt,
        free: courseExamItem.free,
        teacherId: courseItem.teacherId,
        negativeMarking: courseExamItem.negativeMarking,
      );
    }).getSingleOrNull();
  }

  Future<bool> updateCourseExam(CourseExamItem courseExam) async {
    return update(courseExamItems).replace(courseExam);
  }

  Future<bool> updateCourseExamFreeStatus(int id, bool free) async {
    final query = update(courseExamItems)..where((tbl) => tbl.id.equals(id));
    await query.write(CourseExamItemsCompanion(free: Value(free)));
    return true;
  }

  Future<int> insertCourseExamOrUpdate(CourseExamItem courseExam) async {
    return into(courseExamItems).insertOnConflictUpdate(courseExam);
  }

  Future<int> deleteCourseExam(int id) async {
    return (delete(courseExamItems)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<int> deleteAllCourseExams() async {
    return (delete(courseExamItems)).go();
  }

  Future<void> replaceAllCourseExamsOfCourse(
    int id,
    List<CourseExamModel> courseExams,
  ) async {
    await transaction(() async {
      await (delete(
        courseExamItems,
      )..where((tbl) => tbl.courseId.equals(id))).go();
      await batch((batch) {
        batch.insertAllOnConflictUpdate(
          examItems,
          courseExams
              .map(
                (e) => ExamItemsCompanion.insert(
                  id: Value(e.examId),
                  name: e.examName,
                  teacherId: e.teacherId,
                  createdAt: Value(DateTime.now()),
                ),
              )
              .toList(),
        );
      });
      await batch((batch) {
        batch.insertAllOnConflictUpdate(
          courseExamItems,
          courseExams
              .map(
                (e) => CourseExamItemsCompanion.insert(
                  id: Value(e.id),
                  courseId: e.courseId,
                  examId: e.examId,
                  title: e.title,
                  free: Value(e.free),
                  startAt: e.startAt,
                  endAt: e.endAt,
                  negativeMarking: Value(e.negativeMarking ?? 0.25),
                ),
              )
              .toList(),
        );
      });
    });
  }

  Stream<List<CourseExamModel>> watchAllCourseExamsOfCourse(int id) {
    var query = select(courseExamItems).join([
      innerJoin(
        courseItems,
        courseItems.id.equalsExp(courseExamItems.courseId),
      ),
      innerJoin(examItems, examItems.id.equalsExp(courseExamItems.examId)),
    ])..where(courseExamItems.courseId.equals(id));
    return query.map((result) {
      var courseItem = result.readTable(courseItems);
      var examItem = result.readTable(examItems);
      var courseExamItem = result.readTable(courseExamItems);

      return CourseExamModel(
        id: courseExamItem.id,
        examName: examItem.name,
        courseName: courseItem.name,
        price: courseItem.price,
        regularPrice: courseItem.regularPrice ?? courseItem.price,
        courseId: courseExamItem.courseId,
        examId: courseExamItem.examId,
        title: courseExamItem.title,
        startAt: courseExamItem.startAt,
        endAt: courseExamItem.endAt,
        free: courseExamItem.free,
        teacherId: courseItem.teacherId,
        negativeMarking: courseExamItem.negativeMarking,
      );
    }).watch();
  }
}
