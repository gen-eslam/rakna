import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/core/theme/manager/colors_manager.dart';
import 'package:rakna/core/theme/manager/text_style_manager.dart';
import 'package:rakna/core/widgets/custom_text.dart';
import 'package:rakna/features/setting/logic/cubit/setting_cubit.dart';

class DriverDeteils extends StatelessWidget {
  const DriverDeteils({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.all(20.r),
      decoration: BoxDecoration(
        color: ColorsManager.bluishClr.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
              text: SettingCubit.get(context).driverModel!.fullName!,
              textAlign: TextAlign.start,
              style: TextStyleManager.textStyle26w700),
          SizedBox(height: 5.h),
          CustomText(
              text: SettingCubit.get(context).driverModel!.email!,
              textAlign: TextAlign.start,
              style: TextStyleManager.textStyle15w500),
          SizedBox(height: 5.h),
          CustomText(
              text: SettingCubit.get(context).driverModel!.phoneNumber!,
              textAlign: TextAlign.start,
              style: TextStyleManager.textStyle15w500),
        ],
      ),
    );
  }
}
