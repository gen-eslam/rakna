import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rakna/core/routing/page_name.dart';
import 'package:rakna/core/theme/manager/colors_manager.dart';
import 'package:rakna/core/theme/manager/text_style_manager.dart';
import 'package:rakna/core/widgets/custom_text.dart';
import 'package:rakna/features/search/data/model/city_garage_model.dart';

class ListViewItem extends StatelessWidget {
  final CityGarageModel cityGarageModel;
  const ListViewItem({
    super.key,
    required this.cityGarageModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.r),
      onTap: () {
        context.push(PageName.kSearchGarageView, extra: cityGarageModel.name);
      },
      child: Container(
        padding: EdgeInsetsDirectional.all(15.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: ColorsManager.bluishClr.withOpacity(0.1),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          CustomText(
              text: cityGarageModel.name,
              style: TextStyleManager.textStyle14w600),
          CustomText(
              text: cityGarageModel.numberOfGarage.toString(),
              style: TextStyleManager.textStyle14w600),
        ]),
      ),
    );
  }
}
