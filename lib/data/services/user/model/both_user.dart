import 'package:poruaa_core/data/services/user/model/user_model.dart';

class BothUser {
  final TeacherUserModel? teacher;
  final StudentUserModel? student;
  BothUser({this.teacher, this.student});
  static BothUser? fromJson(Map<String, dynamic> json) {
    try {
      TeacherUserModel? teacher;
      StudentUserModel? student;
      var teacherJson = json['teacher'];
      if (teacherJson != null) {
        teacher = TeacherUserModel.fromJson(teacherJson);
      }
      var studentJson = json['student'];
      if (studentJson != null) {
        student = StudentUserModel.fromJson(studentJson);
      }
      return BothUser(teacher: teacher, student: student);
    } catch (e) {
      return null;
    }
  }
}
