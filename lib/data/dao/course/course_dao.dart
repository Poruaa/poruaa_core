import 'package:drift/drift.dart';
import 'package:poruaa_core/domain/models/course/course.dart';
import '../db/database.dart'; // import your drift database class

part 'course_dao.g.dart'; // necessary for drift to generate DAO code

@DriftAccessor(
  tables: [CourseItems],
) // This connects the DAO to the Courses table
class CourseDao extends DatabaseAccessor<AppDatabase> with _$CourseDaoMixin {
  CourseDao(super.db);

  // Pagination state - simple variable for session-only storage
  String? _lastLoadedCourseId;

  // Insert a course
  Future<int> insertCourse(CourseItemsCompanion course) {
    return into(courseItems).insert(course);
  }

  Future insertCourseOrUpdate(CourseItemsCompanion course) {
    return into(courseItems).insertOnConflictUpdate(course);
  }

  Future<void> insertAllCourses(Iterable<CourseItemsCompanion> courses) async {
    await batch((batch) async {
      batch.insertAllOnConflictUpdate(courseItems, courses);
    });
  }

  // Get all courses
  Future<List<CourseItem>> getAllCourses() {
    return (select(
      courseItems,
    )..orderBy([(c) => OrderingTerm.desc(c.id)])).get();
  }

  // Pagination state management
  String? getLastLoadedCourseId() {
    return _lastLoadedCourseId;
  }

  void setLastLoadedCourseId(String? courseId) {
    _lastLoadedCourseId = courseId;
  }

  void resetPaginationState() {
    _lastLoadedCourseId = null;
  }

  Stream<List<Course>> watchAllCourses() {
    return select(courseItems).map((e) {
      return Course.fromItem(e);
    }).watch();
  }

  Stream<List<Course>> watchAllEnrolledCourses() {
    return (select(courseItems)..where((e) => e.isEnrolled.equals(true))).map((
      e,
    ) {
      return Course.fromItem(e);
    }).watch();
  }

  Future<List<CourseItem>> getAllCoursesOfTeacher(int teacherId) {
    return (select(
      courseItems,
    )..where((itm) => itm.teacherId.equals(teacherId))).get();
  }

  Stream<List<Course>> watchAllCoursesOfTeacher(int teacherId) {
    return (select(courseItems)
          ..where((tbl) => tbl.teacherId.equals(teacherId)))
        .map((e) => Course.fromItem(e))
        .watch();
  }

  // Get a course by ID
  Future<CourseItem?> getCourseById(int id) {
    return (select(
      courseItems,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  Stream<Course?> watchCourseById(int courseId) {
    var query = (select(courseItems)..where((e) => e.id.equals(courseId))).map((
      row,
    ) {
      return Course.fromItem(row);
    });
    return query.watchSingleOrNull();
  }

  // Update a course
  Future<bool> updateCourse(CourseItemsCompanion course) {
    return update(courseItems).replace(course);
  }

  Future<void> replaceAllCourses(
    Iterable<CourseItemsCompanion> courses,
    int teacherId,
  ) async {
    await transaction(() async {
      await (delete(
        courseItems,
      )..where((item) => item.teacherId.equals(teacherId))).go();
      await batch((batch) async {
        batch.insertAll(courseItems, courses);
      });
    });
  }

  Future<int> updateCourseEnrollmentToTrue(int courseId) async {
    final query = update(courseItems)..where((e) => e.id.equals(courseId));
    await query.write(const CourseItemsCompanion(isEnrolled: Value(true)));
    return 1;
  }

  Future<int> updateCourseEnrollmentToFalse(int courseId) async {
    final query = update(courseItems)..where((e) => e.id.equals(courseId));
    await query.write(const CourseItemsCompanion(isEnrolled: Value(false)));
    return 1;
  }

  // Delete a course
  Future<int> deleteCourse(int id) {
    return (delete(courseItems)..where((tbl) => tbl.id.equals(id))).go();
  }
}
