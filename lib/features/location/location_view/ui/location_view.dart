import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/core/helper/extensions.dart';
import 'package:rakna/core/theme/manager/colors_manager.dart';

class LocationView extends StatelessWidget {
  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomButton(),
        CustomButton(),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          margin: EdgeInsets.only(bottom: 20.h),
          padding: EdgeInsets.all(20.r),
          decoration: BoxDecoration(
            color: context.isDarkMode
                ? ColorsManager.darkHeaderClr
                : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(30.r),
          ),
          width: MediaQuery.of(context).size.width,
          child: Text(context.isDarkMode.toString())),
    );
  }
}
