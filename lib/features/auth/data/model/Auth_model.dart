import 'package:equatable/equatable.dart';

class AuthModel extends Equatable {
  String? token;
  String? message;
  bool isAuthenticated;

  AuthModel({
    required this.message,
    required this.token,
    required this.isAuthenticated,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        message: json["Message"],
        token: json["Token"],
        isAuthenticated: json["Success"],
      );

  static Map<String, dynamic> logIn(
      {required String email, required String password}) {
    return {
      "Email": email,
      "Password": password,
    };
  }

  @override
  List<Object?> get props => [message, token, isAuthenticated];
}

// "email": "eslam.abdelazize2002@gmail.com",
// "password": "Eslammohamed@1"
