import 'package:fancy_password_field/fancy_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rakna/core/helper/enums.dart';
import 'package:rakna/core/helper/extensions.dart';
import 'package:rakna/core/routing/page_name.dart';
import 'package:rakna/core/theme/manager/colors_manager.dart';
import 'package:rakna/core/theme/manager/text_style_manager.dart';
import 'package:rakna/core/utils/string_manager.dart';
import 'package:rakna/core/widgets/custom_elevated_button.dart';
import 'package:rakna/core/widgets/custom_snak_bar.dart';
import 'package:rakna/core/widgets/custom_text.dart';
import 'package:rakna/core/widgets/password_text_form_feild.dart';
import 'package:rakna/features/auth/logic/register_cubit/register_cubit.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: RegisterCubit.get(context).formPasswordKey,
        child: BlocListener<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              RegisterCubit.get(context).pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOutCubic,
                  );
            }
            if (state is RegisterError) {
              ScaffoldMessenger.of(context).showSnackBar(
                customSnackBar(
                  text: state.error,
                  colorState: ColorState.failure,
                ),
              );
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: context.deviceHeight * 0.10,
              ),
              CustomText(
                text: StringManager.setPassword,
                textAlign: TextAlign.start,
                style: TextStyleManager.textStyle30w700.copyWith(
                  color: context.theme.primaryColor,
                ),
              ),
              SizedBox(
                height: context.deviceHeight * 0.05,
              ),
              PasswordTextFormFeild(
                text: StringManager.password,
                keyboardType: TextInputType.visiblePassword,
                passwordController:
                    RegisterCubit.get(context).fancyPasswordController,
                textController: RegisterCubit.get(context).passwordController,
                validationRules: {
                  DigitValidationRule(),
                  UppercaseValidationRule(),
                  LowercaseValidationRule(),
                  SpecialCharacterValidationRule(),
                  MinCharactersValidationRule(6),
                },
              ),
              SizedBox(
                height: context.deviceHeight * 0.05,
              ),
              PasswordTextFormFeild(
                text: StringManager.confirmPassword,
                keyboardType: TextInputType.visiblePassword,
                passwordController:
                    RegisterCubit.get(context).fancyPasswordConfirmController,
                textController:
                    RegisterCubit.get(context).passwordConfirmController,
                hasStrengthIndicator: false,
                validationRules: const {},
                validator: (value) {
                  return RegisterCubit.get(context)
                              .passwordConfirmController
                              .value !=
                          RegisterCubit.get(context).passwordController.value
                      ? 'Password does not match'
                      : value!.isEmpty
                          ? 'Enter valid password'
                          : null;
                },
              ),
              SizedBox(
                height: context.deviceHeight * 0.10,
              ),
              BlocBuilder<RegisterCubit, RegisterState>(
                builder: (context, state) {
                  return CustomElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      if (RegisterCubit.get(context)
                          .formPasswordKey
                          .currentState!
                          .validate()) {
                        RegisterCubit.get(context).register();
                      }
                    },
                    child: CustomText(
                      text: StringManager.signUp,
                      style: TextStyleManager.textStyle15w500,
                      color: ColorsManager.white,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
