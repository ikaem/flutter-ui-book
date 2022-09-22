import 'package:flutter/material.dart';
import 'package:race/views/home_view/home_view.dart';
import 'package:race/views/next_races_view/next_races_view.dart';
import 'package:race/views/tester_view/tester_view.dart';

abstract class Routes {
  static const home = "/";
  static const nextRacesPage = "/next_races";
  static const tester = "/tester";

  // contructor private to make sure we dont instantiate the class
  const Routes._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HomeView(),
          );
        }
      case tester:
        {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const TesterView(),
          );
        }

      case nextRacesPage:
        {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const NextRacesView(),
          );
        }

      default:
        {
          // throw const RouteException("Route not found");
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                Text("Hello"),
          );
        }
    }
  }
}
