import 'package:flutter/material.dart';
import 'package:settings/src/controllers/settings_controller.dart';
import 'package:settings/src/features/material/widgets/material_form_section.dart';
import 'package:settings/src/features/material/widgets/theme_action_sheet.dart';
import 'package:settings/src/helpers/constants.dart';
import 'package:settings/src/helpers/enums.dart';
import 'package:settings/src/providers/settings_provider.dart';

class SettingsForm extends StatelessWidget {
  const SettingsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SettingsProvider.of(context);

    final timeZoneFormSection = _buildTimeZoneFormSection(controller);
    final lookAndFeelFormSection =
        _buildLookAndFeelFormSection(controller, context);

    return ListView(
      children: <Widget>[
        timeZoneFormSection,
        lookAndFeelFormSection,
      ],
    );
  }

  Widget _buildTimeZoneFormSection(SettingsController controller) {
    return MaterialFormSection(
      header: const Text("TIme and place"),
      children: <Widget>[
        // this seems to be only info
        const ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text("Language"),
          subtitle: Text("English(US)"),
          dense: true,
        ),
        SwitchListTile(
          title: const Text("Set time zone automatically"),
          contentPadding: EdgeInsets.zero,
          value: controller.enableAutoTimeZone,
          onChanged: controller.updateEnableAutoTimeZone,
        ),
      ],
    );
  }

  Widget _buildLookAndFeelFormSection(
    SettingsController controller,
    BuildContext context,
  ) {
    return MaterialFormSection(
      header: const Text("Look and feel"),
      children: <Widget>[
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text("Theme"),
          subtitle: Text(themeDisplayTextMap[controller.themeMode] ?? ""),
          dense: true,
          onTap: () async {
            /* generic specifies what type of data comes back from pop */
            AdaptiveThemeMode? themeMode =
                await showModalBottomSheet<AdaptiveThemeMode>(
              context: context,
              builder: (builderContext) {
                return const ThemeActionSheet();
              },
            );

            if (themeMode != null) {
              controller.updateThemeMode(themeMode);
            }
          },
        )
      ],
    );
  }
}
