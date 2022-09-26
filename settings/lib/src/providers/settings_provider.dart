import 'package:flutter/cupertino.dart';

class SettingsProvider extends InheritedNotifier<SettingsController> {
  const SettingsProvider({
    Key? key,
    SettingsController? notifier,
    required Widget child,
  }) : super(key: key, notifier: notifier, child: child);

  static SettingsController of(BuildContext context) {
    final SettingsProvider? result =
        context.dependOnInheritedWidgetOfExactType<SettingsController>();

    assert(result != null, "No Settings Provider found in context");
    assert(result!.notifier != null, "No Settings Controller found in context");

    return result!.notifier!;
  }
}
