import 'package:location/location.dart';

class LocationService {
  final Location _location = Location();
  // late LocationData locationData;
  Future<bool> init() async {
    bool isServiceEnable = await checkAndRequestLocationService();
    bool isPermissionEnable = await checkAndRequestLocationPermission();
    if (isPermissionEnable && isServiceEnable) {
      return true;
    }
    return false;
  }

  Future<bool> checkAndRequestLocationService() async {
    bool isServiceEnabled = await _location.serviceEnabled();
    if (!isServiceEnabled) {
      isServiceEnabled = await _location.requestService();
      if ((!isServiceEnabled)) {
        return false;
      }
    }
    return true;
  }

  Future<bool> checkAndRequestLocationPermission() async {
    PermissionStatus permissionStatus = await _location.hasPermission();
    if (permissionStatus == PermissionStatus.deniedForever) {
      return false;
    }
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await _location.requestPermission();
      return permissionStatus == PermissionStatus.granted;
    }
    return true;
  }

  void getRealTimeLocation(void Function(LocationData)? onData) {
    _location.onLocationChanged.listen(onData);
  }
}
