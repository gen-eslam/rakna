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

  Future<void> initPositionAndCamera() async {
    var result = await locationRepo.getCurrentPosition();
    result
        .fold((failuer) => emit(LocationFailure(message: failuer.errorMessage)),
            (sucess) {
      position = sucess;
      emit(
        LocationSuccess(
          position: sucess,
          cameraPosition: CameraPosition(
            target: LatLng(sucess.latitude, sucess.longitude),
            zoom: 17,
            bearing: 0.0,
          ),
        ),
      );
    });
  }

  Future<void> requestPermission() async {
    var result = await locationRepo.requestPermission();
    result
        .fold((failuer) => emit(LocationFailure(message: failuer.errorMessage)),
            (sucess) {
      print("///////////////////calllllllllll");
      initPositionAndCamera();
    });
  }
}
