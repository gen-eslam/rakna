import 'package:equatable/equatable.dart';

class RegisterModel extends Equatable {
  final String fullName;
  final String nationalId;
  final String userName;
  final String email;
  final String password;
  final List<String> role = ["driver"];
  final String phoneNumber;
  RegisterModel({
    required this.fullName,
    required this.nationalId,
    required this.userName,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      "fullName": fullName,
      "nationalId": nationalId,
      "userName": userName,
      "email": email,
      "password": password,
      "role": role,
      "phoneNumber": phoneNumber,
    };
  }

  @override
  List<Object?> get props => [
        fullName,
        nationalId,
        userName,
        email,
        password,
        role,
        phoneNumber,
      ];
}
