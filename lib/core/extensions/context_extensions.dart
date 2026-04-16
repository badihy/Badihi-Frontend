// utils/theme_extensions.dart
import 'package:badihi/core/extensions/app_mode_colors_extension.dart';
import 'package:flutter/material.dart';

extension ThemeColorsExtension on BuildContext {
  AppModeColorsExtension get appColors {
    return Theme.of(this).extension<AppModeColorsExtension>()!;
  }
}
