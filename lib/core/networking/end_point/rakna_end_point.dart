abstract class RaknaEndPoints {
  static const String baseUrl = 'https://raknaapi.azurewebsites.net';
  static const String garagesInCity = "/Garage/GaragesInSpacificCity";
  static const String citys = "/Garage/Cities";
  static const String login = "/api/Auth/Register";
  static const String singUp = "/api/Auth/Register";
  static const String addVehicle = "/api/Driver/AddVehicle";
  static const String reservation = "/api/Driver/Reservation";
  static const String startParkingSession = "/Garage/StartParkingSession";
  static const String endParkingSession = "/Garage/EndParkingSession";
}