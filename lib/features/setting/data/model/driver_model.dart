import 'package:rakna/core/helper/keys.dart';
import 'package:rakna/core/services/cache_service.dart';
import 'package:rakna/core/services/jwt_decoder.dart';

class DriverModel {
  String? uid, fullName, email, phoneNumber, nationalId;

  DriverModel(
      {this.uid,
      this.fullName,
      this.email,
      this.phoneNumber,
      this.nationalId,
      });

  factory DriverModel.getDriver({required String token}) {
    Map<String, dynamic> data = JwtDecoderService.decode(token);

    return DriverModel(
      uid: data["uid"],
      fullName: data["FullName"],
      email: data["email"],
      phoneNumber: data["PhoneNumber"],
    );
  }
  void getDriverDataApi({required Map<String, dynamic> data}) {
     
  }
  static String getUid() {
    Map<String, dynamic> data = JwtDecoderService.decode(
        CacheService.getDataString(key: Keys.token) ?? "");
    return data["uid"];
  }
  
}
