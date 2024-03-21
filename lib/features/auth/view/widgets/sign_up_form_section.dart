import 'package:flutter/material.dart';
import 'package:rakna/core/helper/extensions.dart';
import 'package:rakna/core/utils/string_manager.dart';
import 'package:rakna/core/widgets/custom_text_form_fieild.dart';
import 'package:rakna/features/auth/logic/register_cubit/register_cubit.dart';

class SignUpFormSection extends StatelessWidget {
  const SignUpFormSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: RegisterCubit.get(context).formKey,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormFeild(
              text: StringManager.fullName,
              keyboardType: TextInputType.name,
              prefixIcon: Icons.person_outline,
              controller: RegisterCubit.get(context).userNameController,
              validator: (value) {
                return value!.isEmpty ? 'Enter valid full name' : null;
              },
            ),
            customSizedBox(context),
            CustomTextFormFeild(
              text: StringManager.nationalId,
              keyboardType: TextInputType.phone,
              prefixIcon: Icons.person_outline,
              controller: RegisterCubit.get(context).nationalityController,
              validator: (value) {
                return value!.isEmpty ? 'Enter valid national id' : null;
              },
            ),
            customSizedBox(context),
            CustomTextFormFeild(
              text: StringManager.phoneNumber,
              keyboardType: TextInputType.phone,
              prefixIcon: Icons.person_outline,
              controller: RegisterCubit.get(context).phoneController,
              validator: (value) {
                return value!.isEmpty ? 'Enter valid phone number' : null;
              },
            ),
            customSizedBox(context),
            CustomTextFormFeild(
              text: StringManager.email,
              keyboardType: TextInputType.emailAddress,
              controller: RegisterCubit.get(context).emailController,
              prefixIcon: Icons.email_outlined,
              validator: (value) {
                return value!.isEmpty ? 'Enter valid email' : null;
              },
            ),
            customSizedBox(context),
          ],
        ),
      ),
    );
  }

  SizedBox customSizedBox(BuildContext context) {
    return SizedBox(
      height: context.deviceHeight * 0.025,
    );
  }
}
//"Passwords must be at least 6 characters. | Passwords must have at least one non alphanumeric character. | Passwords must have at least one digit (\u00270\u0027-\u00279\u0027). | Passwords must have at least one uppercase (\u0027A\u0027-\u0027Z\u0027)."
