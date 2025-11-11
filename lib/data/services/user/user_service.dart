import 'package:poruaa_core/data/services/auth/model/resend_verification_response.dart';
import 'package:poruaa_core/data/services/user/model/both_user.dart';
import 'package:poruaa_core/data/services/user/model/user_model.dart';
import 'package:poruaa_core/utils/result.dart';

abstract class UserService {
  Future<Result<StudentUserModel>> getStudent();
  Future<Result<TeacherUserModel>> getTeacher();
  Future<Result<TeacherUserModel>> getTeacherById(int teacherId);
  Future<Result<StudentUserModel>> getStudentById(int studentId);
  Future<Result<BothUser>> getBothUser();
  Future<Result<StudentUserModel>> registerStudent(StudentUserModel student);
  Future<Result<TeacherUserModel>> registerTeacher(TeacherUserModel teacher);
  Future<Result<TeacherUserModel>> updateTeacherUser(
    int teacherId,
    TeacherUserModel teacher,
  );
  Future<Result<StudentUserModel>> updateStudentUser(StudentUserModel student);
  Future<bool> deleteStudentUser();
  Future<bool> deleteTeacherUser(int teacherId);
  Future<Result<ResendVerificationResponse>> resendVerificationEmail();
}
