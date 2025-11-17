import 'dart:convert';

import 'package:poruaa_core/data/services/api/model/response.dart';
import 'package:poruaa_core/data/services/auth/model/resend_verification_response.dart';
import 'package:poruaa_core/data/services/authorized_api/authorized_api_service.dart';
import 'package:poruaa_core/data/services/user/model/both_user.dart';
import 'package:poruaa_core/data/services/user/model/user_model.dart';
import 'package:poruaa_core/utils/result.dart';

import 'user_service.dart';

class UserServiceImpl extends UserService {
  UserServiceImpl(AuthorizedApiService apiService) : _apiService = apiService;
  final AuthorizedApiService _apiService;

  @override
  Future<Result<StudentUserModel>> getStudent() async {
    try {
      final Result<Response> response = await _apiService.get('students/me');

      switch (response) {
        case Ok():
          var statusCode = response.value.statusCode;
          if (statusCode != 200) {
            return Result.error("Student not found");
          }
          var body = response.value.body;
          var student = StudentUserModel.fromJson(jsonDecode(body));
          if (student == null) {
            return Result.error("Parse error");
          }
          return Result.ok(student);
        case Err():
          return Result.error(response.error);
      }
    } catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<TeacherUserModel>> getTeacher() async {
    try {
      final response = await _apiService.get('teachers/me');

      switch (response) {
        case Ok():
          var body = response.value.body;
          if (response.value.statusCode != 200) {
            return Result.error("Failed to load");
          }
          var teacher = TeacherUserModel.fromJson(jsonDecode(body));
          if (teacher == null) {
            return Result.error("Parse error");
          }
          return Result.ok(teacher);
        case Err():
          return Result.error(response.error);
      }
    } catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<TeacherUserModel>> getTeacherById(int teacherId) async {
    try {
      final response = await _apiService.get('teachers/$teacherId');

      switch (response) {
        case Ok():
          var body = response.value.body;
          if (response.value.statusCode != 200) {
            return Result.error("Teacher not found");
          }
          var teacher = TeacherUserModel.fromJson(jsonDecode(body));
          if (teacher == null) {
            return Result.error("Parse error");
          }
          return Result.ok(teacher);
        case Err():
          return Result.error(response.error);
      }
    } catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<StudentUserModel>> getStudentById(int studentId) async {
    try {
      final response = await _apiService.get('students/$studentId');

      switch (response) {
        case Ok():
          var body = response.value.body;
          if (response.value.statusCode != 200) {
            return Result.error("Student not found");
          }
          var student = StudentUserModel.fromJson(jsonDecode(body));
          if (student == null) {
            return Result.error("Parse error");
          }
          return Result.ok(student);
        case Err():
          return Result.error(response.error);
      }
    } catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result<StudentUserModel>> registerStudent(
    StudentUserModel student,
  ) async {
    var body = student.toJson();
    var response = await _apiService.post(
      'students',
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    switch (response) {
      case Ok():
        if (response.value.statusCode != 201) {
          return Result.error("Error: ${response.value.statusCode}");
        }
        var user = StudentUserModel.fromJson(jsonDecode(response.value.body));
        if (user == null) {
          return Result.error("Error: parse error");
        }
        return Result.ok(user);
      case Err():
        return Result.error(response.error);
    }
  }

  @override
  Future<Result<TeacherUserModel>> registerTeacher(
    TeacherUserModel teacher,
  ) async {
    var body = teacher.toJson();
    var response = await _apiService.post(
      'teachers',
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    switch (response) {
      case Ok():
        if (response.value.statusCode != 201) {
          return Result.error("Error: ${response.value.statusCode}");
        }
        var user = TeacherUserModel.fromJson(jsonDecode(response.value.body));
        if (user == null) {
          return Result.error("Error: parse error");
        }
        return Result.ok(user);
      case Err():
        return Result.error(response.error);
    }
  }

  @override
  Future<Result<BothUser>> getBothUser() async {
    var response = await _apiService.get(
      'users/me/both',
      headers: {'Content-Type': 'application/json'},
    );
    switch (response) {
      case Ok():
        if (response.value.statusCode != 200) {
          return Result.ok(BothUser(student: null, teacher: null));
        }
        var body = response.value.body;
        var bothUser = BothUser.fromJson(jsonDecode(body));
        if (bothUser == null) {
          return Result.error("Error: parse error");
        }
        return Result.ok(bothUser);
      case Err():
        return Result.error("Connection error");
    }
  }

  @override
  Future<Result<StudentUserModel>> updateStudentUser(
    StudentUserModel student,
  ) async {
    var body = student.toJson();
    var response = await _apiService.put(
      'students/me',
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    switch (response) {
      case Ok():
        if (response.value.statusCode != 200) {
          return Result.error("Error: ${response.value.statusCode}");
        }
        var user = StudentUserModel.fromJson(jsonDecode(response.value.body));
        if (user == null) {
          return Result.error("Error: parse error");
        }
        return Result.ok(user);
      case Err():
        return Result.error(response.error);
    }
  }

  @override
  Future<Result<TeacherUserModel>> updateTeacherUser(
    int teacherId,
    TeacherUserModel teacher,
  ) async {
    var body = teacher.toJson();
    var response = await _apiService.put(
      'teachers/$teacherId',
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    switch (response) {
      case Ok():
        if (response.value.statusCode != 200) {
          return Result.error("Error: ${response.value.statusCode}");
        }
        var user = TeacherUserModel.fromJson(jsonDecode(response.value.body));
        if (user == null) {
          return Result.error("Error: parse error");
        }
        return Result.ok(user);
      case Err():
        return Result.error(response.error);
    }
  }

  @override
  Future<bool> deleteStudentUser() {
    return _apiService
        .delete('students/me')
        .then((response) {
          switch (response) {
            case Ok():
              if (response.value.statusCode != 200) {
                return false;
              }
              return true;
            case Err():
              return false;
          }
        })
        .catchError((e) {
          return false;
        });
  }

  @override
  Future<bool> deleteTeacherUser(int teacherId) {
    return _apiService
        .delete('teachers/$teacherId')
        .then((response) {
          switch (response) {
            case Ok():
              if (response.value.statusCode != 200) {
                return false;
              }
              return true;
            case Err():
              return false;
          }
        })
        .catchError((e) {
          return false;
        });
  }

  @override
  Future<Result<ResendVerificationResponse>> resendVerificationEmail() async {
    final response = await _apiService.post(
      'auth/resend-verification',
      headers: {'Content-Type': 'application/json'},
    );

    switch (response) {
      case Ok():
        if (response.value.statusCode == 200) {
          var responseBody = jsonDecode(response.value.body);
          if (responseBody is Map<String, dynamic>) {
            var resendResponse = ResendVerificationResponse.fromJson(
              responseBody,
            );
            return Result.ok(resendResponse);
          } else {
            return Result.error("Failed to resend verification email");
          }
        } else {
          try {
            var responseBody = jsonDecode(response.value.body);
            if (responseBody is Map<String, dynamic>) {
              var resendResponse = ResendVerificationResponse.fromJson(
                responseBody,
              );
              return Result.error(resendResponse.message);
            } else {
              return Result.error("Failed to resend verification email");
            }
          } catch (e) {
            return Result.error("Failed to resend verification email");
          }
        }
      case Err():
        return Result.error("Network error: ${response.error}");
    }
  }

  @override
  Future<Result<TeacherUserModel>> updateTeacherProfileImage(
    int teacherId,
    String profileImageUrl,
  ) async {
    try {
      final response = await _apiService.patch(
        'teachers/$teacherId/profile-image-url',
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'profile_image': profileImageUrl}),
      );

      switch (response) {
        case Ok():
          if (response.value.statusCode != 200) {
            return Result.error(
              "Failed to update profile image: ${response.value.statusCode}",
            );
          }
          var body = response.value.body;
          var teacher = TeacherUserModel.fromJson(jsonDecode(body));
          if (teacher == null) {
            return Result.error("Parse error");
          }
          return Result.ok(teacher);
        case Err():
          return Result.error(response.error);
      }
    } catch (e) {
      return Result.error(e);
    }
  }
}
