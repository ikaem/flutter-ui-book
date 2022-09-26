import 'package:flutter/material.dart';
import 'package:todo/src/controllers/todo_controller.dart';
import 'package:todo/src/features/todos_inherited/screens/todos_screen_inherited.dart';
import 'package:todo/src/routing/exceptions.dart';
import 'package:todo/src/routing/routes.dart';
import 'package:todo/src/features/todos_vanilla/screens/todos_screen_vanilla.dart';

class AppRouter {
  static Route<dynamic>? Function(RouteSettings) onGenerateRouteVanilla(
          TodosController controller) =>
      (RouteSettings settings) {
        switch (settings.name) {
          case Routes.todos:
            {
              return MaterialPageRoute(
                  builder: (routeContext) =>
                      TodosScreenVanilla(todosController: controller));
            }

          default:
            {
              throw RouteException(message: "No such route");
            }
        }
      };

  static Route<dynamic>? onGenerateRouteInherited(RouteSettings settings) {
    switch (settings.name) {
      case Routes.todos:
        {
          return MaterialPageRoute(
              builder: (routeContext) => TodosScreenInherited());
        }

      default:
        {
          throw RouteException(message: "No such route");
        }
    }
  }
}
