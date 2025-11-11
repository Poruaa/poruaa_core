import 'dart:convert';
import 'dart:typed_data';

import 'package:poruaa_core/data/services/authorized_api/authorized_api_service.dart';
import 'package:poruaa_core/data/services/short_exam/model/short_exam_model.dart';
import 'package:poruaa_core/data/services/short_exam/model/short_exam_result_dto.dart';
import 'package:poruaa_core/domain/models/pagination/pagination_state.dart';
import 'package:poruaa_core/utils/result.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class ShortExamService {
  final AuthorizedApiService _apiService;

  ShortExamService(this._apiService);

  Future<Result<List<ShortExamDTO>>> getShortExamsOfTeacherByMe(
    int teacherId,
  ) async {
    try {
      var result = await _apiService.get("teachers/$teacherId/short-exams");
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
        var shortExams = jsonBody.map((e) => ShortExamDTO.fromJson(e)).toList();
        return Result.ok(shortExams);
      } else {
        return Result.error("Something went wrong");
      }
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<ShortExamDTO>> createShortExam(
    int teacherId,
    ShortExamDTO shortExam,
  ) async {
    try {
      var result = await _apiService.post(
        "teachers/$teacherId/short-exams",
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(shortExam.toJson()),
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
        var shortExam = ShortExamDTO.fromJson(jsonBody);
        return Result.ok(shortExam);
      } else {
        return Result.error("Something went wrong");
      }
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<ShortExamDTO>> updateShortExam(
    int teacherId,
    ShortExamDTO shortExam,
    int id,
  ) async {
    try {
      var result = await _apiService.put(
        "teachers/$teacherId/short-exams/$id",
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(shortExam.toJson()),
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
        var shortExam = ShortExamDTO.fromJson(jsonBody);
        return Result.ok(shortExam);
      } else {
        return Result.error("Something went wrong");
      }
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<ShortExamDTO>> deleteShortExam(int teacherId, int id) async {
    try {
      var result = await _apiService.delete(
        "teachers/$teacherId/short-exams/$id",
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
      var body = response.body;
      var jsonBody = jsonDecode(body);
      if (jsonBody is Map<String, dynamic>) {
        var shortExam = ShortExamDTO.fromJson(jsonBody);
        return Result.ok(shortExam);
      } else {
        return Result.error("Something went wrong");
      }
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<ShortExamDTO>> getShortExamByExamId(int id) async {
    try {
      var result = await _apiService.get("short-exams/$id");
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
      return Result.ok(ShortExamDTO.fromJson(jsonBody));
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  // Future<Result<List<ShortExamDTO>>> getAllShortExamsOfStudentByMe() async {
  //   try {
  //     var result = await _apiService.get("students/me/short-exams");
  //     if (result case Ok()) {
  //     } else {
  //       return Result.error("Something went wrong");
  //     }
  //     var response = result.value;
  //     if (response.statusCode != 200) {
  //       return Result.error("Something went wrong");
  //     }
  //     var body = response.body;
  //     var jsonBody = jsonDecode(body);
  //     if (jsonBody is List) {
  //       var shortExams = jsonBody.map((e) => ShortExamDTO.fromJson(e)).toList();
  //       return Result.ok(shortExams);
  //     } else {
  //       return Result.error("Something went wrong");
  //     }
  //   } catch (e) {
  //     return Result.error(e.toString());
  //   }
  // }

  Future<Result<PaginatedResponse<ShortExamDTO>>>
  getShortExamsOfStudentByMePaginated(PaginationParams params) async {
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
        "students/me/short-exams/paginated?$queryString",
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
            .map((e) => ShortExamDTO.fromJson(e))
            .toList();

        var paginatedResponse = PaginatedResponse<ShortExamDTO>(
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

  Future<Result<List<ShortExamDTO>>>
  getAllEnrolledShortExamsOfStudentByMe() async {
    try {
      var result = await _apiService.get("students/me/short-exams/enrolled");
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
        var shortExams = jsonBody.map((e) => ShortExamDTO.fromJson(e)).toList();
        return Result.ok(shortExams);
      } else {
        return Result.error("Something went wrong");
      }
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<ShortExamDTO>> getShortExamOfStudentByMeAndByExamID(
    int examId,
  ) async {
    try {
      var result = await _apiService.get("students/me/short-exams/$examId");
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
      var shortExam = ShortExamDTO.fromJson(jsonBody);
      return Result.ok(shortExam);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<bool> enrollShortExam(int examId) async {
    try {
      var result = await _apiService.post(
        "students/me/short-exams/$examId/enroll",
      );
      if (result case Ok()) {
      } else {
        return false;
      }
      var response = result.value;
      if (response.statusCode != 201) {
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Result<ShortExamDTO>> startShortExamOfStudentByMeByCourseExamId(
    int shortExamId,
  ) async {
    var response = await _apiService.get(
      "students/me/short-exams/$shortExamId/start",
    );
    switch (response) {
      case Ok():
        if (response.value.statusCode != 200) {
          return Result.error("Error getting course exams");
        }
        var body = response.value.body;
        var jsonBody = jsonDecode(body);
        return Result.ok(ShortExamDTO.fromJson(jsonBody));
      case Err():
        return Result.error("Error getting course exams");
    }
  }

  Future<Result<ShortExamResultDTO>> submitShortExamOfStudentByMeByShortExamId(
    int shortExamId,
    Map<int, int> answers,
  ) async {
    var body = {
      "answers": answers.map((key, value) => MapEntry(key.toString(), value)),
    };
    var response = await _apiService.post(
      "students/me/short-exams/$shortExamId/submit",
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
        var result = ShortExamResultDTO.fromMap(jsonBody);
        if (result == null) {
          return Result.error("Error parsing exam result");
        }
        return Result.ok(result);
      case Err():
        return Result.error("Error getting course exams");
    }
  }

  Future<Result<ShortExamResultDTO>> resultShortExamOfStudentByMeByShortExamId(
    int shortExamId,
  ) async {
    var response = await _apiService.get(
      "students/me/short-exams/$shortExamId/result",
    );
    switch (response) {
      case Ok():
        if (response.value.statusCode != 200) {
          return Result.error(response.value.body);
        }
        var body = response.value.body;
        var jsonBody = jsonDecode(body);
        var result = ShortExamResultDTO.fromMap(jsonBody);
        if (result == null) {
          return Result.error("Error parsing exam result");
        }
        return Result.ok(result);
      case Err():
        return Result.error("Error getting short exam result");
    }
  }

  Future<Result<ShortExamDTO>> uploadShortExamThumbnail(
    int teacherId,
    int id,
    Uint8List thumbnailBytes,
  ) async {
    final file = http.MultipartFile.fromBytes(
      'file',
      thumbnailBytes,
      filename: 'thumbnail.webp',
      contentType: MediaType('image', 'webp'),
    );

    final result = await _apiService.patchMultipart(
      "teachers/$teacherId/short-exams/$id/thumbnail",
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
        final course = ShortExamDTO.fromJson(jsonBody);
        return Result.ok(course);
      case Err():
        return Result.error("Thumbnail upload failed.");
    }
  }
}
