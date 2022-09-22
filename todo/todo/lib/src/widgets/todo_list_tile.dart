import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo/src/models/todo.dart';

class TodoListTile extends StatelessWidget {
  const TodoListTile({
    super.key,
    required this.todo,
    required this.onToggleComplete,
    required this.onDelete,
  });

  final Todo todo;
  final void Function(bool?) onToggleComplete;
  // onDelete will come in with an already passed todo
  final void Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: todo.complete,
      // aha, we can position the cotnrol - the checknbox
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: onToggleComplete,
      title: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(todo.task),
          IconButton(
            onPressed: onDelete,
            icon: Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
