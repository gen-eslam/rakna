

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/core/theme/manager/colors_manager.dart';
import 'package:rakna/core/theme/manager/text_style_manager.dart';
import 'package:rakna/core/utils/space_Manager.dart';
import 'package:rakna/core/utils/string_manager.dart';
import 'package:rakna/core/widgets/custom_text.dart';

class SearchButton extends StatelessWidget {
  final void Function()? onTap;
  const SearchButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50.h,
        padding: EdgeInsetsDirectional.all(5.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.all(Radius.circular(16.r)),
          color: ColorsManager.bluishClr.withOpacity(0.1),
        ),
        child: Row(children: [
          Icon(
            Icons.search,
            size: 25.r,
          ),
          SizedBox(
            width: AppSpace.s16.w,
          ),
          CustomText(
            text: StringManager.whereTo,
            style: TextStyleManager.textStyle15w500,
          ),
        ]),
      ),
    );
  }
}
