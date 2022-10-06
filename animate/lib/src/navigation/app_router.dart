import 'package:animate/src/navigation/paths.dart';
import 'package:animate/src/screens/excuses_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    // we do need to return a material page route from here
    return MaterialPageRoute(
      builder: (context) {
        // and here we return what needs to be returned

        switch (settings.name) {
          case Paths.excusesPath:
          default:
            return const ExcusesScreen();
        }
      },
    );
  }
}
