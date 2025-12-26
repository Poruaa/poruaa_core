import 'package:poruaa_core/data/services/teacher/model/send_teacher_topic_notification_input.dart';
import 'package:poruaa_core/data/services/teacher/model/send_teacher_topic_notification_response.dart';
import 'package:poruaa_core/utils/result.dart';

abstract class TeacherNotificationRepository {
  /// Send notification to all students of the teacher via teacher topic
  Future<Result<SendTeacherTopicNotificationResponse>> notifyStudents(
    int teacherId,
    SendTeacherTopicNotificationInput input,
  );
}
