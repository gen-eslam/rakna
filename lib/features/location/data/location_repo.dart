import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:rakna/core/error/failure.dart';
import 'package:rakna/core/services/location_service.dart';

abstract class LocationRepo {
  Future<Either<Failures, LocationData>> getCurrentPosition();
  Future<Either<Failures, bool>> requestPermission();

  CameraPosition getCameraPosition(LocationData locationData);
  CameraUpdate updateCameraPosition({required CameraPosition cameraPosition});
}

class LocationRepoImpl extends LocationRepo {
  @override
  Future<Either<Failures, LocationData>> getCurrentPosition() async {
    return await LocationService.getCurrentPosition();
  }

  @override
  Future<Either<Failures, bool>> requestPermission() async {
    return await LocationService.requestPermission();
  }

  @override
  CameraPosition getCameraPosition(LocationData locationData) {
    return CameraPosition(
      target: LatLng(locationData.latitude!, locationData.longitude!),
      zoom: 17,
      bearing: 0.0,
    );
  }

  @override
  CameraUpdate updateCameraPosition({required CameraPosition cameraPosition}) {
    return CameraUpdate.newCameraPosition(cameraPosition);
  }
}
