import 'dart:convert';

import 'package:poruaa_core/data/services/authorized_api/authorized_api_service.dart';
import 'package:poruaa_core/data/services/enrollment/dto/enrollment_student_dto.dart';
import 'package:poruaa_core/data/services/enrollment/dto/add_student_invoice_dto.dart';
import 'package:poruaa_core/data/services/enrollment/dto/add_exam_invoice_dto.dart';
import 'package:poruaa_core/data/services/enrollment/model/enrollment_model.dart';
// import 'package:poruaa_core/data/services/enrollment/model/flat_enrollment_model.dart';
import 'package:poruaa_core/utils/result.dart';

class EnrollmentService {
  final AuthorizedApiService _apiService;

  const EnrollmentService(this._apiService);

  Future<Result<List<EnrollmentStudentDto>>> getEnrollmentStudentsOfCourseById(
    int teacherId,
    int courseId,
  ) async {
    var result = await _apiService.get(
      'teachers/$teacherId/courses/$courseId/students',
      headers: {"Content-Type": "application/json"},
    );

    if (result case Ok()) {
    } else {
      return Result.error("Error getting enrollment students");
    }

    var response = result.value;

    var statusCode = response.statusCode;
    var body = response.body;
    if (statusCode != 200) {
      return Result.error(
        "Error getting enrollment students: ${response.body}",
      );
    }

    var json = jsonDecode(body);

    if (json is! List) {
      return Result.error("Error getting enrollment students: parse error");
    }

    try {
      var enrollments = json
          .map((e) => EnrollmentStudentDto.fromJson(e))
          .toList();
      return Result.ok(enrollments);
    } catch (e) {
      return Result.error("Error getting enrollment students: parse error");
    }
  }

  // Future<Result<List<FlatEnrollmentModel>>>
  //     getEnrollmentsOfStudentByMe() async {
  //   var result = await _apiService.get('students/me/enrollments', headers: {
  //     "Content-Type": "application/json",
  //   });

  //   if (result case Ok()) {
  //   } else {
  //     return Result.error("Not implemented");
  //   }

  //   var response = result.value;

  //   var statusCode = response.statusCode;
  //   var body = response.body;
  //   if (statusCode != 200) {
  //     return Result.error("Not implemented");
  //   }

  //   var json = jsonDecode(body);

  //   if (json is! List) {
  //     return Result.error("Not implemented");
  //   }

  //   var flatEnrollments =
  //       json.map((e) => FlatEnrollmentModel.fromMap(e)).toList();

  //   return Result.ok(flatEnrollments);
  // }

  Future<Result<EnrollmentModel>> addEnrollmentsOfStudentByMeByCourseId(
    int courseId,
  ) async {
    var input = {"course_id": courseId};

    var result = await _apiService.post(
      'students/me/enrollments',
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(input),
    );

    if (result case Ok()) {
    } else {
      return Result.error("Not implemented");
    }

    var response = result.value;

    var statusCode = response.statusCode;
    var body = response.body;
    if (statusCode != 201) {
      return Result.error("Not implemented");
    }

    var json = jsonDecode(body);

    if (json is! Map<String, dynamic>) {
      return Result.error("Not implemented");
    }

    var flatEnrollment = EnrollmentModel.fromMap(json);

    return Result.ok(flatEnrollment);
  }

  Future<Result<EnrollmentModel>> addStudentToCourseByTeacher(
    int teacherId,
    int courseId,
    int studentId,
  ) async {
    var input = {"student_id": studentId};

    var result = await _apiService.post(
      'teachers/$teacherId/courses/$courseId/add-student',
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(input),
    );

    if (result case Ok()) {
    } else {
      return Result.error("Failed to add student to course");
    }

    var response = result.value;

    var statusCode = response.statusCode;
    var body = response.body;
    if (statusCode != 201) {
      return Result.error("Failed to add student: ${response.body}");
    }

    var json = jsonDecode(body);

    if (json is! Map<String, dynamic>) {
      return Result.error("Failed to parse enrollment response");
    }

    var enrollment = EnrollmentModel.fromMap(json);

    return Result.ok(enrollment);
  }

  Future<Result<AddStudentInvoiceDto>> getAddStudentInvoice(
    int teacherId,
    int courseId,
    int studentId,
  ) async {
    var result = await _apiService.get(
      'teachers/$teacherId/courses/$courseId/add-student/invoice?student_id=$studentId',
      headers: {"Content-Type": "application/json"},
    );

    if (result case Ok()) {
    } else {
      return Result.error("Failed to get invoice data");
    }

    var response = result.value;

    var statusCode = response.statusCode;
    var body = response.body;
    if (statusCode != 200) {
      return Result.error("Failed to get invoice: ${response.body}");
    }

    var json = jsonDecode(body);

    if (json is! Map<String, dynamic>) {
      return Result.error("Failed to parse invoice response");
    }

    var invoice = AddStudentInvoiceDto.fromJson(json);

    return Result.ok(invoice);
  }

  Future<Result<AddExamInvoiceDto>> getAddExamInvoice(
    int teacherId,
    int courseId,
  ) async {
    var result = await _apiService.get(
      'teachers/$teacherId/courses/$courseId/add-exam/invoice',
      headers: {"Content-Type": "application/json"},
    );

    if (result case Ok()) {
    } else {
      return Result.error("Failed to get exam invoice data");
    }

    var response = result.value;

    var statusCode = response.statusCode;
    var body = response.body;
    if (statusCode != 200) {
      return Result.error("Failed to get exam invoice: ${response.body}");
    }

    var json = jsonDecode(body);

    if (json is! Map<String, dynamic>) {
      return Result.error("Failed to parse exam invoice response");
    }

    var invoice = AddExamInvoiceDto.fromJson(json);

    return Result.ok(invoice);
  }

  Future<Result<Map<String, dynamic>>> addExamToCourseByTeacher(
    int teacherId,
    int courseId,
    int examId,
    String title,
    DateTime startAt,
    DateTime endAt,
    bool free,
    double negativeMarking,
  ) async {
    var input = {
      "exam_id": examId,
      "title": title,
      "start_at": startAt.toUtc().toIso8601String(),
      "end_at": endAt.toUtc().toIso8601String(),
      "free": free,
      "negative_marking": negativeMarking,
    };

    var result = await _apiService.post(
      'teachers/$teacherId/courses/$courseId/add-exam',
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(input),
    );

    if (result case Ok()) {
    } else {
      return Result.error("Failed to add exam to course");
    }

    var response = result.value;

    var statusCode = response.statusCode;
    var body = response.body;
    if (statusCode != 200) {
      return Result.error("Failed to add exam: ${response.body}");
    }

    var json = jsonDecode(body);

    if (json is! Map<String, dynamic>) {
      return Result.error("Failed to parse add exam response");
    }

    return Result.ok(json);
  }

  Future<Result<Map<String, dynamic>>> leaveCourse(int courseId) async {
    var result = await _apiService.delete(
      'students/me/courses/$courseId/leave',
      headers: {"Content-Type": "application/json"},
    );

    if (result case Ok()) {
    } else {
      return Result.error("Failed to leave course");
    }

    var response = result.value;

    var statusCode = response.statusCode;
    var body = response.body;

    if (statusCode == 200) {
      var json = jsonDecode(body);
      if (json is! Map<String, dynamic>) {
        return Result.error("Failed to parse leave course response");
      }
      return Result.ok(json);
    } else if (statusCode == 400) {
      return Result.error("Invalid course_id");
    } else if (statusCode == 404) {
      return Result.error("You are not enrolled in this course");
    } else if (statusCode == 500) {
      return Result.error("Error leaving course");
    } else {
      return Result.error("Failed to leave course: ${response.body}");
    }
  }
}
