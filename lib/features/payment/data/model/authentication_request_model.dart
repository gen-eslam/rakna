import 'package:rakna/features/payment/data/model/payment_const_key.dart';

class AuthenticationRequestModel {
  String token;
  AuthenticationRequestModel({
    required this.token,
  });
  factory AuthenticationRequestModel.fromJson(Map<String, dynamic> json) {
    return AuthenticationRequestModel(
      token: json['token'],
    );
  }
  Map<String, dynamic> toJson() => {
        "token": token,
      };
  static Map<String,dynamic> sendBody(){
   return {
      'api_key': PaymentConstKey.apiKey,
    };
  }
}