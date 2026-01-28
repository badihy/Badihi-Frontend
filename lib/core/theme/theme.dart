import 'package:badihy/core/theme/app_tokens.dart';
import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  fontFamily: "WathiqThuluth",
  scaffoldBackgroundColor: Colors.white,
  brightness: Brightness.light,
  extensions: <ThemeExtension<dynamic>>[
    appLightColors,
  ],
);

ThemeData darkMode = ThemeData(
  fontFamily: "WathiqThuluth",
  scaffoldBackgroundColor: Color(0xFF12151B),
  brightness: Brightness.dark,
  extensions: <ThemeExtension<dynamic>>[
    appDarkColors,
  ],
);
