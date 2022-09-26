import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo/src/controllers/todo_controller.dart';
import 'package:todo/src/features/todos_inherited/providers/todo_notifier.dart';
import 'package:todo/src/models/todo.dart';
import 'package:todo/src/widgets/index.dart';
import 'package:todo/src/widgets/todo_list_tile.dart';

class TodosScreenInherited extends StatelessWidget {
  const TodosScreenInherited({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Some title to be translated later"),
        centerTitle: true,
      ),
      body: Container(
        // this is cool - i never pay attention to these props
        alignment: Alignment.topCenter,
        margin: EdgeInsets.symmetric(vertical: 30.0),
        // oh, so this imposes constraints on its own child
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 550.0),
          child: Column(
            children: <Widget>[
              Builder(
                builder: (context) {
                  final controller = TodosNotifier.of(context);

                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 24),
                        child: TodoInputField(
                          onSubmitted: (value) {
                            controller.createTodo(
                              Todo(
                                id: controller.todos.length,
                                task: value,
                              ),
                            );
                          },
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.todos.length,
                        itemBuilder: (context, index) {
                          final todo = controller.todos[index];
                          return TodoListTile(
                            todo: todo,
                            onToggleComplete: (bool? value) {
                              controller.update(
                                todo.copyWith(complete: value),
                              );
                            },
                            onDelete: () {
                              controller.deleteTodo(todo);
                            },
                          );
                        },
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
