import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rakna/core/error/failure.dart';
import 'package:rakna/core/services/location_service.dart';

abstract class LocationRepo {
  Future<Either<Failures, Position>> getCurrentPosition();
  Future<Either<Failures, bool>> requestPermission();
}

class LocationRepoImpl extends LocationRepo {
  @override
  Future<Either<Failures, Position>> getCurrentPosition() async {
    return await LocationService.getCurrentPosition();
  }

  @override
  Future<Either<Failures, bool>> requestPermission() async {
    return await LocationService.requestPermission();
  }
}
