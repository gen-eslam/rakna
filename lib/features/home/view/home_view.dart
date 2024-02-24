import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rakna/core/routing/page_name.dart';
import 'package:rakna/core/theme/manager/text_style_manager.dart';
import 'package:rakna/core/utils/space_Manager.dart';
import 'package:rakna/core/utils/string_manager.dart';
import 'package:rakna/core/widgets/custom_text.dart';
import 'package:rakna/features/home/view/widgets/search_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: StringManager.appName,
          style: TextStyleManager.textStyle30w700,
        ),
        SizedBox(
          height: AppSpace.s48.h,
        ),
        SearchButton(
          onTap: () => context.push(PageName.kSearchView),
        ),
      ],
    );
  }
}
