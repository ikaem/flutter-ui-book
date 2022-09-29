import 'package:flutter/material.dart';
import 'package:settings/src/features/material/widgets/settings_form.dart';

class MaterialSettingsScreen extends StatelessWidget {
  const MaterialSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: const SettingsForm(),
    );
  }
}
