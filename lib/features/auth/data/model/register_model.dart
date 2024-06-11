import 'package:equatable/equatable.dart';

class RegisterModel extends Equatable {
  final String fullName;
  final String nationalId;
  final String email;
  final String password;
  final String role = "driver";
  final String phoneNumber;
  const RegisterModel({
    required this.fullName,
    required this.nationalId,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      "FullName": fullName,
      "NationalId": nationalId,
      "UserName": fullName,
      "Email": email,
      "Password": password,
      "Role": role,
      "PhoneNumber": phoneNumber,
    };
  }

  @override
  List<Object?> get props => [
        fullName,
        nationalId,
        email,
        password,
        role,
        phoneNumber,
      ];
}
