import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rakna/core/helper/extensions.dart';
import 'package:rakna/core/routing/page_name.dart';
import 'package:rakna/core/theme/manager/colors_manager.dart';
import 'package:rakna/core/theme/manager/text_style_manager.dart';
import 'package:rakna/core/utils/space_Manager.dart';
import 'package:rakna/core/utils/string_manager.dart';
import 'package:rakna/core/widgets/custom_elevated_button.dart';
import 'package:rakna/core/widgets/custom_text.dart';
import 'package:rakna/features/auth/logic/auth_cubit/auth_cubit.dart';
import 'package:rakna/features/auth/view/widgets/login_form_section.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.deviceWidth * 0.05,
        vertical: context.deviceHeight * 0.12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: StringManager.signIn,
            style: TextStyleManager.textStyle30w700
                .copyWith(color: context.theme.primaryColor),
          ),
          SizedBox(
            height: AppSpace.s48.h,
          ),
          const LoginFormSection(),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: TextButton(
              onPressed: () {},
              child: Text(
                StringManager.forgotPassword,
                style: TextStyleManager.textStyle15w700,
              ),
            ),
          ),
          SizedBox(
            height: AppSpace.s48.h,
          ),
          CustomElevatedButton(
            onPressed: () {
              if (AuthCubit.get(context).formKey.currentState!.validate()) {
                print(AuthCubit.get(context).formKey.currentState!.validate());
                context.push(PageName.kHomeLayoutView);
              }
            },
            child: CustomText(
              text: StringManager.signIn,
              style: TextStyleManager.textStyle15w500,
              color: ColorsManager.white,
            ),
          ),
          SizedBox(
            height: AppSpace.s48.h,
          ),
          Align(
            alignment: AlignmentDirectional.center,
            child: RichText(
                text: TextSpan(
                    text: StringManager.dontHaveAccount,
                    style: TextStyleManager.textStyle15w400.copyWith(
                      color: context.isDarkMode
                          ? ColorsManager.white
                          : ColorsManager.black,
                    ),
                    children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.push(PageName.kSignUpView);
                        },
                      text: StringManager.signUp,
                      style: TextStyleManager.textStyle15w700
                          .copyWith(color: context.theme.primaryColor))
                ])),
          )
        ],
      ),
    );
  }
}
