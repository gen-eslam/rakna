import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rakna/core/helper/extensions.dart';
import 'package:rakna/core/helper/keys.dart';
import 'package:rakna/core/helper/url_luncher.dart';
import 'package:rakna/core/routing/page_name.dart';
import 'package:rakna/core/services/cache_service.dart';
import 'package:rakna/core/theme/manager/text_style_manager.dart';
import 'package:rakna/core/utils/string_manager.dart';
import 'package:rakna/core/widgets/custom_back_button.dart';
import 'package:rakna/core/widgets/custom_elevated_button.dart';
import 'package:rakna/core/widgets/custom_text.dart';
import 'package:rakna/features/garage_details/view/widget/garage_details.dart';
import 'package:rakna/features/search/data/model/garage_model.dart';
import 'package:url_launcher/url_launcher.dart';

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
        Container(
          height: context.deviceHeight * 0.35,
          width: MediaQuery.of(context).size.width * 0.9,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: GoogleMap(
            zoomControlsEnabled: false,
            markers: {
              Marker(
                markerId: const MarkerId("0"),
                position: LatLng(
                    double.tryParse(
                      garageModel.longitude,
                    )!,
                    double.tryParse(
                      garageModel.latitude,
                    )!),
              )
            },
            initialCameraPosition: CameraPosition(
              zoom: 14,
              target: LatLng(
                  double.tryParse(
                    garageModel.longitude,
                  )!,
                  double.tryParse(
                    garageModel.latitude,
                  )!),
            ),
          ),
        ),
        const Spacer(),
        Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10.r),
                child: CustomElevatedButton(
                  onPressed: () {
                    context.push(PageName.kVisaScreen, extra: garageModel);
                    //   makeReservation(
                    //     token: CacheService.getDataString(key: Keys.token)!,
                    //     garageId: garageModel.garageId as int,
                    //   );
                  },
                  child: CustomText(
                    text: StringManager.makeReservation,
                    style: TextStyleManager.textStyle18w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            IconButton(
                onPressed: () async {
                  if (await canLaunchUrl(
                    Uri.parse(
                      "https://www.google.com/maps/search/?api=1&query=${garageModel.latitude},${garageModel.longitude}",
                    ),
                  )) {
                    await launchUrl(
                      Uri.parse(
                        "https://www.google.com/maps/search/?api=1&query=${garageModel.latitude},${garageModel.longitude}",
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.map_outlined)),
          ],
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
