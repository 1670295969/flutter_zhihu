import 'package:flutter/material.dart';

class ThemeColor {
  static bool isNight = true;

  static ThemeData theme() {
    return isNight ? ThemeData.dark() : ThemeData.light();
  }

  static Color themeColor() {
    return isNight ? Colors.black : Colors.blueAccent;
  }

  static Color textColor() {
    return isNight ? Colors.white : Colors.black;
  }

  static Color appBarColor() {
    return isNight ? Colors.black : Colors.blueAccent;
  }
}
