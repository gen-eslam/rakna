import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rakna/core/utils/string_manager.dart';
import 'package:rakna/core/widgets/custom_back_button.dart';
import 'package:rakna/features/garage_details/view/widget/garage_details.dart';
import 'package:rakna/features/search/data/model/garage_model.dart';

class GarageDetailsView extends StatelessWidget {
  final GarageModel garageModel;
  const GarageDetailsView({super.key, required this.garageModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text(StringManager.garageDetails),
      ),
      body: Column(children: [
        GarageDetails(garageModel: garageModel),
        SizedBox(
          height: 300.h,
          width: double.infinity,
          child: GoogleMap(
              initialCameraPosition: CameraPosition(
                  zoom: 17,
                  target: LatLng(double.tryParse(garageModel.latitude) ?? 0,
                      double.tryParse(garageModel.longitude) ?? 0))),
        ),
      ]),
    );
  }
}

class CustomSizedBox extends StatelessWidget {
  const CustomSizedBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.r,
    );
  }
}
