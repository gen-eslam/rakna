import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rakna/core/theme/manager/colors_manager.dart';
import 'package:rakna/core/theme/manager/text_style_manager.dart';
import 'package:rakna/core/utils/string_manager.dart';
import 'package:rakna/core/widgets/custom_elevated_button.dart';
import 'package:rakna/core/widgets/custom_error.dart';
import 'package:rakna/core/widgets/custom_loading.dart';
import 'package:rakna/core/widgets/custom_text.dart';
import 'package:rakna/features/location/cubit/location_cubit.dart';
import 'package:rakna/features/location/ui/widget/custom_location_search.dart';

class LocationView extends StatelessWidget {
  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
        fit: StackFit.loose,
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.topCenter,
        children: [
          BlocBuilder<LocationCubit, LocationState>(builder: (context, state) {
            if (state is LocationFailure) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomError(
                    errorMessage: state.message,
                  ),
                  CustomElevatedButton(
                      child: CustomText(
                        text: StringManager.retry,
                        style: TextStyleManager.textStyle15w500,
                        color: ColorsManager.white,
                      ),
                      onPressed: () async {
                         LocationCubit.get(context).requestPermission();
                      }),
                ],
              );
            } else if (state is LocationSuccess) {
              return GoogleMap(
                initialCameraPosition: state.cameraPosition,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                mapType: MapType.normal,
                onMapCreated: (GoogleMapController controller) {
                  if (!state.mapController.isCompleted) {
                    state.mapController.complete(controller);
                  }
                },
              );
            } else {
              return const CustomLoading();
            }
          }),
          const CustomLocationSearch(),
        ]);
  }
}
