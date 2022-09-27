import 'package:flutter/cupertino.dart';
import 'package:settings/src/app.dart';
import 'package:settings/src/controllers/settings_controller.dart';
import 'package:settings/src/providers/settings_provider.dart';
import 'package:settings/src/services/settings_service.dart';

void main() async {
  final SettingsController settingsController =
      SettingsController(SettingsService());

  await settingsController.loadSettings();

  runApp(SettingsProvider(
    notifier: settingsController,
    child: const App(),
  ));
}
