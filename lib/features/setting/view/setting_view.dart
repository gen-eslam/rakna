import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rakna/core/helper/keys.dart';
import 'package:rakna/core/routing/page_name.dart';
import 'package:rakna/core/services/cache_service.dart';
import 'package:rakna/core/theme/manager/colors_manager.dart';
import 'package:rakna/core/theme/manager/text_style_manager.dart';
import 'package:rakna/core/utils/string_manager.dart';
import 'package:rakna/core/widgets/custom_text.dart';
import 'package:rakna/features/setting/logic/cubit/setting_cubit.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  void didChangeDependencies() {
    SettingCubit.get(context).getDriverData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: CustomText(
          text: StringManager.settings,
          textAlign: TextAlign.start,
          style: TextStyleManager.textStyle18w600,
        ),
        actions: [
          IconButton(
            onPressed: () {
              CacheService.removeData(key: Keys.token);
              context.go(PageName.kLoginView);
            },
            icon: const Icon(
              Icons.exit_to_app,
              color: ColorsManager.pinkClr,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsetsDirectional.all(10.r),
            padding: EdgeInsetsDirectional.all(20.r),
            decoration: BoxDecoration(
              color: ColorsManager.bluishClr.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Column(children: [
              CustomText(
                  text: SettingCubit.get(context).driverModel!.fullName!,
                  style: TextStyleManager.textStyle18w600),
            ]),
          ),
        ],
      ),
    );
  }
}
