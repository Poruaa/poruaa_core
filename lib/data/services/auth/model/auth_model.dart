import 'package:poruaa_core/data/services/access_token/model/access_token.dart';

class AuthModel {
  const AuthModel(this.token, this.refreshToken);
  final AccessToken token;
  final String refreshToken;

  static AuthModel? fromJson(Map<String, dynamic> json) {
    try {
      var accessToken = AccessToken.fromString(json['access_token']);
      if (accessToken == null) {
        return null;
      }
      return AuthModel(accessToken, json['refresh_token']);
    } catch (e) {
      return null;
    }
  }
}
