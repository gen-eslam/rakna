import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/core/theme/manager/colors_manager.dart';
import 'package:rakna/core/theme/manager/text_style_manager.dart';
import 'package:rakna/core/widgets/custom_text.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.r),
      onTap: () {},
      child: Container(
        padding: EdgeInsetsDirectional.all(15.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: ColorsManager.bluishClr.withOpacity(0.1),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          CustomText(text: "text", style: TextStyleManager.textStyle14w600),
          CustomText(text: "5", style: TextStyleManager.textStyle14w600),
        ]),
      ),
    );
  }
}
