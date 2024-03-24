import 'package:equatable/equatable.dart';

class AuthModel extends Equatable {
  String message, token;
  bool isAuthenticated;

  AuthModel({
    required this.message,
    required this.token,
    required this.isAuthenticated,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        message: json["message"],
        token: json["token"],
        isAuthenticated: json["success"],
      );

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
