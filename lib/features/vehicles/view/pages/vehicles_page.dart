import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rakna/core/helper/enums.dart';
import 'package:rakna/core/helper/keys.dart';
import 'package:rakna/core/networking/dio_helpers.dart';
import 'package:rakna/core/routing/page_name.dart';
import 'package:rakna/core/services/cache_service.dart';
import 'package:rakna/core/theme/manager/colors_manager.dart';
import 'package:rakna/core/widgets/custom_snak_bar.dart';

import '../../logic/vehicles_cubit.dart';
import '../widgets/custom_add_vehicle_icon.dart';

class VehiclesPage extends StatelessWidget {
  const VehiclesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Vehicles"),
        actions: [
          CustomAddVehicleIcon(
            onTap: () {
              context.pushReplacement(PageName.kAddVehicleView);
            },
          ),
        ],
      ),
      body: BlocBuilder<VehiclesCubit, VehiclesState>(
        builder: (context, state) {
          if (state is VehiclesLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.bluishClr,
              ),
            );
          } else if (state is VehiclesSuccess) {
            return ListView.builder(
              itemCount: state.vehicles.length,
              itemBuilder: (context, index) {
                final vehicle = state.vehicles[index];
                print(vehicle.toString());
                return Dismissible(
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20.0),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (direction) {
                    DioHelper.deleteData(
                      url: "/api/Driver/DeleteVehicle",
                      token: CacheService.getDataString(key: Keys.token),
                      queryParameters: {
                        "VehicleId": vehicle.vehicleId,
                      },
                    ).then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        customSnackBar(
                            text: "Vehicle Deleted successfully",
                            colorState: ColorState.sucess),
                      );
                    }).catchError((e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        customSnackBar(
                            text: e.toString(), colorState: ColorState.failure),
                      );
                    });
                  },
                  key: Key(vehicle!.vehicleId.toString()),
                  child: ListTile(
                    title: Text(
                        "Vehicle : ${vehicle.vehicleNumber} ${vehicle.vehicleLetter}"),
                    trailing: const Icon(Icons.drag_handle),
                  ),
                );
              },
            );
          } else if (state is VehiclesFailure) {
            return Center(child: Text(state.errorMessage));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
