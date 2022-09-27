import 'package:settings/src/helpers/enums.dart';

class SettingsService {
  // Future<ThemeMode> themeMode() async => ThemeMode.system;
  Future<AdaptiveThemeMode> themeMode() async => AdaptiveThemeMode.system;

  // Future<void> updateThemeMode(ThemeMode theme) async {
  Future<void> updateThemeMode(AdaptiveThemeMode theme) async {
    // do something
  }
}
