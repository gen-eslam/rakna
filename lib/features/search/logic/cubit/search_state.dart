part of 'search_cubit.dart';

abstract class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<CityGarageModel> garages;
  SearchSuccess(this.garages);
}

final class SearchError extends SearchState {
  final String message;
  SearchError(this.message);
}

final class SearchGarageLoading extends SearchState {}

final class SearchGarageSuccess extends SearchState {
  final List<GarageModel> garages;
  SearchGarageSuccess(this.garages);
}

final class SearchGarageError extends SearchState {
  final String message;
  SearchGarageError(this.message);
}