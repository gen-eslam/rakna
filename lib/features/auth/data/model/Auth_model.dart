import 'package:equatable/equatable.dart';

class AuthModel extends Equatable {
  String message, token;

  AuthModel({
    required this.message,
    required this.token,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        message: json["message"],
        token: json["token"],
      );

  static Map<String, dynamic> logIn(
      {required String email, required String password}) {
    return {
      "email": email,
      "password": password,
    };
  }

  @override
  List<Object?> get props => [message, token];
}

// "email": "eslam.abdelazize2002@gmail.com",
// "password": "Eslammohamed@1"
