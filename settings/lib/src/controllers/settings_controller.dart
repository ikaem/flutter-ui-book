import 'package:flutter/material.dart';
import 'package:settings/src/helpers/enums.dart';
import 'package:settings/src/services/settings_service.dart';

class SettingsController with ChangeNotifier {
  SettingsController(this._settingsService);

  final SettingsService _settingsService;

  late AdaptiveThemeMode _themeMode;
  bool enableAutoTimeZone = false;
  bool enableTwoFactorAuth = false;
  bool enablePasscode = false;
  bool enableSounds = false;
  bool enableHapticFeedback = false;
  bool enableSendFeedback = false;

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

  Future<void> updateEnableAutoTimeZone(bool updated) async {
    enableAutoTimeZone = updated;
    notifyListeners();
  }

  Future<void> updateEnableTwoFactorAuth(bool updated) async {
    enableTwoFactorAuth = updated;
    notifyListeners();
  }

  Future<void> updateEnablePasscode(bool updated) async {
    enablePasscode = updated;
    notifyListeners();
  }

  Future<void> updateEnableSounds(bool updated) async {
    enableSounds = updated;
    notifyListeners();
  }

  Future<void> updateEnableHapticFeedback(bool updated) async {
    enableHapticFeedback = updated;
    notifyListeners();
  }

  Future<void> updateEnableSendFeedback(bool updated) async {
    enableSendFeedback = updated;
    notifyListeners();
  }
}
