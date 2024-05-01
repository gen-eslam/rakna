import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:rakna/core/helper/extensions.dart';
import 'package:rakna/core/theme/manager/colors_manager.dart';
import 'package:rakna/core/theme/manager/text_style_manager.dart';
import 'package:rakna/features/auth/logic/register_cubit/register_cubit.dart';

class CustomPinPut extends StatelessWidget {
  const CustomPinPut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 6,
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter valid code";
        }
        return null;
      },
      controller: RegisterCubit.get(context).pinController,
      followingPinTheme: PinTheme(
        width: context.deviceWidth * 0.15,
        height: context.deviceWidth * 0.15,
        textStyle: TextStyleManager.textStyle18w600,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: const Border(
            bottom: BorderSide(
              color: ColorsManager.bluishClr,
              width: 1,
            ),
            left: BorderSide(
              color: ColorsManager.bluishClr,
              width: 1,
            ),
            right: BorderSide(
              color: ColorsManager.bluishClr,
              width: 1,
            ),
            top: BorderSide(
              color: ColorsManager.bluishClr,
              width: 1,
            ),
          ),
        ),
      ),
      defaultPinTheme: PinTheme(
        width: context.deviceWidth * 0.15,
        height: context.deviceWidth * 0.15,
        textStyle: TextStyleManager.textStyle26w700,
        decoration: BoxDecoration(
          color: ColorsManager.bluishClr,
          borderRadius: BorderRadius.circular(15),
          border: const Border(
            bottom: BorderSide(
              color: ColorsManager.bluishClr,
              width: 1,
            ),
            left: BorderSide(
              color: ColorsManager.bluishClr,
              width: 1,
            ),
            right: BorderSide(
              color: ColorsManager.bluishClr,
              width: 1,
            ),
            top: BorderSide(
              color: ColorsManager.bluishClr,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
