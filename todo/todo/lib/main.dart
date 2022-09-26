import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:todo/src/features/todos_inherited%20copy/todos_app_inherited.dart';
import 'package:todo/src/features/todos_inherited/providers/todo_notifier.dart';
// import 'package:todo/src/features/todos_vanilla/todos_app_vanilla.dart';
import 'package:todo/src/controllers/todo_controller.dart';
// import 'package:todo/src/features/todos_inherited/todos_app_inherited.dart';

main() {
  final todosController = TodosController();

  // runApp(TodosApp(todosController: todosController));

  // runApp(const TodosApp());
  // runApp(
  //   TodosNotifier(
  //     notifier: todosController,
  //     child: const TodosApp(),
  //   ),
  // );

  // this is for provider
  // runApp(ChangeNotifierProvider.value(
  //   value: todosController,
  //   child: const TodosApp(),
  // ));

// this would recreate the controller on each widget tree changes - it would work rgreate if we have soem dependency inhection in the contoller
// note that here we are still using the same instance all the time
// but it would allow that - maybe check the rotue, and depending on the rotue, we dhnage soemthing?
  runApp(ChangeNotifierProvider(
    create: (context) => todosController,
    child: const TodosApp(),
  ));
}
