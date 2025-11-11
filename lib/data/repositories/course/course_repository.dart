import 'dart:typed_data';

import 'package:poruaa_core/domain/models/course/course.dart';
import 'package:poruaa_core/domain/models/pagination/pagination_state.dart';
import 'package:poruaa_core/utils/result.dart';

abstract class CourseRepository {
  Future<Result<List<Course>>> getCoursesOfTeacher(int teacherId);
  Future<Result<List<Course>>> getCoursesOfStudentByMeByTeacherId(
    int teacherId,
  );
  // Future<Result<List<Course>>> getAllCourses();
  // Future<Result<List<Course>>> getAllCoursesOfStudentByMe();
  Future<Result<PaginatedResponse<Course>>> getCoursesOfStudentByMePaginated(
    PaginationParams params,
  );
  Future<List<Course>> getAllCoursesFromCache();
  Future<Result<Course>> getCourseOfStudentByCourseId(
    int courseId, {
    bool refresh = false,
  });

  // Pagination state management
  String? getLastLoadedCourseId();
  void setLastLoadedCourseId(String? courseId);
  void resetPaginationState();
  Future<PaginationState<Course>> getPaginationState();
  Future<Result<List<Course>>> getAllEnrolledCoursesOfStudentByMe();

  // Stream<Result<List<Course>>?> get stream;
  Stream<Result<List<Course>>?> watchAll();
  Stream<Result<List<Course>>> watchAllCourses();
  Stream<Result<List<Course>>> watchAllEnrolledCoursesOfStudentByMe();
  // Future<Result<List<Course>>> getPopularCourseEnrollment();
  Stream<Result<List<Course>>?> watchAllOfTeacher(int teacherId);

  Future<Result<Course>> create(Course course);

  Future<Result<Course>> update(Course course);
  Future<Result> uploadCourseThumbnail(Course course, Uint8List thumbnail);
  Future<Result> updateCourseExpirationDate(Course course, DateTime expiresAt);
  Future<Result> publishCourse(Course course);
  Future<Result> unpublishCourse(Course course);

  Future<Result<Course>> getCourse(int id, {bool refresh = false});
  Stream<Result<Course>> watchCourse(int courseId);

  Future<Result<bool>> delete(int id);
}
