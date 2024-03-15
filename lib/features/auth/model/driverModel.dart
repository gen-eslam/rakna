class DriverModel {
  String fullName;
  String nationalId;
  String userName;
  String email;
  String password;
  List<String> role = ["driver"];
  String phoneNumber;

  DriverModel({
    required this.fullName,
    required this.nationalId,
    required this.userName,
    required this.email,
    required this.password,
    required this.role,
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
}
// {
//   "fullName": "eslam abdelazizi mohamed",
//   "nationalId": "30202261402137",
//   "userName": "gen-eslam",
//   "email": "eslam.abdelazize2002@gmail.com",
//   "password": "Eslammohamed@1",
//   "role": [
//     "driver"
//   ],
//   "phoneNumber": "01551953697"
// }