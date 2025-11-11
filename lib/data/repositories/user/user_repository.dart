import 'package:poruaa_core/data/services/auth/model/resend_verification_response.dart';
import 'package:poruaa_core/data/services/access_token/model/access_token.dart';
import 'package:poruaa_core/domain/models/teacher_organization/teacher_member.dart';
import 'package:poruaa_core/domain/models/user/user.dart';
import 'package:poruaa_core/utils/result.dart';

import '../../../domain/models/auth/auth.dart';

abstract class UserRepository {
  Stream<User?> get userSnapshot;
  User? get currentUser;
  Auth? get currentAuth;

  int get getCurrentUserId;
  int get getTeacherId;
  int get getStudentId;

  Student? get studentUser;
  Teacher? get teacherUser;

  Future<Result> load();
  Future<void> login(String email, String password);
  Future<Result<Auth?>> loginWithGoogle();
  Future<void> register(String email, String password);
  Future<void> logout();
  Future<Result<User?>> getAnyUser();
  Future<Result<User>> switchUser();
  Result<User> switchToOrganizationUser(Organization organization);
  Future<Result<User>> switchToTeacherMemberUser(TeacherMember teacherMember);
  Future<Result<Student>> switchToStudentUser();
  Future<Result<Teacher>> switchToTeacherUser();
  Future<Result<Student>> registerStudent(Student student);
  Future<Result<Teacher>> registerTeacher(Teacher teacher);
  Future<Result<Teacher>> updateTeacher(Teacher teacher);
  Future<Result<Student>> updateStudent(Student student);
  Future<bool> deleteStudentUser();
  Future<bool> deleteTeacherUser();
  Stream<Result<Teacher>> getTeacherById(int teacherId);
  Future<Result<ResendVerificationResponse>> resendVerificationEmail();
  Future<AccessToken?> getAccessToken();
  Future<Result<void>> requestPasswordReset(String email);
  void dispose();
}
