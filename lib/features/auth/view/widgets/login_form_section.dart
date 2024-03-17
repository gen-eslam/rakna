import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rakna/core/utils/space_Manager.dart';
import 'package:rakna/core/utils/string_manager.dart';
import 'package:rakna/core/widgets/custom_text_form_fieild.dart';

class LoginFormSection extends StatelessWidget {
  const LoginFormSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const CustomTextFormFeild(
            text: StringManager.email,
            prefixIcon: Icons.email_outlined,
          ),
          SizedBox(
            height: AppSpace.s32.h,
          ),
          const CustomTextFormFeild(
            text: StringManager.password,
            prefixIcon: Icons.lock_outline,
          ),
          SizedBox(
            height: AppSpace.s16.h,
          ),
        ],
      ),
    );
  }
}
