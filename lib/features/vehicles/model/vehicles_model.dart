import 'package:equatable/equatable.dart';

class VehiclesModel extends Equatable {
  String vehicleNumber;
  String vehicleLetter;
  int? vehicleId;

  VehiclesModel(
      {required this.vehicleNumber,
      required this.vehicleLetter,
      this.vehicleId});

  factory VehiclesModel.fromJson(Map<String, dynamic> json) {
    return VehiclesModel(
      vehicleNumber: json['PlateNumber'],
      vehicleId: json['Id'],
      vehicleLetter: json['PlateLetter'],
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
    return 'VehiclesModel{vehicleNumber: $vehicleNumber, vehicleLetter: $vehicleLetter, vehicleId: $vehicleId}';
  }

  @override
  List<Object?> get props => [vehicleNumber, vehicleLetter];
}
