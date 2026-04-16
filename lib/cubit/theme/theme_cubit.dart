import 'package:badihi/core/cache/cache_helper.dart';
import 'package:badihi/core/cache/cache_helper_keys.dart';
import 'package:badihi/core/services/service_locator.dart';
import 'package:badihi/cubit/theme/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ThemeModeState { light, dark, system }

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitialState()) {
    _loadTheme();
  }

  static ThemeCubit get(context) => BlocProvider.of(context);

  ThemeModeState currentTheme = ThemeModeState.system;

  Future<void> selectTheme(ThemeModeState theme) async {
    currentTheme = theme;

    await getIt<CacheHelper>().setString(CacheHelperKey.themeMode, currentTheme.name);

    emit(ThemeChangedState());
  }

  ThemeMode getTheme() {
    switch (currentTheme) {
      case ThemeModeState.light:
        return ThemeMode.light;
      case ThemeModeState.dark:
        return ThemeMode.dark;
      case ThemeModeState.system:
        return ThemeMode.system;
    }
  }

  Future<void> _loadTheme() async {
    String? savedTheme = await getIt<CacheHelper>().getString(
      CacheHelperKey.themeMode,
    );

    if (savedTheme != null) {
      currentTheme = ThemeModeState.values.firstWhere(
        (element) => element.name == savedTheme,
        orElse: () => ThemeModeState.system,
      );
    }
    emit(ThemeChangedState());
  }

  bool isDarkMode(BuildContext context) {
    if (currentTheme == ThemeModeState.dark) {
      return true;
    }

    if (currentTheme == ThemeModeState.system) {
      final brightness = MediaQuery.of(context).platformBrightness;
      return brightness == Brightness.dark;
    }

    return false;
  }

  Future<void> toggleTheme() async {
    if (currentTheme == ThemeModeState.light) {
      await selectTheme(ThemeModeState.dark);
    } else {
      await selectTheme(ThemeModeState.light);
    }
  }
}
