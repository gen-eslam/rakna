import 'package:flutter/material.dart';

// convert string to color
extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

extension GetThemeApp on BuildContext {
  ThemeData get theme => Theme.of(this);
}

extension SizeExtension on BuildContext {
  double get deviceHeight => MediaQuery.of(this).size.height;
  double get deviceWidth => MediaQuery.of(this).size.width;
}

extension DarkMode on BuildContext {
  bool get isDarkMode {
    return Theme.of(this).brightness == Brightness.dark;
  }
}

extension Validate on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}


// to convert from "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'" to 'MM/dd/yyyy hh:mm a'

// date = '2021-01-26T03:17:00.000000Z';
// DateTime parseDate =
//     new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
// var inputDate = DateTime.parse(parseDate.toString());
// var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
// var outputDate = outputFormat.format(inputDate);
// print(outputDate)