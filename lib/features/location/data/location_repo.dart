import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:rakna/features/location/logic/services/location_service.dart';
import 'package:rakna/features/location/logic/services/map_controller.dart';

import '../../../core/error/failure.dart';

abstract class LocationRepo {
  Future<Either<Failures, void>> getMyCurrentPosition();
  Future<Either<Failures, bool>> initPositionAndCamera();
  Either<Failures, void> setMapController(GoogleMapController mapController);
}

class LocationRepoImpl extends LocationRepo {
  LocationService locationService;
  MapController mapController;

  LocationRepoImpl(
      {required this.locationService, required this.mapController});

  @override
  Either<Failures, void> setMapController(GoogleMapController mapController) {
    try {
      this.mapController.setMapController = mapController;
      return const Right(null);
    } catch (e) {
      return Left(LocalFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, void>> getMyCurrentPosition() async {
    try {
      await locationService.checkAndRequestLocationService();
      locationService.getRealTimeLocation(
        (locationData) {
          mapController.changeCameraPosition(
            lat: locationData.latitude!,
            long: locationData.longitude!,
          );
        },
      );

      return const Right(null);
    } catch (e) {
      return Left(LocalFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, bool>> initPositionAndCamera() async {
    try {
      var result = await locationService.init();
      return Right(result);
    } catch (e) {
      return Left(LocalFailures(e.toString()));
    }
  }
}
