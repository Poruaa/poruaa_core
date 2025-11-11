import 'dart:convert';

import 'package:poruaa_core/data/services/api/model/response.dart';
import 'package:poruaa_core/data/services/authorized_api/authorized_api_service.dart';
import 'package:poruaa_core/data/services/course_exam/model/course_exam_dto.dart';
import 'package:poruaa_core/data/services/course_exam/model/course_exam_result_with_student_dto.dart';
import 'package:poruaa_core/data/services/course_exam/model/exam_result_model.dart';
import 'package:poruaa_core/data/services/course_exam/model/publish_ranks_response.dart';
import 'package:poruaa_core/utils/result.dart';

class CourseExamService {
  final AuthorizedApiService _apiService;
  CourseExamService(this._apiService);

  Future<Result<List<CourseExamModel>>> getCourseExams(
    int teacherId,
    int courseId,
  ) async {
    var response = await _apiService.get(
      "teachers/$teacherId/courses/$courseId/exams",
    );
    switch (response) {
      case Ok():
        if (response.value.statusCode != 200) {
          return Result.error("Error getting course exams");
        }
        var body = response.value.body;
        var jsonBody = jsonDecode(body);
        if (jsonBody is! List) {
          return Result.error("Error getting course exams");
        }
        var list = jsonBody;
        return Result.ok(list.map((e) => CourseExamModel.fromJson(e)).toList());
      case Err():
        return Result.error("Error getting course exams");
    }
  }

  Future<Result<CourseExamModel>> addExam(
    int teacherId,
    int courseId,
    int examId,
    String title,
    DateTime startAt,
    DateTime endAt,
    double negativeMarking,
  ) async {
    var json = {
      "course_id": courseId,
      "exam_id": examId,
      "title": title,
      "start_at": startAt.toUtc().toIso8601String(),
      "end_at": endAt.toUtc().toIso8601String(),
      "free": false,
      "negative_marking": negativeMarking,
    };
    try {
      var response = await _apiService.post(
        "teachers/$teacherId/courses/$courseId/exams/$examId",
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(json),
      );

      switch (response) {
        case Ok():
          var body = response.value.body;
          var statusCode = response.value.statusCode;
          if (statusCode == 200) {
            var jsonBody = jsonDecode(body);
            return Result.ok(CourseExamModel.fromJson(jsonBody));
          } else {
            return Result.error(body);
          }
        case Err():
          return Result.error("Connection error");
      }
    } catch (e) {
      return Result.error("Connection error");
    }
  }

  Future<bool> update(
    int teacherId,
    int id,
    int examId,
    int courseId,
    String title,
    DateTime startAt,
    DateTime endAt,
    bool free,
    double? negativeMarking,
  ) async {
    var courseExam = CourseExamModel.zero().copyWith(
      id: id,
      examId: examId,
      courseId: courseId,
      title: title,
      startAt: startAt,
      endAt: endAt,
      free: free,
      negativeMarking: negativeMarking,
    );

    var json = courseExam.toJson();
    var result = await _apiService.put(
      "teachers/$teacherId/course-exams/$id",
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(json),
    );

    switch (result) {
      case Ok():
        var response = result.value;
        if (response.statusCode != 200) return false;
        return true;
      case Err():
        return false;
    }
  }

  Future<Result<List<CourseExamModel>>> getAllCourseExamsOfStudentByMe() async {
    var response = await _apiService.get("students/me/exams");
    switch (response) {
      case Ok():
        if (response.value.statusCode != 200) {
          return Result.error("Error getting course exams");
        }
        var body = response.value.body;
        var jsonBody = jsonDecode(body);
        if (jsonBody is! List) {
          return Result.error("Error getting course exams");
        }
        var list = jsonBody;
        return Result.ok(list.map((e) => CourseExamModel.fromJson(e)).toList());
      case Err():
        return Result.error("Error getting course exams");
    }
  }

  Future<Result<List<CourseExamModel>>> getCourseExamsOfStudentByMe(
    int courseId,
  ) async {
    var response = await _apiService.get("students/me/courses/$courseId/exams");
    switch (response) {
      case Ok():
        if (response.value.statusCode != 200) {
          return Result.error("Error getting course exams");
        }
        var body = response.value.body;
        var jsonBody = jsonDecode(body);
        if (jsonBody is! List) {
          return Result.error("Error getting course exams");
        }
        var list = jsonBody;
        return Result.ok(list.map((e) => CourseExamModel.fromJson(e)).toList());
      case Err():
        return Result.error("Error getting course exams");
    }
  }

  Future<Result<List<CourseExamModel>>> getFreeCourseExamsOfStudentByMe(
    int courseId,
  ) async {
    var response = await _apiService.get("courses/$courseId/free-exams");
    switch (response) {
      case Ok():
        if (response.value.statusCode != 200) {
          return Result.error("Error getting course exams");
        }
        var body = response.value.body;
        var jsonBody = jsonDecode(body);
        if (jsonBody is! List) {
          return Result.error("Error getting course exams");
        }
        var list = jsonBody;
        return Result.ok(list.map((e) => CourseExamModel.fromJson(e)).toList());
      case Err():
        return Result.error("Error getting course exams");
    }
  }

  Future<Result<CourseExamModel>> getCourseExamOfStudentByMeByCourseExamId(
    int courseExamId,
  ) async {
    var response = await _apiService.get("students/me/exams/$courseExamId");
    switch (response) {
      case Ok():
        if (response.value.statusCode != 200) {
          return Result.error("Error getting course exams");
        }
        var body = response.value.body;
        var jsonBody = jsonDecode(body);
        return Result.ok(CourseExamModel.fromJson(jsonBody));
      case Err():
        return Result.error("Error getting course exams");
    }
  }

  Future<Result<CourseExamModel>> startCourseExamOfStudentByMeByCourseExamId(
    int courseExamId,
  ) async {
    var response = await _apiService.get(
      "students/me/exams/$courseExamId/start",
    );
    switch (response) {
      case Ok():
        if (response.value.statusCode != 200) {
          return Result.error("Error getting course exams");
        }
        var body = response.value.body;
        var jsonBody = jsonDecode(body);
        return Result.ok(CourseExamModel.fromJson(jsonBody));
      case Err():
        return Result.error("Error getting course exams");
    }
  }

  Future<Result<ExamResultModel>> resultCourseExamOfStudentByMeByCourseExamId(
    int courseExamId,
  ) async {
    var response = await _apiService.get(
      "students/me/exams/$courseExamId/result",
    );
    switch (response) {
      case Ok():
        if (response.value.statusCode != 200) {
          return Result.error(response.value.body);
        }
        var body = response.value.body;
        var jsonBody = jsonDecode(body);
        var result = ExamResultModel.fromMap(jsonBody);
        if (result == null) {
          return Result.error("Error parsing exam result");
        }
        return Result.ok(result);
      case Err():
        return Result.error("Error getting course exams");
    }
  }

  Future<Result<List<CourseExamResultWithStudentDto>>>
  getCourseExamResultsOfCourseExamById(int teacherId, int courseExamId) async {
    var response = await _apiService.get(
      "teachers/$teacherId/course-exams/$courseExamId/results",
    );
    switch (response) {
      case Ok():
        if (response.value.statusCode != 200) {
          return Result.error(response.value.body);
        }
        var body = response.value.body;
        var jsonBody = jsonDecode(body);
        if (jsonBody is! List) {
          return Result.error("Error parsing exam result");
        }
        var result = jsonBody
            .map((e) => CourseExamResultWithStudentDto.fromJson(e))
            .toList();
        return Result.ok(result);
      case Err():
        return Result.error("Error getting course exams");
    }
  }

  Future<Result<ExamResultModel>> submitCourseExamOfStudentByMeByCourseExamId(
    int courseExamId,
    Map<int, int> answers,
  ) async {
    var body = {
      "answers": answers.map((key, value) => MapEntry(key.toString(), value)),
    };
    var response = await _apiService.post(
      "students/me/exams/$courseExamId/submit",
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
    switch (response) {
      case Ok():
        if (response.value.statusCode != 200) {
          return Result.error("Error getting course exams");
        }
        var body = response.value.body;
        var jsonBody = jsonDecode(body);
        var result = ExamResultModel.fromMap(jsonBody);
        if (result == null) {
          return Result.error("Error parsing exam result");
        }
        return Result.ok(result);
      case Err():
        return Result.error("Error getting course exams");
    }
  }

  Future<Result<CourseExamModel>> getCourseExamById(
    int teacherId,
    int id,
  ) async {
    var response = await _apiService.get(
      "teachers/$teacherId/course-exams/$id",
    );
    switch (response) {
      case Ok():
        if (response.value.statusCode != 200) {
          return Result.error("Error getting course exams");
        }
        var body = response.value.body;
        var jsonBody = jsonDecode(body);
        return Ok(CourseExamModel.fromJson(jsonBody));
      case Err():
        return Result.error("Error getting course exams");
    }
  }

  Future<Result<bool>> deleteCourseExam(int teacherId, int id) async {
    var response = await _apiService.delete(
      "teachers/$teacherId/course-exams/$id",
    );
    if (response is Ok<Response>) {
      if (response.value.statusCode == 200) {
        return Result.ok(true);
      } else {
        return Result.error(response.value.body);
      }
    }
    return Result.error("Connection error");
  }

  Future<Result<PublishRanksResponse>> publishCourseExamRanks(
    int teacherId,
    int courseExamId,
  ) async {
    var response = await _apiService.post(
      "teachers/$teacherId/course-exams/$courseExamId/publish-ranks",
      headers: {"Content-Type": "application/json"},
    );
    switch (response) {
      case Ok():
        if (response.value.statusCode == 200) {
          var body = response.value.body;
          var jsonBody = jsonDecode(body);
          var result = PublishRanksResponse.fromJson(jsonBody);
          return Result.ok(result);
        } else {
          return Result.error(response.value.body);
        }
      case Err():
        return Result.error("Connection error");
    }
  }

  Future<Result<CourseExamModel>> updateFreeStatus(
    int teacherId,
    int courseExamId,
    bool free,
  ) async {
    var json = {"free": free};
    var response = await _apiService.patch(
      "teachers/$teacherId/course-exams/$courseExamId/free-status",
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(json),
    );
    switch (response) {
      case Ok():
        if (response.value.statusCode == 200) {
          var body = response.value.body;
          var jsonBody = jsonDecode(body);
          return Result.ok(CourseExamModel.fromJson(jsonBody));
        } else {
          return Result.error(response.value.body);
        }
      case Err():
        return Result.error("Connection error");
    }
  }

  Future<Result<int>> clearCourseExamResults(
    int teacherId,
    int courseExamId,
  ) async {
    var response = await _apiService.delete(
      "teachers/$teacherId/course-exams/$courseExamId/clear-results",
    );
    switch (response) {
      case Ok():
        if (response.value.statusCode == 200) {
          var body = response.value.body;
          var jsonBody = jsonDecode(body);
          var deletedCount = jsonBody['deleted_count'] as int?;
          if (deletedCount != null) {
            return Result.ok(deletedCount);
          } else {
            return Result.error("Invalid response format");
          }
        } else {
          return Result.error(response.value.body);
        }
      case Err():
        return Result.error("Connection error");
    }
  }

  Future<Result<ExamResultModel>> getIndividualCourseExamResult(
    int teacherId,
    int courseExamId,
    int resultId,
  ) async {
    var response = await _apiService.get(
      "teachers/$teacherId/course-exams/$courseExamId/results/$resultId",
    );
    switch (response) {
      case Ok():
        if (response.value.statusCode == 200) {
          var body = response.value.body;
          var jsonBody = jsonDecode(body);
          var result = ExamResultModel.fromMap(jsonBody);
          if (result == null) {
            return Result.error("Error parsing exam result");
          }
          return Result.ok(result);
        } else {
          return Result.error(response.value.body);
        }
      case Err():
        return Result.error("Connection error");
    }
  }
}
