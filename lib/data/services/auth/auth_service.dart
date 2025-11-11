import 'package:poruaa_core/data/services/auth/model/auth_model.dart';
import 'package:poruaa_core/utils/result.dart';

abstract class AuthService {
  String? get accessToken;

  Future<Result<AuthModel>> refreshToken(String refreshToken);

  Future<Result<AuthModel>> register(String email, String password);

  Future<Result<AuthModel>> login(String email, String password);
  Future<Result<AuthModel>> loginWithGoogle(String authId);

  Future<Result<void>> logout();

  Future<Result<void>> requestPasswordReset(String email);
}
