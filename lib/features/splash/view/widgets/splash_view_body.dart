import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rakna/core/helper/extensions.dart';
import 'package:rakna/core/theme/manager/colors_manager.dart';

import 'package:rakna/core/theme/manager/text_style_manager.dart';
import 'package:rakna/core/utils/animation_manager.dart';

import 'package:rakna/core/utils/string_manager.dart';

class SplashViewBody extends StatelessWidget {
  final Animation<double> animation;
  const SplashViewBody({
    super.key,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Lottie.asset(
          AnimationManager.car,
          repeat: true,
        ),
        FadeTransition(
          opacity: animation,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: "${StringManager.luxuryParking}\n",
                style: TextStyleManager.textStyle34w700.copyWith(
                  color: context.isDarkMode
                      ? ColorsManager.white
                      : ColorsManager.black,
                ),
                children: [
                  TextSpan(
                    text: StringManager.redefiendHere,
                    style: TextStyleManager.textStyle36w700.copyWith(
                      color: context.isDarkMode
                          ? ColorsManager.white
                          : ColorsManager.black,
                    ),
                  ),
                ]),
          ),
        ),
      ],
    );
  }
}
