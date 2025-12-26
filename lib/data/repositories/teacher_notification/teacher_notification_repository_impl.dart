import 'package:poruaa_core/data/repositories/teacher_notification/teacher_notification_repository.dart';
import 'package:poruaa_core/data/services/teacher/model/send_teacher_topic_notification_input.dart';
import 'package:poruaa_core/data/services/teacher/model/send_teacher_topic_notification_response.dart';
import 'package:poruaa_core/data/services/teacher/teacher_notification_service.dart';
import 'package:poruaa_core/utils/result.dart';

class TeacherNotificationRepositoryImpl
    implements TeacherNotificationRepository {
  final TeacherNotificationService _teacherNotificationService;

  TeacherNotificationRepositoryImpl(this._teacherNotificationService);

  @override
  Future<Result<SendTeacherTopicNotificationResponse>> notifyStudents(
    int teacherId,
    SendTeacherTopicNotificationInput input,
  ) async {
    return await _teacherNotificationService.notifyStudents(teacherId, input);
  }
}
