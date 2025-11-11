import 'package:poruaa_core/data/repositories/auth/auth_repository.dart';
import 'package:poruaa_core/data/services/access_token/access_token_service.dart';
import 'package:poruaa_core/data/services/auth/auth_service.dart';
import 'package:poruaa_core/domain/models/auth/auth.dart';
import 'package:poruaa_core/utils/result.dart';
import 'package:rxdart/subjects.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(
    AuthService authService,
    AccessTokenService accessTokenService,
  ) : _authService = authService,
      _accessTokenService = accessTokenService;
  final AuthService _authService;
  final AccessTokenService _accessTokenService;

  final _authSubject = BehaviorSubject<Auth?>.seeded(null);

  @override
  Future<void> load() async {
    var result = await _accessTokenService.refreshToken(_authService);
    if (result == null) {
      return;
    }

    _authSubject.add(Auth(token: result));
    return;
  }

  String? getEmail() {
    var token = currentAuth?.token;
    if (token == null) {
      return null;
    }
    return token.email;
  }

  @override
  Stream<Auth?> get authSnapshot => _authSubject.stream;

  @override
  Auth? get currentAuth => _authSubject.value;

  @override
  Future<Result<Auth>> login(email, password) async {
    var result = await _authService.login(email, password);
    switch (result) {
      case Ok():
        var auth = Auth(token: result.value.token);
        var accessTokenResult = await _accessTokenService.setToken(
          result.value.token.tokenString,
          result.value.refreshToken,
        );
        if (accessTokenResult case Err(:final error)) {
          return Result.error(error);
        }
        _authSubject.add(auth);
        return Result.ok(auth);
      case Err():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<Auth>> loginWithGoogle(String authId) async {
    var result = await _authService.loginWithGoogle(authId);
    switch (result) {
      case Ok():
        var auth = Auth(token: result.value.token);
        var accessTokenResult = await _accessTokenService.setToken(
          result.value.token.tokenString,
          result.value.refreshToken,
        );
        if (accessTokenResult case Err(:final error)) {
          return Result.error(error);
        }
        _authSubject.add(auth);
        return Result.ok(auth);
      case Err():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<void>> logout() async {
    var result = await _authService.logout();
    await _accessTokenService.deleteToken();
    _authSubject.add(null);
    return result;
  }

  @override
  Future<Result<Auth>> register(email, password) async {
    var result = await _authService.register(email, password);
    switch (result) {
      case Ok():
        var auth = Auth(token: result.value.token);
        var accessTokenResult = await _accessTokenService.setToken(
          result.value.token.tokenString,
          result.value.refreshToken,
        );
        if (accessTokenResult case Err(:final error)) {
          return Result.error(error);
        }
        _authSubject.add(auth);
        return Result.ok(auth);
      case Err():
        return Result.error(result.error);
    }
  }

  @override
  Future<Result<void>> requestPasswordReset(String email) async {
    return await _authService.requestPasswordReset(email);
  }

  @override
  void dispose() {
    _authSubject.close();
  }
}
