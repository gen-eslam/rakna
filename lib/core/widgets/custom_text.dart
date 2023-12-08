import 'package:flutter/material.dart';
import 'package:rakna/core/helper/extensions.dart';

class CustomText extends StatelessWidget {
  final TextStyle style;
  final Color? color;
  final String text;
  const CustomText(
      {super.key, required this.text, this.color, required this.style});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
        
      style: TextStyle(color: context.isDarkMode ? Colors.white : Colors.black,

      ),
      child: Text(
        text,
        style: style.copyWith(
          color: color,
        ),
      ),
    );
  }
}
