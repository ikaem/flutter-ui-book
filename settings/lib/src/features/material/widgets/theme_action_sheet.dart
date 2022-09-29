import 'package:flutter/material.dart';
import 'package:settings/src/helpers/enums.dart';

class ThemeActionSheet extends StatelessWidget {
  const ThemeActionSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ListTile(
          title: const Text("System Theme"),
          onTap: () {
            Navigator.pop(context, AdaptiveThemeMode.system);
          },
        ),
        ListTile(
          title: const Text("Dark Theme"),
          onTap: () {
            Navigator.pop(context, AdaptiveThemeMode.dark);
          },
        ),
        ListTile(
          title: const Text("Light Theme"),
          onTap: () {
            Navigator.pop(context, AdaptiveThemeMode.light);
          },
        )
      ],
    );
  }
}
