import 'package:equatable/equatable.dart';

class VehiclesModel extends Equatable {
  String vehicleNumber;
  String vehicleLetter;

  VehiclesModel({required this.vehicleNumber, required this.vehicleLetter});

  factory VehiclesModel.fromJson(Map<String, dynamic> json) {
    return VehiclesModel(
      vehicleNumber: json['VehicleNumber'],
      vehicleLetter: json['VehicleLetter'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['VehicleNumber'] = vehicleNumber;
    data['VehicleLetter'] = vehicleLetter;
    return data;
  }

  @override
  String toString() {
    return 'VehiclesModel{vehicleNumber: $vehicleNumber, vehicleLetter: $vehicleLetter}';
  }

  @override
  List<Object?> get props => [vehicleNumber, vehicleLetter];
}
