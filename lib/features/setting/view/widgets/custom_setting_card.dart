import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/core/helper/extensions.dart';
import 'package:rakna/core/theme/manager/colors_manager.dart';

class CustomSettingCard extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;
  const CustomSettingCard({
    super.key,
    required this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.deviceWidth,
        margin: EdgeInsets.only(bottom: 10.r),
        padding: EdgeInsetsDirectional.all(10.r),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: ColorsManager.bluishClr.withOpacity(0.35),
        ),
        child: child,
      ),
    );
  }
}
