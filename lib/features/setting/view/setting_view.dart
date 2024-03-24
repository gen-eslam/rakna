import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rakna/core/helper/extensions.dart';
import 'package:rakna/core/helper/keys.dart';
import 'package:rakna/core/routing/page_name.dart';
import 'package:rakna/core/services/cache_service.dart';
import 'package:rakna/core/theme/manager/colors_manager.dart';
import 'package:rakna/core/theme/manager/text_style_manager.dart';
import 'package:rakna/core/utils/string_manager.dart';
import 'package:rakna/core/widgets/custom_text.dart';
import 'package:rakna/features/setting/logic/cubit/setting_cubit.dart';
import 'package:rakna/features/setting/view/widgets/custom_setting_card.dart';
import 'package:rakna/features/setting/view/widgets/driver_deteils.dart';

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
      body: Padding(
        padding: EdgeInsetsDirectional.all(10.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DriverDeteils(),
            SizedBox(height: 20.h),
            CustomSettingCard(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: StringManager.changeTheme,
                    textAlign: TextAlign.start,
                    style: TextStyleManager.textStyle18w600,
                  ),
                  BlocBuilder<SettingCubit, SettingState>(
                    builder: (context, state) {
                      return Switch(
                        value: SettingCubit.get(context).themeMode ==
                                ThemeMode.dark
                            ? true
                            : false,
                        onChanged: (value) {
                          SettingCubit.get(context).changeTheme();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            CustomSettingCard(
              child: Row(
                children: [
                  const Icon(Icons.support_agent_rounded),
                  const SizedBox(width: 10),
                  CustomText(
                    text: StringManager.makeComplaint,
                    textAlign: TextAlign.start,
                    style: TextStyleManager.textStyle18w600,
                  ),
                ],
              ),
            ),
            CustomSettingCard(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const CarPlatesWidet();
                    });
              },
              child: Row(
                children: [
                  const Icon(Icons.key_rounded),
                  const SizedBox(width: 10),
                  CustomText(
                    text: StringManager.carPlates,
                    textAlign: TextAlign.start,
                    style: TextStyleManager.textStyle18w600,
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

class CarPlatesWidet extends StatelessWidget {
  const CarPlatesWidet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      child: Column(children: [
        Padding(
          padding: EdgeInsetsDirectional.all(10.r),
          child: Row(
            children: [
              CustomText(
                text: StringManager.carPlates,
                textAlign: TextAlign.start,
                style: TextStyleManager.textStyle18w600,
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.add_circle_outline_rounded),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.close,
                  color: ColorsManager.pinkClr,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        ...List.generate(
          5,
          (index) => Container(
            width: context.deviceWidth,
            margin: EdgeInsets.all(5.r),
            color: ColorsManager.bluishClr.withOpacity(0.4),
            padding: EdgeInsetsDirectional.all(10.r),
            child: CustomText(
              text: index.toString(),
              textAlign: TextAlign.start,
              style: TextStyleManager.textStyle18w600,
            ),
          ),
        ),
        const Spacer(),
      ]),
    );
  }
}
