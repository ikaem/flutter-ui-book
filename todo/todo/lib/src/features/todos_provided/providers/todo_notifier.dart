import 'package:flutter/cupertino.dart';
import 'package:todo/src/controllers/todo_controller.dart';
import 'package:todo/src/controllers/todo_controller.dart';

class TodosNotifier extends InheritedNotifier<TodosController> {
  TodosNotifier({
    Key? key,
    TodosController? notifier,
    required Widget child,
  }) : super(key: key, notifier: notifier, child: child);

  static TodosController of(BuildContext context) {
    final TodosNotifier? result =
        context.dependOnInheritedWidgetOfExactType<TodosNotifier>();

// assert iu guess that result will not be null, otherw3sise show the message
// ok, htis will only work in debug mode
    assert(result != null, "No TodosNotifier found in context");
    assert(result!.notifier != null, "No TodosController found in context");

    return result!.notifier!;

    // return context
    //     .dependOnInheritedWidgetOfExactType<TodosNotifier>()!
    //     .notifier!;
  }
}
