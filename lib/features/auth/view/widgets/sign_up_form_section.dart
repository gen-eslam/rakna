import 'package:flutter/material.dart';
import 'package:rakna/core/helper/extensions.dart';
import 'package:rakna/core/theme/manager/text_style_manager.dart';
import 'package:rakna/core/utils/string_manager.dart';
import 'package:rakna/core/widgets/custom_text_form_fieild.dart';
import 'package:rakna/features/auth/data/model/Auth_model.dart';
import 'package:rakna/features/auth/logic/auth_cubit/auth_cubit.dart';

class SignUpFormSection extends StatelessWidget {
  const SignUpFormSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: AuthCubit.get(context).formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormFeild(
            text: StringManager.userName,
            keyboardType: TextInputType.name,
            prefixIcon: Icons.person_outline,
            controller: AuthCubit.get(context).userNameController,
            validator: (value) {
              return value!.isEmpty ? 'Enter valid username' : null;
            },
          ),
          customSizedBox(context),
          CustomTextFormFeild(
            text: StringManager.nationalId,
            keyboardType: TextInputType.phone,
            prefixIcon: Icons.person_outline,
            controller: AuthCubit.get(context).nationalityController,
            validator: (value) {
              return value!.isEmpty ? 'Enter valid national id' : null;
            },
          ),
          customSizedBox(context),

          CustomTextFormFeild(
            text: StringManager.phoneNumber,
            keyboardType: TextInputType.phone,
            prefixIcon: Icons.person_outline,
            controller: AuthCubit.get(context).phoneController,
            validator: (value) {
              return value!.isEmpty ? 'Enter valid phone number' : null;
            },
          ),
          customSizedBox(context),
          CustomTextFormFeild(
            text: StringManager.email,
            keyboardType: TextInputType.emailAddress,
            controller: AuthCubit.get(context).emailController,
            prefixIcon: Icons.email_outlined,
            validator: (value) {
              return value!.isEmpty ? 'Enter valid email' : null;
            },
          ),

          customSizedBox(context),

          CustomTextFormFeild(
            text: StringManager.password,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            prefixIcon: Icons.lock_outline,
            controller: AuthCubit.get(context).passwordController,
            validator: (value) {
              return value!.isEmpty ? 'Enter valid password' : null;
            },
          ),
          customSizedBox(context),
          CustomTextFormFeild(
            text: StringManager.confirmPassword,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            prefixIcon: Icons.lock_outline,
            controller: AuthCubit.get(context).passwordConfirmController,
            validator: (value) {
              return value!.isEmpty ? 'Enter valid password' : null;
            },
          ),
          // customSizedBox(context),
          // Text(
          //   StringManager.enterYourLicensePlate,
          //   style: TextStyleManager.textStyle15w700,
          // ),
          // Row(
          //   children: [
          //     const Expanded(
          //       child: CustomTextFormFeild(
          //         text: StringManager.plateNumbers,
          //         prefixIcon: Icons.numbers_sharp,
          //       ),
          //     ),
          //     SizedBox(
          //       width: context.deviceWidth * 0.05,
          //     ),
          //     const Expanded(
          //       child: CustomTextFormFeild(
          //         text: StringManager.plateCharacters,
          //         prefixIcon: Icons.abc,
          //       ),
          //     ),
          //   ],
          // ),
          // customSizedBox(context),
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
