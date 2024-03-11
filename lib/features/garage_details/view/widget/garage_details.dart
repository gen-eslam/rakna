import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/core/theme/manager/colors_manager.dart';
import 'package:rakna/core/utils/string_manager.dart';
import 'package:rakna/features/garage_details/view/garage_details_view.dart';
import 'package:rakna/features/garage_details/view/widget/garage_title_and_details.dart';
import 'package:rakna/features/search/data/model/garage_model.dart';

class GarageDetails extends StatelessWidget {
  const GarageDetails({
    super.key,
    required this.garageModel,
  });

  final GarageModel garageModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.all(10.r),
      padding: EdgeInsetsDirectional.all(20.r),
      decoration: BoxDecoration(
        color: ColorsManager.bluishClr.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(children: [
        const CustomSizedBox(),
        GarageTitleAndDetails(
            title: StringManager.garageName, details: garageModel.garageName),
        const CustomSizedBox(),
        GarageTitleAndDetails(
            title: StringManager.garageAddress, details: garageModel.address),
        const CustomSizedBox(),
        GarageTitleAndDetails(
          title: StringManager.hourPrice,
          details: garageModel.hourPrice.toString(),
        ),
        const CustomSizedBox(),
        GarageTitleAndDetails(
          title: StringManager.totalSpace,
          details: garageModel.totalSpace.toString(),
        ),
        const CustomSizedBox(),
        GarageTitleAndDetails(
          title: StringManager.availableSpace,
          details: garageModel.avilableSpace.toString(),
        ),
        const CustomSizedBox(),
      ]),
    );
  }
}
