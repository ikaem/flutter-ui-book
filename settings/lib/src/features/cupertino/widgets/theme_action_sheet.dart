import 'package:flutter/cupertino.dart';
import 'package:settings/src/helpers/enums.dart';

class ThemeActionSheet extends StatelessWidget {
  const ThemeActionSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: const Text("Choose app theme"),
      cancelButton: CupertinoActionSheetAction(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text("Cancel"),
      ),
      actions: <Widget>[
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context, AdaptiveThemeMode.light);
          },
          child: const Text("Light theme"),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context, AdaptiveThemeMode.dark);
          },
          child: const Text("Dark theme"),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context, AdaptiveThemeMode.system);
          },
          child: const Text("System theme"),
        )
      ],
    );
  }
}
