import 'package:fancy_password_field/fancy_password_field.dart';
import 'package:flutter/material.dart';
import 'package:rakna/core/helper/extensions.dart';
import 'package:rakna/core/theme/manager/colors_manager.dart';
import 'package:rakna/core/theme/manager/text_style_manager.dart';
import 'package:rakna/core/utils/space_Manager.dart';
import 'package:rakna/core/widgets/custom_text.dart';

class PasswordTextFormFeild extends StatelessWidget {
  const PasswordTextFormFeild(
      {super.key,
      required this.text,
      this.prefixIcon,
      this.textController,
      this.keyboardType,
      this.passwordController,
      this.validationRules = const {},
      this.suffixIcon,
      this.hasStrengthIndicator = true,
      this.validator});

  final String text;
  final IconData? prefixIcon;
  final bool hasStrengthIndicator;
  final TextInputType? keyboardType;
  final TextEditingController? textController;
  final FancyPasswordController? passwordController;
  final Widget? suffixIcon;
  final Set<ValidationRule> validationRules;
  final String? Function(String?)? validator;

  OutlineInputBorder border(BuildContext context) => OutlineInputBorder(
        borderSide: BorderSide(
          color: context.theme.primaryColor,
          width: 2,
        ),
        gapPadding: AppPadding.p24,
        borderRadius: BorderRadius.circular(
          AppPadding.p16,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return FancyPasswordField(
      keyboardType: keyboardType,
      passwordController: passwordController,
      controller: textController,
      validator: validator,
      hasStrengthIndicator: hasStrengthIndicator,
      decoration: InputDecoration(
        hintText: text,
        labelText: text,
        alignLabelWithHint: true,
        floatingLabelStyle: TextStyle(
          color: context.isDarkMode ? ColorsManager.white : ColorsManager.black,
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: context.theme.primaryColor,
        ),
        suffixIcon: suffixIcon,
        border: border(context),
        enabledBorder: border(context),
        focusedBorder: border(context),
        errorBorder: border(context),
        focusedErrorBorder: border(context),
      ),
      validationRules: validationRules,
      validationRuleBuilder: (validationRules, value) {
        if (value.isEmpty) {
          return const SizedBox.shrink();
        }
        return Wrap(
          children: List.generate(
            validationRules.length,
            (index) => Card(
              color: context.isDarkMode
                  ? ColorsManager.darkBlue
                  : ColorsManager.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorsManager.bluishClr)),
                padding: EdgeInsets.all(AppPadding.p8),
                child: CustomText(
                  style: TextStyleManager.textStyle14w600,
                  color: validationRules.elementAt(index).validate(value)
                      ? ColorsManager.green
                      : null,
                  text: validationRules.elementAt(index).name,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
