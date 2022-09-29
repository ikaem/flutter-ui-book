import 'package:flutter/material.dart';
import 'package:settings/src/helpers/enums.dart';

extension ThemeModeExtension on AdaptiveThemeMode {
  ThemeMode get materialThemeMode {
    switch (this) {
      case AdaptiveThemeMode.dark:
        return ThemeMode.dark;
      case AdaptiveThemeMode.light:
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }
}
