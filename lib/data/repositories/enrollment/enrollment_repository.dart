import 'package:poruaa_core/data/dao/course/course_dao.dart';
import 'package:poruaa_core/data/repositories/user/user_repository.dart';
import 'package:poruaa_core/data/services/enrollment/enrollment_service.dart';
import 'package:poruaa_core/domain/models/enrollment/enrollment.dart';
import 'package:poruaa_core/domain/models/user/user.dart';
import 'package:poruaa_core/utils/result.dart';

class EnrollmentRepository {
  final EnrollmentService _service;
  final CourseDao _courseDao;
  final UserRepository _userRepository;
  const EnrollmentRepository(
    this._service,
    this._courseDao,
    this._userRepository,
  );

  Future<Result<List<Student>>> getStudentsOfCourseById(int courseId) async {
    var result = await _service.getEnrollmentStudentsOfCourseById(
      _userRepository.getCurrentUserId,
      courseId,
    );
    if (result case Ok()) {
    } else {
      return Result.error("something wrong");
    }

    List<Enrollment> enrollments = [];

    var students = result.value.map((e) {
      var enrollment = Enrollment(
        id: e.id,
        studentId: e.studentId,
        courseId: e.courseId,
      );
      enrollments.add(enrollment);
      return Student(
        id: e.studentId,
        name: e.name,
        phone: e.phone,
        fatherName: e.fatherName,
        fatherPhone: e.fatherPhone,
        collegeName: e.collegeName,
        hscSession: e.hscSession,
        division: e.division,
      );
    }).toList();
    return Result.ok(students);
  }

  Future<Result<void>> addEnrollmentsOfStudentByMeByCourseId(
    int courseId,
  ) async {
    var result = await _service.addEnrollmentsOfStudentByMeByCourseId(courseId);
    if (result case Ok()) {
    } else {
      return Result.error("something wrong");
    }

    await _courseDao.updateCourseEnrollmentToTrue(courseId);
    return Result.ok(null);
  }

  Future<Result<void>> leaveCourse(int courseId) async {
    var result = await _service.leaveCourse(courseId);
    if (result case Ok()) {
    } else if (result case Err(:final error)) {
      return Result.error(error?.toString() ?? "Failed to leave course");
    }

    await _courseDao.updateCourseEnrollmentToFalse(courseId);
    return Result.ok(null);
  }
}
