import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rakna/core/helper/extensions.dart';
import 'package:rakna/core/theme/manager/colors_manager.dart';
import 'package:rakna/core/theme/manager/text_style_manager.dart';
import 'package:rakna/core/utils/string_manager.dart';
import 'package:rakna/core/widgets/custom_elevated_button.dart';
import 'package:rakna/core/widgets/custom_text.dart';
import 'package:rakna/features/auth/logic/register_cubit/register_cubit.dart';
import 'package:rakna/features/auth/view/widgets/sign_up_form_section.dart';

class SignUpDetailsScreen extends StatelessWidget {
  const SignUpDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: context.deviceHeight * 0.10,
          ),
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
            onPressed: () {
              FocusScope.of(context).unfocus();
              if (RegisterCubit.get(context).formKey.currentState!.validate()) {
                RegisterCubit.get(context).pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOutCubic,
                    );
              }
              // RegisterCubit.get(context).pageController.nextPage(
              //       duration: const Duration(milliseconds: 500),
              //       curve: Curves.easeInOutCubic,
              //     );
            },
            child: CustomText(
              text: StringManager.setPassword,
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
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
