import 'package:flutter/material.dart';
import 'package:foodly/constants/constants.dart';

class AppTheme {
  static final light = ThemeData(
    scaffoldBackgroundColor: kOffWhite,
    iconTheme: const IconThemeData(color: kDark),
    primaryColor: Colors.grey,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: Colors.grey,
      secondary: Colors.grey.shade600,
    ),
  );

  static final dark = ThemeData(
    scaffoldBackgroundColor: kDark,
    iconTheme: const IconThemeData(color: kOffWhite),
    primaryColor: Colors.grey.shade700,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: Colors.grey.shade700,
      secondary: Colors.grey.shade600,
    ),
  );
}
