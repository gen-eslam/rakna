import 'package:flutter/material.dart';
import 'package:rakna/core/theme/manager/text_style_manager.dart';
import 'package:rakna/core/widgets/custom_text.dart';

class GarageTitleAndDetails extends StatelessWidget {
  final String title, details;
  const GarageTitleAndDetails(
      {super.key, required this.title, required this.details});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: title,
          style: TextStyleManager.textStyle18w600,
          textOverflow: TextOverflow.ellipsis,
        ),
        CustomText(
          text: details,
          style: TextStyleManager.textStyle18w600,
          textOverflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
