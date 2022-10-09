import 'package:counter/counter_app/models/counter.dart';
import 'package:flutter/cupertino.dart';

class CounterState extends InheritedWidget {
  final Counter model;

  const CounterState({
    Key? key,
    required Widget child,
    required this.model,
  }) : super(key: key, child: child);

  static CounterState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterState>()!;
  }

  @override
  bool updateShouldNotify(covariant CounterState oldWidget) {
    // if (model.counter != oldWidget.model.counter) return true;
    // if (model.history.length != oldWidget.model.history.length) return true;

    return false;
  }
}
