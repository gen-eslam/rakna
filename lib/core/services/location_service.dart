import 'package:dartz/dartz.dart';
import 'package:location/location.dart';
import 'package:rakna/core/error/failure.dart';

class LocationService {
  static Location location = Location();
  static Future<bool> checkLocationPermission() async {
    PermissionStatus object = await location.hasPermission();
    switch (object) {
      case PermissionStatus.granted:
        return true;
      default:
        return false;
    }
  }

  static Future<Either<Failures, bool>> requestPermission() async {
    try {
      if (!await checkLocationPermission()) {
await location.requestPermission();      }
      return Right(await checkLocationPermission());
    } catch (e) {
      return Left(LocalFailures(e.toString()));
    }
  }

  static Future<Either<Failures, LocationData>> getCurrentPosition() async {
    try {
      await checkLocationPermission()
          ? null
          : await location.requestPermission();
      return Right(await location.getLocation());
    } catch (e) {
      return Left(LocalFailures(e.toString()));
    }
  }
}
