import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:rakna/core/services/setting/setting_repo/setting_repo.dart';
import 'package:rakna/features/location/data/location_repo.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit({required this.locationRepo, required this.settingRepo})
      : super(LocationInitial());

  static LocationCubit get(context) => BlocProvider.of<LocationCubit>(context);

  LocationRepo locationRepo;
  SettingRepo settingRepo;

  late LocationData position;
  late CameraPosition cameraPosition;
  late GoogleMapController mapController;

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

  void goToMyCurrentLocation() {
    mapController.animateCamera(
      locationRepo.updateCameraPosition(cameraPosition: cameraPosition),
    );
  }

  void changeMapStyle(String style) {
    if (settingRepo.isDarkMode()) {
      print("///////////////////////////////////////////////true");
      mapController.setMapStyle(style);
    } else {
      mapController.setMapStyle("[]");
    }
  }

  @override
  Future<void> close() {
    mapController.dispose();
    return super.close();
  }
}
