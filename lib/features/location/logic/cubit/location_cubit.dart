import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rakna/core/services/setting/setting_repo/setting_repo.dart';
import 'package:rakna/features/location/data/location_repo.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit({required this.locationRepo, required this.settingRepo})
      : super(LocationInitial());

  static LocationCubit get(context) => BlocProvider.of<LocationCubit>(context);

  LocationRepo locationRepo;
  SettingRepo settingRepo;

  Future<void> initPositionAndCamera() async {
    var result = await locationRepo.initPositionAndCamera();
    result.fold(
        (failuer) => emit(
              LocationFailure(
                message: failuer.errorMessage,
              ),
            ), (sucess) {
      emit(
        LocationSuccess(),
      );
    });
  }

  void setMapController(GoogleMapController mapController) {
    var result = locationRepo.setMapController(mapController);
    result.fold(
        (failuer) => emit(LocationFailure(message: failuer.errorMessage)),
        (sucess) => null); // todo remove print
  }

  void getMyCurrentPosition() async {
    var result = await locationRepo.getMyCurrentPosition();
    result.fold(
        (failuer) => emit(LocationFailure(message: failuer.errorMessage)),
        (sucess) => null); // todo remove print
  }

  // Future<void> requestPermission() async {
  //   var result = await locationRepo.requestPermission();
  //   result
  //       .fold((failuer) => emit(LocationFailure(message: failuer.errorMessage)),
  //           (sucess) {
  //     initPositionAndCamera();
  //   });
  // }

  // void goToMyCurrentLocation() {
  //   mapController.animateCamera(
  //     locationRepo.updateCameraPosition(cameraPosition: cameraPosition),
  //   );
  // }

  // void changeMapStyle(String style) {
  //   if (settingRepo.isDarkMode()) {
  //     print("///////////////////////////////////////////////true");
  //     mapController.setMapStyle(style);
  //   } else {
  //     mapController.setMapStyle("[]");
  //   }
  // }

  @override
  Future<void> close() {
    // mapController.dispose();
    return super.close();
  }
}
