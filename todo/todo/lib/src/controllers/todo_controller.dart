import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:todo/src/models/todo.dart';

class TodosController with ChangeNotifier {
  TodosController();

  final List<Todo> _todos = [
    Todo(id: 1, task: "Mown it"),
  ];

  UnmodifiableListView<Todo> get todos => UnmodifiableListView(_todos);

  Future<void> createTodo(Todo todo) async {
    _todos.add(todo);
    notifyListeners();
  }

  Future<void> update(Todo todo) async {
    final todoIndex = _todos.indexWhere((element) => todo.id == element.id);

    _todos[todoIndex] = _todos[todoIndex].copyWith(
      complete: todo.complete,
      task: todo.task,
    );

    notifyListeners();
  }

  Future<void> deleteTodo(Todo todo) async {
    // it is crazy that this would actually work - i guess it will remove by reference
    // and i guess since we work with oop, we are always passing the same instance
    _todos.remove(todo);

    notifyListeners();
  }
}
