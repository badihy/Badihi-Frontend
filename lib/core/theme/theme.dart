import 'package:badihi/core/theme/app_tokens.dart';
import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  fontFamily: "TheYearofHandicrafts",
  scaffoldBackgroundColor: Colors.white,
  brightness: Brightness.light,
  extensions: <ThemeExtension<dynamic>>[
    appLightColors,
  ],
);

ThemeData darkMode = ThemeData(
  fontFamily: "TheYearofHandicrafts",
  scaffoldBackgroundColor: Color(0xFF12151B),
  brightness: Brightness.dark,
  extensions: <ThemeExtension<dynamic>>[
    appDarkColors,
  ],
);
