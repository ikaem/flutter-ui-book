import 'package:flutter/material.dart';
import 'package:settings/src/controllers/settings_controller.dart';
import 'package:settings/src/features/material/screens/material_settings_screen.dart';
import 'package:settings/src/features/material/utils/extensions/theme_mode_extension.dart';
import 'package:settings/src/providers/settings_provider.dart';

class MaterialSettingsApp extends StatelessWidget {
  const MaterialSettingsApp({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsController settingsController = SettingsProvider.of(context);

    return MaterialApp(
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: settingsController.themeMode.materialThemeMode,
      home: const MaterialSettingsScreen(),
    );
  }
}
