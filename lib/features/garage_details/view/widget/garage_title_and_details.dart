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
      children: [
        Expanded(
          child: CustomText(
            textAlign: TextAlign.start,
            text: title,
            style: TextStyleManager.textStyle18w600,
            textOverflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          child: CustomText(
            text: details,
            textAlign: TextAlign.end,
            style: TextStyleManager.textStyle18w600,
            textOverflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
