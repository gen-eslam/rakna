part of 'location_cubit.dart';

abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationSuccess extends LocationState {
  // Position position;
  // CameraPosition cameraPosition;
  // Completer<GoogleMapController> mapController = Completer();

  // LocationSuccess({required this.position, required this.cameraPosition});
}

class LocationFailure extends LocationState {
  final String message;
  LocationFailure({required this.message});
}
