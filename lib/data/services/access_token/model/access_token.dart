import 'package:jwt_decoder/jwt_decoder.dart';

class AccessToken {
  AccessToken(
    this.tokenString,
    this.id,
    this.exp,
    this.email,
    this.isEmailVerified,
    this.sub,
  );
  final String tokenString;
  final int id;
  final DateTime exp;
  final String email;
  final bool isEmailVerified;
  final int sub;

  bool isExpired() {
    return exp.isBefore(DateTime.now());
  }

  static AccessToken? fromString(String tokenString) {
    try {
      var map = JwtDecoder.decode(tokenString);

      var idData = map['id'];
      if (idData is! num) {
        return null;
      }
      var expData = map['exp'];
      if (expData is! num) {
        return null;
      }

      var exp = DateTime.fromMillisecondsSinceEpoch(
        expData.toInt() * 1000,
      ).toLocal();

      // Extract new JWT claims with defaults
      var isEmailVerified = map['is_email_verified'] ?? false;
      var subData = map['sub'];
      var sub = subData is num ? subData.toInt() : 0;

      return AccessToken(
        tokenString,
        idData.toInt(),
        exp,
        map['email'],
        isEmailVerified,
        sub,
      );
    } catch (_) {
      return null;
    }
  }
}
