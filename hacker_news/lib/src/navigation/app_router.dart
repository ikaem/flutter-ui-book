import 'package:flutter/material.dart';
import 'package:hacker_news/src/navigation/app_routes.dart';
import 'package:hacker_news/src/ui/screens/story_details_screen.dart';
import 'package:hacker_news/src/ui/screens/story_list_screen.dart';
import 'package:hacker_news/src/ui/screens/story_web_view_screen.dart';
import 'package:hacker_news/src/utils/enums.dart';

import '../ui/screens/home_screen.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.storyDetailsScreen:
        assert(settings.arguments != null);
        final argumens = settings.arguments as StoryDetailsScreenArguments;

        return MaterialPageRoute(
            settings: settings,
            builder: (_) => StoryDetailsScreen(storyId: argumens.storyId));

      case AppRoutes.storyListScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const StoryListScreen(),
        );

      case AppRoutes.storyWebViewScreen:
        assert(settings.arguments != null);
        final argumens = settings.arguments as StoryWebViewScreenArguments;

        return MaterialPageRoute(
            settings: settings,
            builder: (_) => StoryWebViewScreen(storyId: argumens.storyId));

      default:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => const HomeScreen(
                  storyType: StoryType.newStories,
                ));
    }
  }
}
