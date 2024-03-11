import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakna/features/search/data/model/city_garage_model.dart';
import 'package:rakna/features/search/data/model/garage_model.dart';

import 'package:rakna/features/search/data/repo/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.searchRepo}) : super(SearchInitial());
  SearchRepo searchRepo;
  late String city;

  void getCitys() async {
    emit(SearchLoading());
    final result = await searchRepo.getCitys();
    result.fold((fail) => emit(SearchError(fail.errorMessage)), (sucess) {
      emit(SearchSuccess(sucess));
    });
  }

  void getGaragesInCity({required String city}) async {
    emit(SearchGarageLoading());
    final result = await searchRepo.getGaragesInCity(city: city);
    result.fold((fail) => emit(SearchGarageError(fail.errorMessage)), (sucess) {
      sucess.sort(
        (a, b) => b.avilableSpace.compareTo(a.avilableSpace),
      );
      emit(SearchGarageSuccess(sucess));
    });
  }
}
