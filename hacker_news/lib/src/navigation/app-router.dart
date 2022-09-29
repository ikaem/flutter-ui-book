import 'package:flutter/cupertino.dart';
import 'package:hacker_news/src/navigation/routes.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.storyDetailsScreen:
        return const StoryDetailsView(storyId: 0);
      case Routes.storyListScreen:
      default:
        return const StoryListView();
    }
  }
}
