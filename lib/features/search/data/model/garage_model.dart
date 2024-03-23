class GarageModel {
  int garageId, avilableSpace, totalSpace;
  String garageName, city, address, longitude, latitude;
  double hourPrice;

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
        garageId: json['garageId'] ?? 0,
        garageName: json['garageName'] ?? "",
        city: json['city'] ?? "",
        address: json['street'] ?? "",
        hourPrice: json['hourPrice'] ?? 0.0,
        avilableSpace: json['availableSpaces'] ?? 0,
        totalSpace: json['totalSpaces'] ?? 0.0,
        longitude: json['longitude'] ?? "",
        latitude: json['latitude'] ?? "",
      );
  @override
  String toString() {
    return "$garageId \n $avilableSpace \n $address\n $city\n $latitude\n $longitude\n";
  }
}
