import 'package:poruaa_core/domain/models/auth/auth.dart';
import 'package:poruaa_core/utils/result.dart';

abstract class AuthRepository {
  Stream<Auth?> get authSnapshot;
  Auth? get currentAuth;
  Future<void> load();
  Future<Result<Auth>> login(String email, String password);
  Future<Result<Auth>> loginWithGoogle(String authId);
  Future<Result<Auth>> register(String email, String password);
  Future<Result<void>> logout();
  Future<Result<void>> requestPasswordReset(String email);
  void dispose();
}
