import 'package:flutter/cupertino.dart';
import 'package:settings/src/controllers/settings_controller.dart';
import 'package:settings/src/features/cupertino/widgets/theme_action_sheet.dart';
import 'package:settings/src/helpers/enums.dart';
import 'package:settings/src/providers/settings_provider.dart';

class SettingsForm extends StatelessWidget {
  const SettingsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsController settingsController = SettingsProvider.of(context);
    final theme = CupertinoTheme.of(context);

    final timeAndPlaceFormSection = _buildTimeAndPlaceFormSection(theme);
    final lookAndFeelFormSection =
        _buildLookAndFeelFormSection(context, settingsController, theme);

    return ListView(
      children: <Widget>[
        timeAndPlaceFormSection,
        lookAndFeelFormSection,
// note that this form section is literally that - a form section - this time form time and place
      ],
    );
  }

  Widget _buildTimeAndPlaceFormSection(
    CupertinoThemeData theme,
  ) {
    return CupertinoFormSection(
      header: const Text("Time and place"),
      children: <Widget>[
        CupertinoFormRow(
          prefix: const Text("Language"),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "English (US)",
                style: theme.textTheme.textStyle.copyWith(
                  color: theme.textTheme.textStyle.color!.withOpacity(0.5),
                ),
              ),
              const Icon(CupertinoIcons.chevron_right),
            ],
          ),
        ),
        CupertinoFormRow(
          prefix: const Text("Set time and zone automically"),
          child: CupertinoSwitch(
            value: true,
            onChanged: (value) {},
          ),
        )
      ],
    );
  }

  Widget _buildLookAndFeelFormSection(
    BuildContext context,
    SettingsController settingsController,
    CupertinoThemeData theme,
  ) {
    return CupertinoFormSection(
      header: const Text("Look and feel"),
      children: <Widget>[
        GestureDetector(
          onTap: () async {
            // with this generuic, we also specify what type of data we get
            // with opamnl, or nulalble, we allow for option to go back
            final themeMode = await showCupertinoModalPopup<AdaptiveThemeMode?>(
              context: context,
              builder: (context) {
                return const ThemeActionSheet();
                // return const Center(
                //   child: Text("this is modal"),
                // );
              },
            );

// this could go in some outer function
            if (themeMode != null) {
              settingsController.updateThemeMode(themeMode);
            }
          },
          child: CupertinoFormRow(
            prefix: const Text("Theme"),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  settingsController.themeMode.name.toUpperCase(),
                  style: theme.textTheme.textStyle.copyWith(
                      color: theme.textTheme.textStyle.color!.withOpacity(0.5)),
                ),
                const Icon(
                  CupertinoIcons.chevron_right,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
