// import 'package:frontend/data/repositories/auth/auth_repository.dart';
// import 'package:frontend/data/repositories/user/user_repository.dart';
// import 'package:frontend/domain/models/auth/auth.dart';
// import 'package:frontend/domain/models/user/user.dart';
// import 'package:frontend/domain/use_cases/auth_user_use_case.dart';
// import 'package:frontend/utils/result.dart';

// class AuthUserUseCaseImpl extends AuthUserUseCase {
//   AuthUserUseCaseImpl(
//       AuthRepository authRepository, UserRepository userRepository)
//       : _authRepository = authRepository,
//         _userRepository = userRepository;
//   final AuthRepository _authRepository;
//   final UserRepository _userRepository;

//   @override
//   Stream<Auth?> get authSnapshot => _authRepository.authSnapshot;

//   @override
//   Auth? get currentAuth => _authRepository.currentAuth;

//   @override
//   User? get currentUser => _userRepository.currentUser;

//   @override
//   Future<void> initialize() async {
//     authSnapshot.listen((auth) {
//       if (auth == null) {
//         _userRepository.switchUser();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     // _authRepository.dispose();
//     // _userRepository.dispose();
//   }

//   @override
//   Future<Result<User>> getAnyUser() {
//     return _userRepository.getAnyUser();
//   }

//   @override
//   Future<Result<Auth>> login(email, password) {
//     return _authRepository.login(email, password);
//   }

//   @override
//   Future<Result<void>> logout() {
//     return _authRepository.logout();
//   }

//   @override
//   Future<Result<Auth>> register(email, password) {
//     return _authRepository.register(email, password);
//   }

//   @override
//   Future<Result<Student>> switchToStudentUser() {
//     return _userRepository.switchToStudentUser();
//   }

//   @override
//   Future<Result<Teacher>> switchToTeacherUser() {
//     return _userRepository.switchToTeacherUser();
//   }

//   @override
//   Future<Result<User>> switchUser() {
//     return _userRepository.switchUser();
//   }
// }
