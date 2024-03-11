class CityGarageModel {
  String name;
  int numberOfGarage;

  CityGarageModel({required this.name, required this.numberOfGarage});
  factory CityGarageModel.fromJson(Map<String, dynamic> json) =>
      CityGarageModel(
        name: json['city'],
        numberOfGarage: json['numberOfGarage'] ?? 0,
      );
}
