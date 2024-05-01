import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rakna/core/networking/dio_helpers.dart';
import 'package:rakna/core/networking/end_point/rakna_end_point.dart';

import '../../../core/helper/keys.dart';
import '../../../core/services/cache_service.dart';

import '../model/vehicles_model.dart';

part 'vehicles_state.dart';

class VehiclesCubit extends Cubit<VehiclesState> {
  VehiclesCubit() : super(VehiclesInitial());

  static VehiclesCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> filterVehicles() async {
    emit(VehiclesLoading());

    try {
      String? token = CacheService.getDataString(key: Keys.token);
      List<VehiclesModel> vehicles = await DioHelper.getData(
              url: RaknaEndPoints.getAllVehicle, token: token)
          .then((value) {
        return (value.data as List)
            .map((e) => VehiclesModel.fromJson(e))
            .toList();
      });
      print(vehicles.length);
      emit(VehiclesSuccess(vehicles));
    } catch (e) {
      emit(VehiclesFailure(e.toString()));
    }
  }
}
