import 'package:flutter/material.dart';
import 'package:rakna/core/helper/extensions.dart';
import 'package:rakna/core/utils/space_Manager.dart';

class CustomTextFormFeild extends StatelessWidget {
  final String text;
  final IconData prefixIcon;
  const CustomTextFormFeild({
    super.key,
    required this.text,
    required this.prefixIcon,
  });
  OutlineInputBorder border(BuildContext context) => OutlineInputBorder(
      borderSide: BorderSide(color: context.theme.primaryColor, width: 2),
      gapPadding: AppPadding.p24,
      borderRadius: BorderRadius.circular(AppPadding.p16));
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: text,
        labelText: text,
        prefixIcon: Icon(prefixIcon),
        border: border(context),
        enabledBorder: border(context),
        focusedBorder: border(context),
        errorBorder: border(context),
        focusedErrorBorder: border(context),
      ),
    );
  }
}
