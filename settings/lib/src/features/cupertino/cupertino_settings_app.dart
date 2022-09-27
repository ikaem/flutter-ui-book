import 'package:flutter/cupertino.dart';
import 'package:settings/src/controllers/settings_controller.dart';
import 'package:settings/src/features/cupertino/screens/cupertino_settings_screen.dart';
import 'package:settings/src/helpers/enums.dart';
import 'package:settings/src/providers/settings_provider.dart';

class CupertinoSettingsApp extends StatelessWidget {
  const CupertinoSettingsApp({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsController settingsController = SettingsProvider.of(context);

    final brightness = settingsController.themeMode == AdaptiveThemeMode.dark
        ? Brightness.dark
        : Brightness.light;

    return CupertinoApp(
      theme: CupertinoThemeData(brightness: brightness),
      home: const CupertinoSettingsScreen(),
    );
  }
}
