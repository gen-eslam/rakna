class GarageModel {
  num garageId, avilableSpace, totalSpace, hourPrice;
  String garageName, city, address, longitude, latitude;

  GarageModel({
    required this.garageId,
    required this.garageName,
    required this.city,
    required this.address,
    required this.hourPrice,
    required this.avilableSpace,
    required this.totalSpace,
    required this.longitude,
    required this.latitude,
  });

  factory GarageModel.fromJson(Map<String, dynamic> json) => GarageModel(
        garageId: json['GarageId'] ?? 0,
        garageName: json['GarageName'] ?? "",
        city: json['city'] ?? "",
        address: json['street'] ?? "",
        hourPrice: json['HourPrice'] ?? 0,
        avilableSpace: json['AvailableSpaces'] ?? 0,
        totalSpace: json['TotalSpaces'] ?? 0.0,
        longitude: json['longitude'] ?? "",
        latitude: json['latitude'] ?? "",
      );
  @override
  String toString() {
    return "$garageId \n $avilableSpace \n $address\n $city\n $latitude\n $longitude\n";
  }
}
