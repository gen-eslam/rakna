part of 'vehicles_cubit.dart';

@immutable
sealed class VehiclesState {}

final class VehiclesInitial extends VehiclesState {}

final class VehiclesLoading extends VehiclesState {}

final class VehiclesSuccess extends VehiclesState {
  final List<VehiclesModel?> vehicles;

  VehiclesSuccess(this.vehicles);
}

final class VehiclesFailure extends VehiclesState {
  final String errorMessage;

  VehiclesFailure(this.errorMessage);
}
