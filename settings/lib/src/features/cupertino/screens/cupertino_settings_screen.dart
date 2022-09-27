import 'package:flutter/cupertino.dart';
import 'package:settings/src/features/cupertino/widgets/settings_form.dart';

class CupertinoSettingsScreen extends StatelessWidget {
  const CupertinoSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Settings"),
        ),
        child: SafeArea(
          child: SettingsForm(),
        ));
  }
}
