import 'package:equatable/equatable.dart';

class RegisterModel extends Equatable {
  final String fullName;
  final String nationalId;
  final String email;
  final String password;
  final List<String> role = ["Driver"];
  final String phoneNumber;
  RegisterModel({
    required this.fullName,
    required this.nationalId,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      "fullName": fullName,
      "nationalId": nationalId,
      "userName": "ffffffffff_ffffffffff",
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
        email,
        password,
        role,
        phoneNumber,
      ];
}
