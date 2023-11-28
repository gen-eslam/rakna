import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rakna/core/theme/manager/colors_manager.dart';
import 'package:rakna/core/theme/manager/text_style_manager.dart';

abstract class ThemeApp {
  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: ColorsManager.offWite,
    brightness: Brightness.light,
    fontFamily: GoogleFonts.aBeeZee().fontFamily,
    textTheme: GoogleFonts.aBeeZeeTextTheme(ThemeData.light().textTheme),

    // app bar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
          fontSize: 16.sp,
          fontStyle: FontStyle.italic,
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        )),
        backgroundColor: ColorsManager.darkGreen),

    // bottom nav bar theme
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: ColorsManager.offWite,
      selectedItemColor: ColorsManager.darkGreen,
      showUnselectedLabels: false,
      unselectedItemColor: ColorsManager.green,
      type: BottomNavigationBarType.fixed,
    ),
    indicatorColor: ColorsManager.green,

    iconTheme: const IconThemeData(color: ColorsManager.green),
  );
  //dark theme
  static ThemeData dark = ThemeData(
    scaffoldBackgroundColor: ColorsManager.darkBlue,
    primaryColor: ColorsManager.bluishClr,
    brightness: Brightness.dark,
    textTheme: GoogleFonts.aBeeZeeTextTheme(ThemeData.dark().textTheme),

    // app bar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
          fontSize: 16.sp,
          fontStyle: FontStyle.italic,
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        )),
        backgroundColor: ColorsManager.darkBlue),

    // bottom nav bar theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: ColorsManager.darkBlue,
      selectedItemColor: ColorsManager.bluishClr,
      showUnselectedLabels: false,
      unselectedItemColor: ColorsManager.bluishClr.withOpacity(0.7),
      type: BottomNavigationBarType.fixed,
    ),
    indicatorColor: ColorsManager.bluishClr,

    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      overlayColor: MaterialStateColor.resolveWith(
          (states) => ColorsManager.white.withOpacity(0.3)),
      foregroundColor:
          MaterialStateColor.resolveWith((states) => ColorsManager.white),
    )),

    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: const BorderSide(color: ColorsManager.bluishClr)),
        prefixIconColor: ColorsManager.white,
        suffixIconColor: ColorsManager.white),
    iconTheme: const IconThemeData(color: ColorsManager.white),
  );
}
