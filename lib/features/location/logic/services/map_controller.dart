import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController {
  GoogleMapController? _mapController;
  final CameraPosition _cameraPosition =
      const CameraPosition(target: LatLng(0, 0), zoom: 0);

  CameraPosition get cameraPosition => _cameraPosition;

  set setMapController(GoogleMapController mapController) =>
      _mapController = mapController;

  void changeMapStyle(String style) {
    _mapController!.setMapStyle(style);
  }

  void changeCameraPosition({required double lat, required double long}) {
    _mapController?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, long), zoom: 17)));
  }
}
