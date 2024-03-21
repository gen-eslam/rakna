import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/core/utils/space_Manager.dart';
import 'package:rakna/core/utils/string_manager.dart';
import 'package:rakna/core/widgets/custom_text_form_fieild.dart';
import 'package:rakna/core/widgets/password_text_form_feild.dart';
import 'package:rakna/features/auth/logic/login_cubit/login_cubit.dart';

class LoginFormSection extends StatelessWidget {
  const LoginFormSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: LogInCubit.get(context).formKey,
      child: Column(
        children: [
          CustomTextFormFeild(
            controller: LogInCubit.get(context).emailController,
            keyboardType: TextInputType.emailAddress,
            text: StringManager.email,
            prefixIcon: Icons.email_outlined,
            validator: (value) {
              return value!.isEmpty ? 'Enter valid email' : null;
            },
          ),
          SizedBox(
            height: AppSpace.s32.h,
          ),
          PasswordTextFormFeild(
            text: StringManager.password,
            hasStrengthIndicator: false,
            textController: LogInCubit.get(context).passwordController,
            prefixIcon: Icons.lock_outline,
            validator: (value) {
              return value!.isEmpty ? 'Enter valid password' : null;
            },
          ),
          // CustomTextFormFeild(
          //   controller: LogInCubit.get(context).passwordController,
          //   keyboardType: TextInputType.visiblePassword,
          //   text: StringManager.password,
          //   prefixIcon: Icons.lock_outline,
          //   validator: (value) {
          //     return value!.isEmpty ? 'Enter valid password' : null;
          //   },
          // ),
          SizedBox(
            height: AppSpace.s16.h,
          ),
        ],
      ),
    );
  }
}
