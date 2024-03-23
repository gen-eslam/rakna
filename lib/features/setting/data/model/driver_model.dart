import 'package:rakna/core/helper/keys.dart';
import 'package:rakna/core/services/cache_service.dart';
import 'package:rakna/core/services/jwt_decoder.dart';

class DriverModel {
  String? uid, fullName, email, phoneNumber, nationalId, userName;

  DriverModel(
      {this.uid,
      this.fullName,
      this.email,
      this.phoneNumber,
      this.nationalId,
      this.userName});

  factory DriverModel.getDriver({required String token}) {
    Map<String, dynamic> data = JwtDecoderService.decode(token);

    return DriverModel(
      uid: data["uid"],
      fullName: data["FullName"],
      email: data["email"],
      phoneNumber: data["PhoneNumber"],
    );
  }
  static String getUid() {
    Map<String, dynamic> data = JwtDecoderService.decode(
        CacheService.getDataString(key: Keys.token) ?? "");
    print(data);
    return data["uid"];
  }
  
}
