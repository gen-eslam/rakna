import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rakna/core/helper/enums.dart';
import 'package:rakna/core/helper/extensions.dart';
import 'package:rakna/core/routing/page_name.dart';

import 'package:rakna/core/widgets/custom_snak_bar.dart';

import 'package:rakna/features/auth/logic/register_cubit/register_cubit.dart';

import 'package:rakna/features/auth/view/widgets/password_Screen.dart';
import 'package:rakna/features/auth/view/widgets/sign_up_details_screen.dart';
import 'package:rakna/features/otp/view/otp_screen.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  final List<Widget> screens = const [
    SignUpDetailsScreen(),
    PasswordScreen(),
    OtpScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(text: state.message, colorState: ColorState.sucess),
          );
        } else if (state is RegisterError) {
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(text: state.error, colorState: ColorState.failure),
          );
        } else if (state is EmailVerified) {
          ScaffoldMessenger.of(context).showSnackBar(
            customSnackBar(text: state.message, colorState: ColorState.sucess),
          );
          RegisterCubit.get(context).login(
              email: RegisterCubit.get(context).emailController.text,
              password: RegisterCubit.get(context).passwordController.text);
        }

        if (state is AuthSuccess) {
          context.go(PageName.kHomeLayoutView);
        }
      },
      child: Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.deviceWidth * 0.05,
              vertical: context.deviceHeight * 0.04,
            ),
            child: PageView.builder(
                itemCount: 3,
                controller: RegisterCubit.get(context).pageController,
                allowImplicitScrolling: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return screens[index];
                })),
      ),
    );
  }
}
