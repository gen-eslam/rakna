import 'package:jwt_decoder/jwt_decoder.dart';

abstract class JwtDecoderService {
  static Map<String, dynamic> decode(String token) {
    print(isExpired(token));
    return JwtDecoder.decode(token);
  }

  static bool isExpired(String token) {
    return JwtDecoder.isExpired(token);
  }

  static DateTime getExpirationDate(String token) {
    return JwtDecoder.getExpirationDate(token);
  }
}
