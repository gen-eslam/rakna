import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rakna/features/location/data/location_repo.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit({required this.locationRepo}) : super(LocationInitial());

  static LocationCubit get(context) => BlocProvider.of<LocationCubit>(context);

  LocationRepo locationRepo;

  late Position position;
  late CameraPosition cameraPosition;
  Completer<GoogleMapController> mapController = Completer();

  Future<void> initPositionAndCamera() async {
    var result = await locationRepo.getCurrentPosition();
    result.fold(
        (failuer) => emit(
              LocationFailure(
                message: failuer.errorMessage,
              ),
            ), (sucess) {
      position = sucess;
      cameraPosition = locationRepo.getCameraPosition(sucess);
      emit(
        LocationSuccess(),
      );
    });
  }

  Future<void> requestPermission() async {
    var result = await locationRepo.requestPermission();
    result
        .fold((failuer) => emit(LocationFailure(message: failuer.errorMessage)),
            (sucess) {
      initPositionAndCamera();
    });
  }

  void goToMyCurrentLocation() async {
    await mapController.future.then((value) {
      value.animateCamera(
          locationRepo.updateCameraPosition(cameraPosition: cameraPosition));
    });
  }
}
