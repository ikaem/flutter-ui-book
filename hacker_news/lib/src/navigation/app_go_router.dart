import 'package:go_router/go_router.dart';
import 'package:hacker_news/src/navigation/go_paths.dart';
import 'package:hacker_news/src/ui/screens/home_screen.dart';
import 'package:hacker_news/src/ui/screens/story_details_screen.dart';
import 'package:hacker_news/src/ui/screens/story_web_view_screen.dart';
import 'package:hacker_news/src/utils/enums.dart';

final homeRoute = GoRoute(
  path: GoPaths.homePath,
  redirect: (redirectContext, redirectState) {
    final redirectedPath = GoPaths.storiesPath
        .replaceFirst(":storyType", StoryType.newStories.name);

    return redirectedPath;
  },
);

// this is basiucally tabbed navigation
final storiesRoute = GoRoute(
  path: GoPaths.storiesPath,
  routes: [
    storyDetailsRoute,
    storyWebViewRoute,
  ],
  builder: (context, state) {
    final storyTypeName =
        state.params["storyType"] ?? StoryType.newStories.name;

    final storyType = StoryType.values.byName(storyTypeName);

    return HomeScreen(
      key: state.pageKey,
      storyType: storyType,
    );
  },
);

// this is each stroy nacvagiton from here down
final storyDetailsRoute = GoRoute(
  path: GoPaths.storyDetailsPath,
  name: GoPaths.storyDetailsPath,
  builder: (context, state) {
    final id = int.parse(state.params["id"]!);

    return StoryDetailsScreen(
      key: state.pageKey,
      storyId: id,
    );
  },
);

final storyWebViewRoute = GoRoute(
  path: GoPaths.storyWebViewPath,
  name: GoPaths.storyWebViewPath,
  builder: (context, state) {
    final id = int.parse(state.params["id"]!);

    return StoryWebViewScreen(
      storyId: id,
      key: state.pageKey,
    );
  },
);

final appGoRouter = GoRouter(
  routes: [
    homeRoute,
    storiesRoute,
  ],
);
