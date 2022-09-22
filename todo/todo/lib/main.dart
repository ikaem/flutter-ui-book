import 'package:flutter/cupertino.dart';
import 'package:todo/src/features/todos_vanilla/todos_app_vanilla.dart';
import 'package:todo/src/controllers/todo_controller.dart';

main() {
  final todosController = TodosController();

  runApp(TodosApp(todosController: todosController));
}
