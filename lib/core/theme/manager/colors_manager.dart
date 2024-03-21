import 'package:flutter/material.dart';
import 'package:rakna/core/helper/enums.dart';

abstract class ColorsManager {
  static const Color bluishClr = Color(0xFF375FFF);
  static const Color yellowClr = Color(0xFFFFB746);
  static const Color pinkClr = Color(0xFFff4667);
  static const Color redClr = Color(0xFFFE4A49);
  static const Color white = Color(0xffFFFFFF);
  static const Color black = Color.fromARGB(255, 4, 8, 8);
  static const Color darkBlue = Color(0xFF0F1828);
  static const Color darkGreyClr = Color(0xFF121212);
  static const Color darkHeaderClr = Color(0xFF424242);
  static const Color offWhite = Color(0xFFf5f5f5);
  static const Color green = Color(0xFF56BB61);
  static const Color darkGreen = Color(0xff04AF70);
  static const Color gray = Color(0xffC0C0C8);
  static const Color darkBlueShade = Color.fromARGB(207, 32, 51, 85);

  static Color colorState(ColorState colorState){
    switch(colorState){
      case ColorState.sucess:
        return green;
      case ColorState.failure:
        return redClr;
      case ColorState.warning:
        return yellowClr;
    }
  }
}
