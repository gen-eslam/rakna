import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rakna/core/error/failure.dart';

class LocationService {
  static Future<bool> checkLocationPermission() async {
    LocationPermission object = await Geolocator.checkPermission();
    switch (object) {
      case LocationPermission.whileInUse || LocationPermission.always:
        print("trueeeeeeeeeeeeeeeeeeeee");
        return true;
      default:
        return false;
    }
  }

  static Future<Either<Failures, bool>> requestPermission() async {
    try {
      if (!await checkLocationPermission()) {
        await openAppSettings();
      }
      return Right(await checkLocationPermission());
    } catch (e) {
      return Left(LocalFailures(e.toString()));
    }
  }

  static Future<Either<Failures, Position>> getCurrentPosition() async {
    try {
      await checkLocationPermission()
          ? null
          : await Geolocator.requestPermission();
      return Right(await Geolocator.getCurrentPosition());
    } catch (e) {
      return Left(LocalFailures(e.toString()));
    }
  }
}
