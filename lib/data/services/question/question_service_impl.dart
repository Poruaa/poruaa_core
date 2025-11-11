import 'dart:convert';

import 'package:poruaa_core/data/services/authorized_api/authorized_api_service.dart';
import 'package:poruaa_core/data/services/question/model/question_model.dart';
import 'package:poruaa_core/data/services/question/question_service.dart';
import 'package:poruaa_core/utils/result.dart';

class QuestionServiceImpl extends QuestionService {
  final AuthorizedApiService _apiService;
  QuestionServiceImpl(AuthorizedApiService apiService)
    : _apiService = apiService;

  @override
  Future<Result<List<QuestionModel>>> getQuestionsOfExam(
    int teacherId,
    int examId,
  ) async {
    var result = await _apiService.get(
      "teachers/$teacherId/exams/$examId/questions",
    );
    switch (result) {
      case Ok():
        var response = result.value;
        var body = response.body;
        var jsonBody = jsonDecode(body);
        if (jsonBody is List) {
          try {
            var courses = jsonBody
                .map((e) => QuestionModel.fromJson(e))
                .toList();
            return Result.ok(courses);
          } catch (e) {
            return Result.error("Parse error");
          }
        } else {
          return Result.error("Parse error");
        }
      case Err():
        return Result.error("error");
    }
  }

  @override
  Future<Result<List<QuestionModel>>> replaceAll({
    required int teacherId,
    required int examId,
    required List<QuestionModel> questions,
  }) async {
    var body = questions.map((e) => e.toInputJson()).toList();
    var result = await _apiService.post(
      "teachers/$teacherId/exams/$examId/questions/all",
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    switch (result) {
      case Ok():
        var response = result.value;
        var statusCode = response.statusCode;
        if (statusCode != 200) {
          return Result.error(response.body);
        }
        var body = response.body;
        var jsonBody = jsonDecode(body);
        if (jsonBody is List) {
          try {
            var courses = jsonBody
                .map((e) => QuestionModel.fromJson(e))
                .toList();
            return Result.ok(courses);
          } catch (e) {
            return Result.error("Parse error");
          }
        } else {
          return Result.error("Parse error");
        }
      // var course = QuestionModel.fromJson(jsonBody);
      // return Result.ok(course);
      case Err():
        return Result.error("error");
    }
  }
}
