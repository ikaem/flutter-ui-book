import 'package:flutter/material.dart';
import 'package:settings/src/helpers/enums.dart';
import 'package:settings/src/services/settings_service.dart';

class SettingsController with ChangeNotifier {
  SettingsController(this._settingsService);

  final SettingsService _settingsService;

  late AdaptiveThemeMode _themeMode;

  AdaptiveThemeMode get themeMode => _themeMode;

  Future<void> loadSettings() async {
    _themeMode = await _settingsService.themeMode();

    notifyListeners();
  }

  Future<void> updateThemeMode(AdaptiveThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;

    _themeMode = newThemeMode;

    notifyListeners();

    // also need to save data via the service
    await _settingsService.updateThemeMode(newThemeMode);
  }
}
