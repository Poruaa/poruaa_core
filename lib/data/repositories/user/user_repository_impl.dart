import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:poruaa_core/auth_success.dart';
import 'package:poruaa_core/config/poruaa_app_config.dart';
import 'package:poruaa_core/data/repositories/auth/auth_repository.dart';
import 'package:poruaa_core/data/repositories/user/user_repository.dart';
import 'package:poruaa_core/data/services/access_token/access_token_service.dart';
import 'package:poruaa_core/data/services/access_token/model/access_token.dart';
import 'package:poruaa_core/data/services/auth/model/resend_verification_response.dart';
import 'package:poruaa_core/data/services/user/user_service.dart';
import 'package:poruaa_core/domain/models/auth/auth.dart';
import 'package:poruaa_core/domain/models/teacher_organization/teacher_member.dart';
import 'package:poruaa_core/domain/models/user/user.dart';
import 'package:poruaa_core/utils/app_loger.dart';
import 'package:poruaa_core/utils/result.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/subjects.dart';
import 'package:url_launcher/url_launcher.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl(
    AuthRepository authRepository,
    UserService userService,
    AccessTokenService accessTokenService,
    PoruaaAppConfig config,
  ) : _userService = userService,
      _config = config,
      _authRepository = authRepository,
      _accessTokenService = accessTokenService;

  // final String clientId =
  //     '1010639356081-stvh23d5rh4k8j6gv6u3hacsbvs2upoq.apps.googleusercontent.com';
  // final String redirectUri = 'http://localhost:5430';

  final PoruaaAppConfig _config;
  final UserService _userService;
  final AuthRepository _authRepository;
  final AccessTokenService _accessTokenService;

  final _userSubject = BehaviorSubject<User?>.seeded(null);
  final _studentUserSubject = BehaviorSubject<Student?>.seeded(null);
  final _teacherUserSubject = BehaviorSubject<Teacher?>.seeded(null);

  @override
  int get getCurrentUserId => _userSubject.value?.id.toInt() ?? 0;

  @override
  int get getStudentId => _studentUserSubject.value?.id.toInt() ?? 0;

  @override
  int get getTeacherId => _teacherUserSubject.value?.id.toInt() ?? 0;

  @override
  Future<Result> load() async {
    await _authRepository.load();
    var currentAuth = _authRepository.currentAuth;
    if (currentAuth == null) {
      return Ok(null);
    }
    var user = await getAnyUser();
    return user;
  }

  @override
  User? get currentUser => _userSubject.value;

  @override
  Student? get studentUser => _studentUserSubject.value;

  @override
  Teacher? get teacherUser => _teacherUserSubject.value;

  @override
  Auth? get currentAuth => _authRepository.currentAuth;

  @override
  void dispose() {
    _userSubject.close();
  }

  @override
  Future<Result<dynamic>> login(String email, String password) async {
    var result = await _authRepository.login(email, password);
    switch (result) {
      case Ok():
        await getAnyUser();
      case Err():
        _userSubject.add(null);
    }
    return result;
  }

  @override
  Future<Result> register(String email, String password) async {
    var result = await _authRepository.register(email, password);
    switch (result) {
      case Ok():
        await getAnyUser();
      case Err():
        _userSubject.add(null);
    }
    return result;
  }

  @override
  Future<void> logout() async {
    await _authRepository.logout();
    _userSubject.add(null);
    _studentUserSubject.add(null);
    _teacherUserSubject.add(null);
  }

  @override
  Future<Result<User?>> getAnyUser() async {
    User? current;
    var teacherResult = await _userService.getBothUser();
    switch (teacherResult) {
      case Ok(:var value):
        var userModel = value;
        var teacherModel = userModel.teacher;
        var studentModel = userModel.student;
        if (studentModel != null) {
          var user = Student.fromUserModel(studentModel);
          _studentUserSubject.add(user);
          current ??= user;
        }
        if (teacherModel != null) {
          var user = Teacher.fromUserModel(teacherModel);
          _teacherUserSubject.add(user);
          current ??= user;
        }
        _userSubject.add(current);
        AppLogger.debug(
          "User loaded",
          params: {
            "id": current?.id,
            "student": studentModel?.name,
            "teacher": teacherModel?.name,
          },
        );
        return Result.ok(current);
      case Err(:final error):
        _userSubject.add(null);
        return Result.error(error);
    }
  }

  @override
  Future<Result<Student>> switchToStudentUser() async {
    var currentStudent = studentUser;
    if (currentStudent != null) {
      _userSubject.add(currentStudent);
      return Result.ok(currentStudent);
    }
    var result = await _userService.getStudent();
    switch (result) {
      case Ok():
        var studentUserModel = result.value;
        var student = Student.fromUserModel(studentUserModel);
        _userSubject.add(student);
        return Result.ok(student);
      case Err():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<Teacher>> switchToTeacherUser() async {
    var currentTeacher = teacherUser;
    if (currentTeacher != null) {
      _userSubject.add(currentTeacher);
      return Result.ok(currentTeacher);
    }
    var result = await _userService.getTeacher();
    switch (result) {
      case Ok():
        var teacherUserModel = result.value;
        var student = Teacher.fromUserModel(teacherUserModel);
        _userSubject.add(student);
        return Result.ok(student);
      case Err():
        return Result.error(result.error);
    }
  }

  Future<Result<void>> refreshUser() async {
    _userSubject.add(null);
    return Result.ok(null);
  }

  @override
  Future<Result<User>> switchUser() async {
    var currentUser = this.currentUser;
    if (currentUser == null) {
      return Result.error("No user");
    }
    switch (currentUser) {
      case Student():
        return switchToTeacherUser();
      case Teacher():
        return switchToStudentUser();
      case Organization():
        return Result.error("No organization");
    }
  }

  @override
  Future<Result<Student>> registerStudent(Student student) async {
    var result = await _userService.registerStudent(student.toUserModel());
    switch (result) {
      case Ok():
        var user = Student.fromUserModel(result.value);
        _studentUserSubject.add(user);
        _userSubject.add(user);
        AppLogger.debug(
          "Student registered",
          params: {"id": user.id, "name": user.name},
        );
        return Result.ok(user);
      case Err():
        AppLogger.error("Student registered failed", error: result.error);
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<Teacher>> registerTeacher(Teacher teacher) async {
    var result = await _userService.registerTeacher(teacher.toUserModel());
    switch (result) {
      case Ok():
        var user = Teacher.fromUserModel(result.value);
        _teacherUserSubject.add(user);
        _userSubject.add(user);
        AppLogger.debug(
          "Teacher registered",
          params: {"id": user.id, "name": user.name},
        );
        return Result.ok(user);
      case Err():
        AppLogger.error("Teacher registered failed", error: result.error);
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<Teacher>> updateTeacher(Teacher teacher) async {
    var result = await _userService.updateTeacherUser(
      getTeacherId,
      teacher.toUserModel(),
    );
    switch (result) {
      case Ok():
        var user = Teacher.fromUserModel(result.value);
        _teacherUserSubject.add(user);
        _userSubject.add(user);
        return Result.ok(user);
      case Err():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<Student>> updateStudent(Student student) async {
    var result = await _userService.updateStudentUser(student.toUserModel());
    switch (result) {
      case Ok():
        var user = Student.fromUserModel(result.value);
        _studentUserSubject.add(user);
        _userSubject.add(user);
        return Result.ok(user);
      case Err():
        return Result.error(result.error);
    }
  }

  @override
  Future<bool> deleteStudentUser() async {
    var result = await _userService.deleteStudentUser();
    if (result) {
      _studentUserSubject.add(null);
      _userSubject.add(teacherUser);
      AppLogger.debug(
        "Student deleted",
        params: {"id": studentUser?.id, "name": studentUser?.name},
      );
    }
    return result;
  }

  @override
  Future<bool> deleteTeacherUser() async {
    var result = await _userService.deleteTeacherUser(getTeacherId);
    if (result) {
      _teacherUserSubject.add(null);
      _userSubject.add(studentUser);
      AppLogger.debug(
        "Teacher deleted",
        params: {"id": teacherUser?.id, "name": teacherUser?.name},
      );
    }
    return result;
  }

  @override
  Stream<User?> get userSnapshot => _userSubject.stream;

  @override
  Stream<Result<Teacher>> getTeacherById(int teacherId) async* {
    try {
      final result = await _userService.getTeacherById(teacherId);
      switch (result) {
        case Ok(value: final teacherModel):
          final teacher = Teacher.fromUserModel(teacherModel);
          yield Result.ok(teacher);
          break;
        case Err():
          yield Result.error(result.error);
          break;
      }
    } catch (e) {
      yield Result.error(e.toString());
    }
  }

  Future<String> getAuthCodeFromRedirect() async {
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 5430);
    // print('Listening on localhost:8080 for Google redirect');

    // Wait for the first request
    final request = await server.first.timeout(
      const Duration(seconds: 60),
      onTimeout: () => throw Exception(
        'Login timed out. Please make sure your browser stays open and try again.',
      ),
    );

    // The code will be in query parameters
    final authCode = request.uri.queryParameters['code'];

    // Respond to browser
    request.response
      ..statusCode = 200
      ..headers.contentType = ContentType.html
      ..write('<h1>You can close this window now.</h1>')
      ..close();

    // Close the server
    await server.close();

    if (authCode == null) {
      throw 'No code received from Google redirect';
    }

    return authCode;
  }

  Future<String> getIdTokenFromRedirect() async {
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 5430);
    String? idToken;
    bool isComplete = false;

    // Handle all requests on this server
    server.listen((request) async {
      final uri = request.uri;
      if (uri.path == '/callback' &&
          uri.queryParameters.containsKey('id_token')) {
        // This is the callback with the ID token
        idToken = uri.queryParameters['id_token'];
        isComplete = true;

        // Serve the success page
        final successPage = await _getSuccessPage();
        request.response
          ..statusCode = 200
          ..headers.contentType = ContentType.html
          ..write(successPage)
          ..close();
      } else {
        // Serve the callback page that extracts the fragment and redirects
        final callbackUrl = 'http://localhost:${server.port}/callback';
        final html =
            '''
<!DOCTYPE html>
<html>
<head>
    <title>Google Sign-In</title>
</head>
<body>
    <h1>Processing authentication...</h1>
    <script>
        // Extract the ID token from the fragment
        const fragment = window.location.hash.substring(1);
        const params = new URLSearchParams(fragment);
        const idToken = params.get('id_token');
        
        if (idToken) {
            // Redirect to our callback with the ID token as a query parameter
            window.location.href = '$callbackUrl?id_token=' + encodeURIComponent(idToken);
        } else {
            document.body.innerHTML = '<h1>Error: No ID token found in URL fragment</h1>';
        }
    </script>
</body>
</html>
        ''';

        request.response
          ..statusCode = 200
          ..headers.contentType = ContentType.html
          ..write(html)
          ..close();
      }
    });

    // Wait for completion with timeout
    final startTime = DateTime.now();
    while (!isComplete && DateTime.now().difference(startTime).inSeconds < 60) {
      await Future.delayed(const Duration(milliseconds: 100));
    }

    // Close the server
    await server.close();

    if (idToken == null || idToken!.isEmpty) {
      throw 'No ID token received from Google redirect';
    }

    return idToken!;
  }

  Future<String> _getSuccessPage() async {
    return authSuccessHtml;
  }

  Future<String> _loginWithGoogleWeb() async {
    final authUrl = Uri.https('accounts.google.com', '/o/oauth2/v2/auth', {
      'client_id': _config.webGoogleClientId,
      'redirect_uri': _config.redirectUri,
      'response_type': 'id_token',
      'scope': 'openid email profile',
      'nonce': DateTime.now().millisecondsSinceEpoch.toString(),
    });

    // Step 2: Open the URL in the system browser
    if (await canLaunchUrl(authUrl)) {
      await launchUrl(authUrl);
    } else {
      throw 'Could not launch $authUrl';
    }

    return await getIdTokenFromRedirect();
  }

  Future<String> _loginWithGoogleAndroid() async {
    final GoogleSignIn googleSignIn = GoogleSignIn.instance;
    await googleSignIn.initialize(
      // clientId: kDebugMode
      //     ? '1010639356081-bceb308gb30r5tk5t90o5rse28jghp42.apps.googleusercontent.com'
      //     : '1010639356081-ed4mbhjosh70ac8lbbp1p7t6bubfsoo4.apps.googleusercontent.com',
      // serverClientId:
      //     '1010639356081-stvh23d5rh4k8j6gv6u3hacsbvs2upoq.apps.googleusercontent.com', // Optional, but needed for authCode
      clientId: kDebugMode
          ? _config.devAndroidGoogleClientId
          : _config.androidGoogleClientId,
      serverClientId: _config.webGoogleServerClientId,
    );

    // Step 2: Open the URL in the system browser
    try {
      final GoogleSignInAccount user = await googleSignIn.authenticate();
      var idToken = user.authentication.idToken;
      if (idToken == null) {
        throw "Google login failed: User not signed in";
      }
      return idToken;
    } catch (error) {
      throw "Google login failed: $error";
    }
  }

  Future<Result<String>> _loginWithGooglePlatform() async {
    try {
      if (Platform.isAndroid) {
        return Result.ok(await _loginWithGoogleAndroid());
      }
      return Result.ok(await _loginWithGoogleWeb());
    } catch (error) {
      return Result.error(error.toString());
    }
  }

  @override
  Future<Result<Auth>> loginWithGoogle() async {
    // Step 1: Generate the auth URL

    var result = await _loginWithGooglePlatform(); // You implement this
    switch (result) {
      case Ok(value: final authCode):
        var result = await _authRepository.loginWithGoogle(authCode);
        switch (result) {
          case Ok():
            await getAnyUser();
          case Err():
            AppLogger.error("Google login failed", error: result.error);
            _userSubject.add(null);
        }
        return result;
      case Err():
        AppLogger.error("Google login failed", error: result.error);
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<User>> switchToTeacherMemberUser(
    TeacherMember teacherMember,
  ) async {
    var ownerId = teacherMember.ownerTeacherId;
    var owner = await getTeacherById(ownerId).first;
    if (owner case Ok(:final value)) {
      var user = Organization.fromTeacher(value);
      switchToOrganizationUser(user);
      return Result.ok(user);
    } else {
      return Result.error("Owner not found");
    }
  }

  @override
  Result<User> switchToOrganizationUser(Organization organization) {
    _userSubject.add(organization);
    return Result.ok(organization);
  }

  @override
  Future<Result<ResendVerificationResponse>> resendVerificationEmail() async {
    return await _userService.resendVerificationEmail();
  }

  @override
  Future<AccessToken?> getAccessToken() async {
    return await _accessTokenService.getToken();
  }

  @override
  Future<Result<void>> requestPasswordReset(String email) async {
    return await _authRepository.requestPasswordReset(email);
  }
}
