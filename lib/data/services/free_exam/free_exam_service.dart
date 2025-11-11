import 'dart:convert';
import 'dart:typed_data';

import 'package:poruaa_core/data/services/authorized_api/authorized_api_service.dart';
import 'package:poruaa_core/data/services/free_exam/model/free_exam_model.dart';
import 'package:poruaa_core/data/services/free_exam/model/free_exam_result_dto.dart';
import 'package:poruaa_core/data/services/free_exam/model/free_exam_result_summary_dto.dart';
import 'package:poruaa_core/data/services/free_exam/model/free_exam_individual_result_dto.dart';
import 'package:poruaa_core/domain/models/pagination/pagination_state.dart';
import 'package:poruaa_core/utils/result.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class FreeExamService {
  final AuthorizedApiService _apiService;

  FreeExamService(this._apiService);

  // Public endpoints (no authentication required)
  Future<Result<PaginatedResponse<FreeExamDTO>>> getFreeExamsPaginated(
    PaginationParams params,
  ) async {
    try {
      // Build query parameters
      final queryParams = <String, String>{'limit': params.limit.toString()};

      if (params.cursor != null) {
        queryParams['cursor'] = params.cursor!;
      }

      final queryString = queryParams.entries
          .map(
            (e) =>
                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
          )
          .join('&');

      var result = await _apiService.get("free-exams?$queryString");
      if (result case Ok()) {
      } else {
        return Result.error("Something went wrong");
      }
      var response = result.value;
      if (response.statusCode != 200) {
        return Result.error("Something went wrong");
      }
      var body = response.body;
      var jsonBody = jsonDecode(body);

      if (jsonBody is Map<String, dynamic>) {
        var items = (jsonBody['data'] as List)
            .map((e) => FreeExamDTO.fromJson(e))
            .toList();

        var paginatedResponse = PaginatedResponse<FreeExamDTO>(
          items: items,
          nextCursor: jsonBody['next_cursor'] as String?,
          hasMore: jsonBody['has_more'] as bool? ?? false,
          total: jsonBody['total'] as int? ?? 0,
        );

        return Result.ok(paginatedResponse);
      } else {
        return Result.error("Something went wrong");
      }
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<FreeExamDTO>> getFreeExamById(int id) async {
    try {
      var result = await _apiService.get("free-exams/$id");
      if (result case Ok()) {
      } else {
        return Result.error("Something went wrong");
      }
      var response = result.value;
      if (response.statusCode != 200) {
        return Result.error("Something went wrong");
      }
      var body = response.body;
      var jsonBody = jsonDecode(body);
      return Result.ok(FreeExamDTO.fromJson(jsonBody));
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  // Student endpoints
  Future<Result<PaginatedResponse<FreeExamDTO>>>
  getFreeExamsOfStudentByMePaginated(PaginationParams params) async {
    try {
      // Build query parameters
      final queryParams = <String, String>{'limit': params.limit.toString()};

      if (params.cursor != null) {
        queryParams['cursor'] = params.cursor!;
      }

      final queryString = queryParams.entries
          .map(
            (e) =>
                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
          )
          .join('&');

      var result = await _apiService.get(
        "students/me/free-exams/paginated?$queryString",
      );
      if (result case Ok()) {
      } else {
        return Result.error("Something went wrong");
      }
      var response = result.value;
      if (response.statusCode != 200) {
        return Result.error("Something went wrong");
      }
      var body = response.body;
      var jsonBody = jsonDecode(body);

      if (jsonBody is Map<String, dynamic>) {
        var items = (jsonBody['items'] as List)
            .map((e) => FreeExamDTO.fromJson(e))
            .toList();

        var paginatedResponse = PaginatedResponse<FreeExamDTO>(
          items: items,
          nextCursor: jsonBody['next_cursor'] as String?,
          hasMore: jsonBody['has_more'] as bool? ?? false,
          total: jsonBody['total'] as int? ?? 0,
        );

        return Result.ok(paginatedResponse);
      } else {
        return Result.error("Something went wrong");
      }
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<FreeExamDTO>> getFreeExamOfStudentByMeAndByExamID(
    int examId,
  ) async {
    try {
      var result = await _apiService.get("students/me/free-exams/$examId");
      if (result case Ok()) {
      } else {
        return Result.error("Something went wrong");
      }
      var response = result.value;
      if (response.statusCode != 200) {
        return Result.error("Something went wrong");
      }
      var body = response.body;
      var jsonBody = jsonDecode(body);
      var freeExam = FreeExamDTO.fromJson(jsonBody);
      return Result.ok(freeExam);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<FreeExamDTO>> startFreeExamOfStudentByMeByFreeExamId(
    int freeExamId,
  ) async {
    var response = await _apiService.get(
      "students/me/free-exams/$freeExamId/start",
      headers: {"Content-Type": "application/json"},
    );
    switch (response) {
      case Ok():
        if (response.value.statusCode != 200) {
          return Result.error("Error starting free exam");
        }
        var body = response.value.body;
        var jsonBody = jsonDecode(body);
        var freeExam = FreeExamDTO.fromJson(jsonBody);
        return Result.ok(freeExam);
      case Err():
        return Result.error("Error starting free exam");
    }
  }

  Future<Result<FreeExamResultDTO>> submitFreeExamOfStudentByMeByFreeExamId(
    int freeExamId,
    Map<int, int> answers,
  ) async {
    var body = {
      "answers": answers.map((key, value) => MapEntry(key.toString(), value)),
    };
    var response = await _apiService.post(
      "students/me/free-exams/$freeExamId/submit",
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
    switch (response) {
      case Ok():
        if (response.value.statusCode != 200) {
          return Result.error("Error submitting free exam");
        }
        var body = response.value.body;
        var jsonBody = jsonDecode(body);
        var result = FreeExamResultDTO.fromMap(jsonBody);
        if (result == null) {
          return Result.error("Error parsing exam result");
        }
        return Result.ok(result);
      case Err():
        return Result.error("Error submitting free exam");
    }
  }

  Future<Result<List<FreeExamDTO>>>
  getAllParticipatedFreeExamsOfStudentByMe() async {
    try {
      var result = await _apiService.get("students/me/free-exams/enrolled");
      if (result case Ok()) {
      } else {
        return Result.error("Something went wrong");
      }
      var response = result.value;
      if (response.statusCode != 200) {
        return Result.error("Something went wrong");
      }
      var body = response.body;
      var jsonBody = jsonDecode(body);
      if (jsonBody is List) {
        var freeExams = jsonBody.map((e) => FreeExamDTO.fromJson(e)).toList();
        return Result.ok(freeExams);
      } else {
        return Result.error("Something went wrong");
      }
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<FreeExamResultDTO>> resultFreeExamOfStudentByMeByFreeExamId(
    int freeExamId,
  ) async {
    var response = await _apiService.get(
      "students/me/free-exams/$freeExamId/result",
      headers: {"Content-Type": "application/json"},
    );
    switch (response) {
      case Ok():
        if (response.value.statusCode != 200) {
          return Result.error(response.value.body);
        }
        var body = response.value.body;
        var jsonBody = jsonDecode(body);
        var result = FreeExamResultDTO.fromMap(jsonBody);
        if (result == null) {
          return Result.error("Error parsing exam result");
        }
        return Result.ok(result);
      case Err():
        return Result.error("Error getting free exam result");
    }
  }

  // Student endpoints for teacher's free exams
  Future<Result<List<FreeExamDTO>>> getFreeExamsOfStudentByMeByTeacherId(
    int teacherId,
  ) async {
    try {
      var result = await _apiService.get(
        "students/me/teachers/$teacherId/free-exams",
      );
      if (result case Ok()) {
      } else {
        return Result.error("Something went wrong");
      }
      var response = result.value;
      if (response.statusCode != 200) {
        return Result.error("Something went wrong");
      }
      var body = response.body;
      var jsonBody = jsonDecode(body);
      if (jsonBody is List) {
        var freeExams = jsonBody.map((e) => FreeExamDTO.fromJson(e)).toList();
        return Result.ok(freeExams);
      } else {
        return Result.error("Something went wrong");
      }
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  // Teacher endpoints
  Future<Result<List<FreeExamDTO>>> getFreeExamsOfTeacherByMe(
    int teacherId,
  ) async {
    try {
      var result = await _apiService.get("teachers/$teacherId/free-exams");
      if (result case Ok()) {
      } else {
        return Result.error("Something went wrong");
      }
      var response = result.value;
      if (response.statusCode != 200) {
        return Result.error("Something went wrong");
      }
      var body = response.body;
      var jsonBody = jsonDecode(body);
      if (jsonBody is List) {
        var freeExams = jsonBody.map((e) => FreeExamDTO.fromJson(e)).toList();
        return Result.ok(freeExams);
      } else {
        return Result.error("Something went wrong");
      }
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<FreeExamDTO>> createFreeExam(
    int teacherId,
    FreeExamDTO freeExam,
  ) async {
    try {
      var result = await _apiService.post(
        "teachers/$teacherId/free-exams",
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(freeExam.toJson()),
      );
      if (result case Ok()) {
      } else {
        return Result.error("Something went wrong");
      }
      var response = result.value;
      if (response.statusCode != 201) {
        return Result.error(response.body.toString());
      }
      var body = response.body;
      var jsonBody = jsonDecode(body);
      if (jsonBody is Map<String, dynamic>) {
        var freeExam = FreeExamDTO.fromJson(jsonBody);
        return Result.ok(freeExam);
      } else {
        return Result.error("Something went wrong");
      }
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<FreeExamDTO>> updateFreeExam(
    int teacherId,
    FreeExamDTO freeExam,
    int id,
  ) async {
    try {
      var result = await _apiService.put(
        "teachers/$teacherId/free-exams/$id",
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(freeExam.toJson()),
      );
      if (result case Ok()) {
      } else {
        return Result.error("Something went wrong");
      }
      var response = result.value;
      if (response.statusCode != 200) {
        return Result.error("Something went wrong");
      }
      var body = response.body;
      var jsonBody = jsonDecode(body);
      if (jsonBody is Map<String, dynamic>) {
        var freeExam = FreeExamDTO.fromJson(jsonBody);
        return Result.ok(freeExam);
      } else {
        return Result.error("Something went wrong");
      }
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<bool>> deleteFreeExam(int teacherId, int id) async {
    try {
      var result = await _apiService.delete(
        "teachers/$teacherId/free-exams/$id",
        headers: {"Content-Type": "application/json"},
      );
      if (result case Ok()) {
      } else {
        return Result.error("Something went wrong");
      }
      var response = result.value;
      if (response.statusCode != 200) {
        return Result.error("Something went wrong");
      }
      return Result.ok(true);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<FreeExamDTO>> uploadFreeExamThumbnail(
    int teacherId,
    int id,
    Uint8List thumbnailBytes,
  ) async {
    final file = http.MultipartFile.fromBytes(
      'thumbnail',
      thumbnailBytes,
      filename: 'thumbnail.webp',
      contentType: MediaType('image', 'webp'),
    );

    final result = await _apiService.patchMultipart(
      "teachers/$teacherId/free-exams/$id/thumbnail",
      files: [file],
    );

    switch (result) {
      case Ok():
        final body = result.value.body;
        final code = result.value.statusCode;
        if (code != 200) {
          return Result.error(body);
        }
        final jsonBody = jsonDecode(body);
        final freeExam = FreeExamDTO.fromJson(jsonBody);
        return Result.ok(freeExam);
      case Err():
        return Result.error("Thumbnail upload failed.");
    }
  }

  // Teacher results endpoints
  Future<Result<List<FreeExamResultSummaryDto>>> getFreeExamResults(
    int teacherId,
    int freeExamId,
  ) async {
    var response = await _apiService.get(
      "teachers/$teacherId/free-exams/$freeExamId/results",
    );
    switch (response) {
      case Ok():
        if (response.value.statusCode != 200) {
          return Result.error(response.value.body);
        }
        var body = response.value.body;
        var jsonBody = jsonDecode(body);
        if (jsonBody is! List) {
          return Result.error("Error parsing exam results");
        }
        var results = jsonBody
            .map((e) => FreeExamResultSummaryDto.fromJson(e))
            .toList();
        return Result.ok(results);
      case Err():
        return Result.error("Error getting free exam results");
    }
  }

  Future<Result<FreeExamIndividualResultDTO>> getIndividualFreeExamResult(
    int teacherId,
    int freeExamId,
    int resultId,
  ) async {
    var response = await _apiService.get(
      "teachers/$teacherId/free-exams/$freeExamId/results/$resultId",
    );
    switch (response) {
      case Ok():
        if (response.value.statusCode != 200) {
          return Result.error(response.value.body);
        }
        var body = response.value.body;
        var jsonBody = jsonDecode(body);
        var result = FreeExamIndividualResultDTO.fromJson(jsonBody);
        return Result.ok(result);
      case Err():
        return Result.error("Error getting individual free exam result");
    }
  }
}
