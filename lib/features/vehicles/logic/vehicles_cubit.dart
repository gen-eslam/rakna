import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helper/keys.dart';
import '../../../core/services/cache_service.dart';

import '../model/vehicles_model.dart';

part 'vehicles_state.dart';

class VehiclesCubit extends Cubit<VehiclesState> {
  VehiclesCubit() : super(VehiclesInitial());

  static VehiclesCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> filterVehicles() async {
    try {
      String? token = CacheService.getDataString(key: Keys.token);

      if (token != null) {
     
        // emit(
        //   VehiclesSuccess([<VehiclesModel>[]]),
        // );
      } else {
        emit(VehiclesFailure('not found'));
      }
    } catch (e) {
      emit(VehiclesFailure(e.toString()));
    }
  }
}
