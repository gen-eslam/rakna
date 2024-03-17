import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rakna/core/helper/extensions.dart';
import 'package:rakna/core/routing/page_name.dart';
import 'package:rakna/core/theme/manager/colors_manager.dart';
import 'package:rakna/core/theme/manager/text_style_manager.dart';
import 'package:rakna/core/utils/string_manager.dart';
import 'package:rakna/core/widgets/custom_elevated_button.dart';
import 'package:rakna/core/widgets/custom_text.dart';
import 'package:rakna/features/auth/view/widgets/sign_up_form_section.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.deviceWidth * 0.05,
            vertical: context.deviceHeight * 0.04,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  StringManager.signUp,
                  style: TextStyleManager.textStyle30w700
                      .copyWith(color: context.theme.primaryColor),
                ),
                SizedBox(
                  height: context.deviceHeight * 0.050,
                ),
                const SignUpFormSection(),
                SizedBox(
                  height: context.deviceHeight * 0.030,
                ),
                CustomElevatedButton(
                  onPressed: () {},
                  child: CustomText(
                    text: StringManager.signUp,
                    style: TextStyleManager.textStyle15w500,
                    color: ColorsManager.white,
                  ),
                ),
                SizedBox(
                  height: context.deviceHeight * 0.030,
                ),
                Align(
                  alignment: AlignmentDirectional.center,
                  child: RichText(
                      text: TextSpan(
                          text: StringManager.alreadyHaveAccount,
                          style: TextStyleManager.textStyle15w400.copyWith(
                            color: context.isDarkMode
                                ? ColorsManager.white
                                : ColorsManager.black,
                          ),
                          children: [
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.pop();
                              },
                            text: StringManager.signIn,
                            style: TextStyleManager.textStyle15w700.copyWith(
                              color: context.theme.primaryColor,
                            ))
                      ])),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
