abstract class RaknaEndPoints {
  static const String baseUrl = 'https://raknaapi.azurewebsites.net';
  static const String garagesInCity = "/Garage/GaragesInSpacificCity";
  static const String citys = "/Garage/Cities";
  static const String login = "/api/Auth/Login";
  static const String singUp = "/api/Auth/Register";
  static const String addVehicle = "/api/Driver/AddVehicle";
  static const String makeReservation = "/api/Driver/MakeReservation";
  static const String getReservations = "/api/Driver/GetAllReservation";
  static const String getAllVehicle = "/api/Driver/GetAllVehicle";
  static const String getDriverProfile = "/api/Driver/DriverProfileDetails";
}
