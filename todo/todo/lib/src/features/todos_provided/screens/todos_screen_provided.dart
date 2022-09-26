import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:todo/src/controllers/todo_controller.dart';
import 'package:todo/src/features/todos_inherited/providers/todo_notifier.dart';
import 'package:todo/src/models/todo.dart';
import 'package:todo/src/widgets/index.dart';
import 'package:todo/src/widgets/todo_list_tile.dart';

class TodosScreenProvided extends StatelessWidget {
  const TodosScreenProvided({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TodosController todosController = context.read();

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
                  // final controller = TodosNotifier.of(context);
                  final todos = context.select((TodosController c) => c.todos);

                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 24),
                        child: TodoInputField(
                          onSubmitted: (value) {
                            todosController.createTodo(
                              Todo(
                                id: todos.length,
                                task: value,
                              ),
                            );
                          },
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: todos.length,
                        itemBuilder: (context, index) {
                          final todo = todosController.todos[index];
                          return TodoListTile(
                            todo: todo,
                            onToggleComplete: (bool? value) {
                              todosController.update(
                                todo.copyWith(complete: value),
                              );
                            },
                            onDelete: () {
                              todosController.deleteTodo(todo);
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
