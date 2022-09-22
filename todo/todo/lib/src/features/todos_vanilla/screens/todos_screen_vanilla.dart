import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo/src/controllers/todo_controller.dart';
import 'package:todo/src/models/todo.dart';
import 'package:todo/src/widgets/index.dart';
import 'package:todo/src/widgets/todo_list_tile.dart';

class TodosScreenVanilla extends StatelessWidget {
  const TodosScreenVanilla({
    super.key,
    required this.todosController,
  });

  final TodosController todosController;

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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: TodoInputField(onSubmitted: (value) {
                  final newTodo = Todo(
                    id: todosController.todos.length + 1,
                    task: value,
                  );
                }),
              ),
              AnimatedBuilder(
                // animation just has to be something listenable
                animation: todosController,
                // note that child is not defined by us before hand, becuase list view builder cannot really be defined?
                builder: (BuildContext context, Widget? child) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: todosController.todos.length,
                    itemBuilder: (context, index) {
                      final todo = todosController.todos[index];
                      // return Container();
                      return TodoListTile(
                        todo: todo,
                        onToggleComplete: (bool? value) {
                          final newTodo = todo.copyWith(complete: value);
                          todosController.update(todo);
                        },
                        onDelete: () {
                          todosController.deleteTodo(todo);
                        },
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
