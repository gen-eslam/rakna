
import 'package:flutter/material.dart';
import 'package:rakna/core/helper/extensions.dart';
import 'package:rakna/core/theme/manager/text_style_manager.dart';
import 'package:rakna/core/utils/string_manager.dart';
import 'package:rakna/core/widgets/custom_text_form_fieild.dart';

class SignUpFormSection extends StatelessWidget {
  const SignUpFormSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CustomTextFormFeild(
            text: StringManager.userName,
            prefixIcon: Icons.person_outline,
          ),
          customSizedBox(context),
          const CustomTextFormFeild(
            text: StringManager.email,
            prefixIcon: Icons.email_outlined,
          ),
          customSizedBox(context),
          const CustomTextFormFeild(
            text: StringManager.password,
            prefixIcon: Icons.lock_outline,
          ),
          customSizedBox(context),
          const CustomTextFormFeild(
            text: StringManager.confirmPassword,
            prefixIcon: Icons.lock_outline,
          ),
          customSizedBox(context),
          Text(
            StringManager.enterYourLicensePlate,
            style: TextStyleManager.textStyle15w700,
          ),
          customSizedBox(context),
          Row(
            children: [
              const Expanded(
                child: CustomTextFormFeild(
                  text: StringManager.plateNumbers,
                  prefixIcon: Icons.numbers_sharp,
                ),
              ),
              SizedBox(
                width: context.deviceWidth * 0.05,
              ),
              const Expanded(
                child: CustomTextFormFeild(
                  text: StringManager.plateCharacters,
                  prefixIcon: Icons.abc,
                ),
              ),
            ],
          ),
          customSizedBox(context),
        ],
      ),
    );
  }

  SizedBox customSizedBox(BuildContext context) {
    return SizedBox(
      height: context.deviceHeight * 0.025,
    );
  }
}
