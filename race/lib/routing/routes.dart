import 'package:flutter/material.dart';
import 'package:race/views/home_view/home_view.dart';

abstract class Routes {
  static const home = "/";
  static const nextRacesPage = "/next_races";

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

      // case nextRacesPage:
      //   {
      //     return PageRouteBuilder(
      //       pageBuilder: (context, animation, secondaryAnimation) =>
      //           const NextRacesView(),
      //     );
      //   }

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
