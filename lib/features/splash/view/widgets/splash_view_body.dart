import 'package:flutter/material.dart';
import 'package:rakna/core/helper/extensions.dart';
import 'package:rakna/core/theme/manager/text_style_manager.dart';
import 'package:rakna/core/utils/images_manager.dart';
import 'package:rakna/core/utils/string_manager.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          ImagesManager.splash,
          width: context.deviceWidth,
          fit: BoxFit.fill,
          height: context.deviceHeight * 0.75,
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: "${StringManager.luxuryParking}\n",
              style: TextStyleManager.textStyle34w700,
              children: [
                TextSpan(
                    text: StringManager.redefiendHere,
                    style: TextStyleManager.textStyle36w700),
              ]),
        ),
      ],
    );
  }
}
