import 'package:flutter/material.dart';

class SettingsController with ChangeNotifier {
  SettingsController(this.settingsService);

  final SettingsService _settingsService;

  late ThemeMode _themeMode;

  ThemeMode get themeMode => _themeMode;

  Future<void>;
}
