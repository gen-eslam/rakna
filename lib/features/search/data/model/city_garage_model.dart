class CityGarageModel {
  String name;
  int numberOfGarage;

  CityGarageModel({required this.name, required this.numberOfGarage});
  factory CityGarageModel.fromJson(Map<String, dynamic> json) =>
      CityGarageModel(
        name: json['City'],
        numberOfGarage: json['NumberOfGarage'] ?? 0,
      );
}
