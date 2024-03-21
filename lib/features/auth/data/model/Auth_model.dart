import 'package:equatable/equatable.dart';
import 'package:rakna/core/services/jwt_decoder.dart';

class AuthModel extends Equatable {
  String message, token;
  bool isAuthenticated;
  String? uid, fullName, email, phoneNumber, nationalId, userName;

  AuthModel({
    required this.message,
    required this.token,
    required this.isAuthenticated,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        message: json["message"],
        token: json["token"],
        isAuthenticated: json["isAuthenticated"],
      );

  void decodeToken() {
    Map<String, dynamic> data = JwtDecoderService.decode(token);
    uid = data["uid"];
    fullName = data["FullName"];
    email = data["email"];
    phoneNumber = data["PhoneNumber"];
  }
  static String getUid({required String token}) {
    Map<String, dynamic> data = JwtDecoderService.decode(token);
    return data["uid"];
  }


  static Map<String, dynamic> logIn(
      {required String email, required String password}) {
    return {
      "email": email,
      "password": password,
    };
  }

  @override
  List<Object?> get props => [message, token, isAuthenticated];
}

// "email": "eslam.abdelazize2002@gmail.com",
// "password": "Eslammohamed@1"
