import 'package:poruaa_core/data/services/access_token/model/access_token.dart';

class Auth {
  final AccessToken token;

  Auth({required this.token});

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(token: json['token']);
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }
}
