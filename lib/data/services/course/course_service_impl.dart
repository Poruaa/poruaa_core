import 'dart:convert';
import 'dart:typed_data';

import 'package:poruaa_core/data/services/authorized_api/authorized_api_service.dart';
import 'package:poruaa_core/data/services/course/course_service.dart';
import 'package:poruaa_core/data/services/course/model/course_model.dart';
import 'package:poruaa_core/data/services/course/model/course_publish_cost_info_dto.dart';
import 'package:poruaa_core/domain/models/pagination/pagination_state.dart';
import 'package:poruaa_core/utils/result.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class CoursesServiceImpl extends CoursesService {
  final AuthorizedApiService _apiService;
  CoursesServiceImpl(AuthorizedApiService apiService)
    : _apiService = apiService;

  @override
  Future<Result<List<CourseModel>>> getCoursesOfTeacher(int teacherId) async {
    var result = await _apiService.get("teachers/$teacherId/courses");
    switch (result) {
      case Ok():
        var response = result.value;
        var body = response.body;
        var jsonBody = jsonDecode(body);
        if (jsonBody is List) {
          var courses = jsonBody.map((e) => CourseModel.fromJson(e)).toList();
          return Result.ok(courses);
        } else {
          return Result.error("Parse error");
        }
      case Err():
        return Result.error("error");
    }
  }

  @override
  Future<Result<List<CourseModel>>> getCoursesOfStudentByMeByTeacherId(
    int teacherId,
  ) async {
    var result = await _apiService.get(
      "students/me/teachers/$teacherId/courses",
    );
    switch (result) {
      case Ok():
        var response = result.value;
        var body = response.body;
        var jsonBody = jsonDecode(body);
        if (jsonBody is List) {
          var courses = jsonBody.map((e) => CourseModel.fromJson(e)).toList();
          return Result.ok(courses);
        } else {
          return Result.error("Parse error");
        }
      case Err():
        return Result.error("error");
    }
  }

  @override
  Future<Result<CourseModel>> getCourseOfTeacherById(
    int teacherId,
    int courseId,
  ) async {
    var result = await _apiService.get("teachers/$teacherId/courses/$courseId");
    switch (result) {
      case Ok():
        var response = result.value;
        var body = response.body;
        var jsonBody = jsonDecode(body);
        var course = CourseModel.fromJson(jsonBody);
        return Result.ok(course);
      case Err():
        return Result.error("error");
    }
  }

  // @override
  // Future<Result<List<CourseModel>>> getAllCourses() async {
  //   var result = await _apiService.get("courses");
  //   switch (result) {
  //     case Ok():
  //       var response = result.value;
  //       var body = response.body;
  //       var jsonBody = jsonDecode(body);
  //       if (jsonBody is List) {
  //         var courses = jsonBody.map((e) => CourseModel.fromJson(e)).toList();
  //         return Result.ok(courses);
  //       } else {
  //         return Result.error("Parse error");
  //       }
  //     case Error():
  //       return Result.error("error");
  //   }
  // }

  // @override
  // Future<Result<List<FlatCourseEnrollmentModel>>>
  //     getAllCourseEnrollments() async {
  //   var result = await _apiService.get("course-enrollments");
  //   switch (result) {
  //     case Ok():
  //       var response = result.value;
  //       var body = response.body;
  //       var jsonBody = jsonDecode(body);
  //       if (jsonBody is List) {
  //         var courses = jsonBody
  //             .map((e) => FlatCourseEnrollmentModel.fromMap(e))
  //             .toList();
  //         return Result.ok(courses);
  //       } else {
  //         return Result.error("Parse error");
  //       }
  //     case Error():
  //       return Result.error("error");
  //   }
  // }

  @override
  Future<Result<CourseModel>> create(
    int teacherId,
    String name,
    String subTitle,
    num price,
    num regularPrice,
  ) async {
    var json = {
      "name": name,
      "sub_title": subTitle,
      "price": price,
      "regular_price": regularPrice,
    };
    var result = await _apiService.post(
      "teachers/$teacherId/courses",
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(json),
    );

    switch (result) {
      case Ok():
        var statusCode = result.value.statusCode;
        if (statusCode != 200 && statusCode != 201) {
          return Result.error(result.value.body);
        }
        var response = result.value;
        var body = response.body;
        var jsonBody = jsonDecode(body);
        var course = CourseModel.fromJson(jsonBody);
        return Result.ok(course);
      case Err():
        return Result.error("error");
    }
  }

  @override
  Future<Result<CourseModel>> update(
    int teacherId,
    int id,
    String name,
    String subTitle,
    num price,
    num regularPrice,
  ) async {
    var json = {
      "name": name,
      "sub_title": subTitle,
      "price": price,
      "regular_price": regularPrice,
    };
    var result = await _apiService.put(
      "teachers/$teacherId/courses/$id",
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(json),
    );

    switch (result) {
      case Ok():
        var response = result.value;
        if (response.statusCode != 200) return Err(response.body);
        return Ok(CourseModel.fromJson(jsonDecode(response.body)));
      case Err():
        return Err("Connection error");
    }
  }

  @override
  Future<Result<bool>> delete(int teacherId, int id) async {
    var result = await _apiService.delete("teachers/$teacherId/courses/$id");
    switch (result) {
      case Ok():
        var response = result.value;
        if (response.statusCode != 200) return Result.error(response.body);
        return Result.ok(true);
      case Err():
        return Result.error("Connection error");
    }
  }

  // @override
  // Future<Result<List<CourseModel>>> getAllCoursesOfStudentByMe() async {
  //   var result = await _apiService.get("students/me/courses");
  //   switch (result) {
  //     case Ok():
  //       var response = result.value;
  //       var body = response.body;
  //       var statusCode = response.statusCode;
  //       if (statusCode != 200) {
  //         return Result.error(body);
  //       }
  //       var jsonBody = jsonDecode(body);
  //       if (jsonBody is List) {
  //         var courses = jsonBody.map((e) => CourseModel.fromJson(e)).toList();
  //         return Result.ok(courses);
  //       } else {
  //         return Result.error("Parse error");
  //       }
  //     case Err():
  //       return Result.error("error");
  //   }
  // }

  @override
  Future<Result<PaginatedResponse<CourseModel>>>
  getCoursesOfStudentByMePaginated(PaginationParams params) async {
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
      "students/me/courses/paginated?$queryString",
    );
    switch (result) {
      case Ok():
        var response = result.value;
        var body = response.body;
        var jsonBody = jsonDecode(body);

        if (jsonBody is Map<String, dynamic>) {
          var items = (jsonBody['items'] as List)
              .map((e) => CourseModel.fromJson(e))
              .toList();

          var paginatedResponse = PaginatedResponse<CourseModel>(
            items: items,
            nextCursor: jsonBody['next_cursor'] as String?,
            hasMore: jsonBody['has_more'] as bool? ?? false,
            total: jsonBody['total'] as int? ?? 0,
          );

          return Result.ok(paginatedResponse);
        } else {
          return Result.error("Parse error");
        }
      case Err():
        return Result.error("error");
    }
  }

  @override
  Future<Result<List<CourseModel>>> getAllEnrolledCoursesOfStudentByMe() async {
    var result = await _apiService.get("students/me/courses/enrolled");
    switch (result) {
      case Ok():
        var response = result.value;
        var body = response.body;
        var jsonBody = jsonDecode(body);
        if (jsonBody is List) {
          var courses = jsonBody.map((e) => CourseModel.fromJson(e)).toList();
          return Result.ok(courses);
        } else {
          return Result.error("Parse error");
        }
      case Err():
        return Result.error("error");
    }
  }

  @override
  Future<Result<CourseModel>> getCourseOfStudentByCourseId(int courseId) async {
    var result = await _apiService.get("students/me/courses/$courseId");
    switch (result) {
      case Ok():
        var response = result.value;
        var body = response.body;
        var jsonBody = jsonDecode(body);
        var course = CourseModel.fromJson(jsonBody);
        return Result.ok(course);
      case Err():
        return Result.error("error");
    }
  }

  @override
  Future<Result<CourseModel>> uploadCourseThumbnail(
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
      "teachers/$teacherId/courses/$id/thumbnail",
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
        final course = CourseModel.fromJson(jsonBody);
        return Result.ok(course);
      case Err():
        return Result.error("Thumbnail upload failed.");
    }
  }

  @override
  Future<Result<CourseModel>> updateCourseExpirationDate(
    int teacherId,
    int id,
    DateTime expiresAt,
  ) async {
    final result = await _apiService.patch(
      "teachers/$teacherId/courses/$id/expiration",
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"expires_at": expiresAt.toUtc().toIso8601String()}),
    );

    switch (result) {
      case Ok():
        final body = result.value.body;
        final code = result.value.statusCode;
        if (code != 200) {
          return Result.error(body);
        }
        final jsonBody = jsonDecode(body);
        final course = CourseModel.fromJson(jsonBody);
        return Result.ok(course);
      case Err():
        return Result.error("Expiration date update failed.");
    }
  }

  @override
  Future<Result<CourseModel>> publishCourse(int teacherId, int id) async {
    final result = await _apiService.patch(
      "teachers/$teacherId/courses/$id/publish",
      headers: {"Content-Type": "application/json"},
    );

    switch (result) {
      case Ok():
        final body = result.value.body;
        final code = result.value.statusCode;
        if (code != 200) {
          return Result.error(body);
        }
        final jsonBody = jsonDecode(body);
        final course = CourseModel.fromJson(jsonBody);
        return Result.ok(course);
      case Err():
        return Result.error("Expiration date update failed.");
    }
  }

  @override
  Future<Result<CourseModel>> unPublishCourse(int teacherId, int id) async {
    final result = await _apiService.patch(
      "teachers/$teacherId/courses/$id/unpublish",
      headers: {"Content-Type": "application/json"},
    );

    switch (result) {
      case Ok():
        final body = result.value.body;
        final code = result.value.statusCode;
        if (code != 200) {
          return Result.error(body);
        }
        final jsonBody = jsonDecode(body);
        final course = CourseModel.fromJson(jsonBody);
        return Result.ok(course);
      case Err():
        return Err("Network error");
    }
  }

  @override
  Future<Result<CoursePublishCostInfoDTO>> getPublishCostInfo(
    int teacherId,
    int courseId,
  ) async {
    final result = await _apiService.get(
      "teachers/$teacherId/courses/$courseId/publish-cost-info",
    );

    switch (result) {
      case Ok():
        final body = result.value.body;
        final code = result.value.statusCode;
        if (code == 200) {
          final jsonBody = jsonDecode(body) as Map<String, dynamic>;
          final costInfo = CoursePublishCostInfoDTO.fromJson(jsonBody);
          return Result.ok(costInfo);
        } else if (code == 401) {
          return Result.error("Access denied");
        } else {
          return Result.error(body);
        }
      case Err():
        return Result.error("Failed to get publish cost info");
    }
  }
}
