import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/core/helper/extensions.dart';
import 'package:rakna/core/theme/manager/colors_manager.dart';
import 'package:rakna/core/theme/manager/text_style_manager.dart';
import 'package:rakna/core/utils/string_manager.dart';
import 'package:rakna/core/widgets/custom_elevated_button.dart';
import 'package:rakna/core/widgets/custom_text.dart';
import 'package:rakna/features/auth/logic/login_cubit/login_cubit.dart';
import 'package:rakna/features/auth/logic/register_cubit/register_cubit.dart';
import 'package:rakna/features/otp/view/widget/coustom_pin_put.dart';
import 'package:http/http.dart' as http;

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 15.w,
            right: 15.w,
            top: context.deviceHeight * 0.10,
          ),
          child: Form(
            key: RegisterCubit.get(context).otpformKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 32.h,
                ),
                CustomText(
                  text: StringManager.enterOtp,
                  style: TextStyleManager.textStyle30w700,
                ),
                SizedBox(
                  height: 16.h,
                ),
                CustomText(
                  text: StringManager.otpMessage,
                  style: TextStyleManager.textStyle30w700,
                ),
                SizedBox(
                  height: 32.h,
                ),
                const CustomPinPut(),
                const Spacer(),
                CustomElevatedButton(
                  onPressed: () async {
                    await LaunchApp.openApp(
                      androidPackageName: 'com.google.android.gm',
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.email_outlined,
                        color: ColorsManager.white,
                        size: 20.r,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      CustomText(
                        text: "Open Gmail",
                        style: TextStyleManager.textStyle18w600,
                        color: ColorsManager.white,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.w,
                ),
                CustomElevatedButton(
                  onPressed: () {
                    if (RegisterCubit.get(context)
                        .otpformKey
                        .currentState!
                        .validate()) {
                      RegisterCubit.get(context).verifyEmailAndLogin();
                    }
                  },
                  child: CustomText(
                    text: "Submit OTP",
                    style: TextStyleManager.textStyle18w600,
                    color: ColorsManager.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: Container(
      //   margin: EdgeInsets.symmetric(vertical: 20.h),
      //   child:
      // ),
    );
  }
}
