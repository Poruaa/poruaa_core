import 'dart:convert';
import 'package:poruaa_core/data/services/authorized_api/authorized_api_service.dart';
import 'package:poruaa_core/data/services/teacher/model/send_teacher_topic_notification_input.dart';
import 'package:poruaa_core/data/services/teacher/model/send_teacher_topic_notification_response.dart';
import 'package:poruaa_core/data/services/teacher/teacher_notification_service.dart';
import 'package:poruaa_core/utils/result.dart';

class TeacherNotificationServiceImpl implements TeacherNotificationService {
  final AuthorizedApiService _apiService;

  TeacherNotificationServiceImpl(this._apiService);

  @override
  Future<Result<SendTeacherTopicNotificationResponse>> notifyStudents(
    int teacherId,
    SendTeacherTopicNotificationInput input,
  ) async {
    try {
      var result = await _apiService.post(
        "teachers/$teacherId/notify",
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(input.toJson()),
      );

      switch (result) {
        case Ok():
          var response = result.value;
          if (response.statusCode != 200) {
            return Result.error(response.body);
          }
          var jsonBody = jsonDecode(response.body);
          var notificationResponse =
              SendTeacherTopicNotificationResponse.fromJson(jsonBody);
          return Result.ok(notificationResponse);
        case Err():
          return Result.error("Connection error");
      }
    } catch (e) {
      return Result.error("Error: $e");
    }
  }
}
