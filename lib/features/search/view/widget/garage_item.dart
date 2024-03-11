import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rakna/core/routing/page_name.dart';
import 'package:rakna/core/theme/manager/colors_manager.dart';
import 'package:rakna/core/theme/manager/text_style_manager.dart';
import 'package:rakna/core/utils/space_Manager.dart';
import 'package:rakna/core/widgets/custom_text.dart';
import 'package:rakna/features/search/data/model/garage_model.dart';

class GarageItem extends StatelessWidget {
  final GarageModel garageModel;
  const GarageItem({
    super.key,
    required this.garageModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.r),
      onTap: () {
        context.push(PageName.kGarageDetailsView, extra: garageModel);
      },
      child: Container(
        padding: EdgeInsetsDirectional.all(AppPadding.p16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: ColorsManager.bluishClr.withOpacity(0.1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: garageModel.garageName,
                    style: TextStyleManager.textStyle14w600,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 10.r,
                  ),
                  CustomText(
                    text: garageModel.address,
                    style: TextStyleManager.textStyle14w600,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  CustomText(
                    text: "Avilable Space",
                    style: TextStyleManager.textStyle14w600,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 10.r,
                  ),
                  CustomText(
                    text: garageModel.avilableSpace.toString(),
                    style: TextStyleManager.textStyle15w500,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
