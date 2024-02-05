import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rakna/core/services/setting/cubit/setting_cubit.dart';
import 'package:rakna/core/theme/manager/colors_manager.dart';
import 'package:rakna/core/theme/manager/text_style_manager.dart';
import 'package:rakna/core/utils/string_manager.dart';
import 'package:rakna/core/widgets/custom_elevated_button.dart';
import 'package:rakna/core/widgets/custom_error.dart';
import 'package:rakna/core/widgets/custom_loading.dart';
import 'package:rakna/core/widgets/custom_text.dart';
import 'package:rakna/features/location/cubit/location_cubit.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  late LocationCubit cubit;
  late String style;

  @override
  void didChangeDependencies() async {
    cubit = LocationCubit.get(context);
    style = await LocationCubit.get(context)
        .settingRepo
        .loadMapStyle(context: context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        fit: StackFit.loose,
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.topCenter,
        children: [
          BlocBuilder<LocationCubit, LocationState>(builder: (_, state) {
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
                  initialCameraPosition: cubit.cameraPosition,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  mapType: MapType.normal,
                  onMapCreated: (GoogleMapController controller) {
                    cubit.mapController = controller;
                    cubit.changeMapStyle(style);
                    cubit.goToMyCurrentLocation();
                  });
            } else {
              return const CustomLoading();
            }
          }),
          Positioned(
            right: 5.r,
            bottom: 10.r,
            child: GestureDetector(
              onTap: () {
                cubit.goToMyCurrentLocation();
              },
              child: const CircleAvatar(
                child: Icon(Icons.location_on),
              ),
            ),
          ),
        ]);
  }
}
