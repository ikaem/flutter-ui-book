import 'package:flutter/material.dart';

class CollapsibleState extends InheritedWidget {
  final ValueNotifier<bool> state;

  const CollapsibleState({
    Key? key,
    required this.state,
    required Widget child,
  }) : super(key: key, child: child);

  static CollapsibleState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CollapsibleState>()!;
  }

  @override
  bool updateShouldNotify(CollapsibleState oldWidget) =>
      state != oldWidget.state;
}
