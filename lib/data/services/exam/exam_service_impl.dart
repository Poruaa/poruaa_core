import 'dart:convert';

import 'package:poruaa_core/data/services/authorized_api/authorized_api_service.dart';
import 'package:poruaa_core/data/services/exam/exam_service.dart';
import 'package:poruaa_core/data/services/exam/model/exam_model.dart';
import 'package:poruaa_core/utils/result.dart';

class ExamServiceImpl extends ExamService {
  final AuthorizedApiService _apiService;
  ExamServiceImpl(AuthorizedApiService apiService) : _apiService = apiService;

  @override
  Future<Result<List<ExamDTO>>> getExamsOfTeacher(int teacherId) async {
    var result = await _apiService.get("teachers/$teacherId/exams");
    switch (result) {
      case Ok():
        var response = result.value;
        var body = response.body;
        var jsonBody = jsonDecode(body);
        if (jsonBody is List) {
          var courses = jsonBody.map((e) => ExamDTO.fromJson(e)).toList();
          return Result.ok(courses);
        } else {
          return Result.error("Parse error");
        }
      case Err():
        return Result.error("error");
    }
  }

  @override
  Future<Result<ExamDTO>> create(int teacherId, String name) async {
    var json = {"name": name};
    var result = await _apiService.post(
      "teachers/$teacherId/exams",
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(json),
    );

    switch (result) {
      case Ok():
        var statusCode = result.value.statusCode;
        if (statusCode != 201) {
          return Result.error(result.value.body);
        }
        var response = result.value;
        var body = response.body;
        var jsonBody = jsonDecode(body);
        var course = ExamDTO.fromJson(jsonBody);
        return Result.ok(course);
      case Err():
        return Result.error("error");
    }
  }

  @override
  Future<bool> update(int teacherId, int id, String name) async {
    var json = {"name": name};
    var result = await _apiService.put(
      "teachers/$teacherId/exams/$id",
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

  @override
  Future<Result<bool>> delete(int teacherId, int id) async {
    var result = await _apiService.delete("teachers/$teacherId/exams/$id");
    switch (result) {
      case Ok():
        var response = result.value;
        if (response.statusCode != 200) return Result.error(result.value.body);
        return Result.ok(true);
      case Err():
        return Result.error("error");
    }
  }

  @override
  Future<Result<ExamDTO>> getExamOfTeacherById(
    int teacherId,
    int examId,
  ) async {
    var result = await _apiService.get("teachers/$teacherId/exams/$examId");
    switch (result) {
      case Ok():
        var response = result.value;
        if (response.statusCode != 200) return Result.error(result.value.body);
        try {
          return Result.ok(ExamDTO.fromJson(jsonDecode(response.body)));
        } catch (_) {
          return Result.error("Parse error");
        }
      case Err():
        return Result.error("Connection error");
    }
  }

  //   Future<bool> deleteExam(int id) async {
  //     var response = await _apiService.delete(
  //       "course/exam/$id",
  //     );
  //     if (response.statusCode == 200) {
  //       return true;
  //     }
  //     return false;
  //   }
}
