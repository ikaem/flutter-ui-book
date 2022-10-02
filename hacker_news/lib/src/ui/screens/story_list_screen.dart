import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:hacker_news/src/models/story.dart';
import 'package:hacker_news/src/navigation/app_go_router.dart';
import 'package:hacker_news/src/navigation/go_paths.dart';
import 'package:hacker_news/src/ui/controllers/story_controller.dart';
import 'package:hacker_news/src/utils/enums.dart';
import 'package:provider/provider.dart';

class StoryListScreen extends StatefulWidget {
  const StoryListScreen({
    super.key,
    this.storiesType = StoryType.newStories,
    this.storyController,
  });

  final StoryType storiesType;
  final StoryController? storyController;

  @override
  State<StoryListScreen> createState() => _StoryListScreenState();
}

class _StoryListScreenState extends State<StoryListScreen>
    with AutomaticKeepAliveClientMixin {
// TODO we assign controlelr here as well - so why did we do it in the widget too
  late final StoryController _storyController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

// is it actually possible for the facade to have the context available here
// this will not work because we dont have context yet
    // final facade = context.read<HackerNewsApiFacade>();

// this i dont get - the controller itself needs the service - and i guess we will get the service from the context - will seasrch for provider
// but this will work, and i am not sure why
    _storyController = StoryController(context.read())
      ..getStories(storiesType: widget.storiesType);
    // _storyController = StoryController(facade)
    //   ..getStories(storiesType: widget.storiesType);
  }

  @override
  Widget build(BuildContext context) {
    // this is required by tghe automatic keep alive mixn
    super.build(context);
    // this also comes from providwer - we do priovide it with the said vaklue
    return ChangeNotifierProvider.value(
      value: _storyController,
      child: Scaffold(
        appBar: AppBar(),
        // ok, selector will take data from provider of
        // and should return only data needed for the builder to rebuild
        // it will prevent rebuilding it values selected dont change
        // and second argument to generic is whaT WE WILL want the state to be
        body: Selector<StoryController, UnmodifiableListView<Story>>(
          selector: (context, controller) => controller.stories,
          // so the state below is the state that we selected above here
          builder: (context, state, child) {
            return ListView.builder(
              itemCount: state.length,
              itemBuilder: (context, index) {
                final story = state[index];

                return ListTile(
                  title: Text(story.title),
                  subtitle: GestureDetector(
                    // this will actually navigate to that sotry details
                    onTap: () => _navigateToStoryComments(story),
                    child: Text("${story.descendants} comments"),
                  ),
                  trailing: IconButton(
                    onPressed: () => _navigateToWebViewScreen(story),
                    icon: const Icon(Icons.exit_to_app),
                  ),
                );
              },
            );
            // return Center(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            // children: <Widget>[
            //   const Text("Story list"),
            //   TextButton(
            //     onPressed: () {
            //       Navigator.of(context)
            //           .pushNamed(Routes.storyDetailsScreen);
            //     },
            //     child: const Text("Go to story"),
            //   )
            //     // ],
            //   ),
            // );
          },
        ),
      ),
    );
  }

  void _navigateToStoryComments(Story story) {
    // Navigator.of(context).pushNamed(
    //   AppRoutes.storyDetailsScreen,
    //   arguments: StoryDetailsScreenArguments(story.id),
    // );

    appGoRouter.pushNamed(
      GoPaths.storyDetailsPath,
      params: {
        "storyType": widget.storiesType.name,
        "id": story.id.toString(),
      },
    );
  }

  void _navigateToWebViewScreen(Story story) {
    // Navigator.of(context).pushNamed(
    //   AppRoutes.storyWebViewScreen,
    //   arguments: StoryWebViewScreenArguments(story.id),
    // );

    appGoRouter.pushNamed(
      GoPaths.storyWebViewPath,
      params: {
        "storyType": widget.storiesType.name,
        "id": story.id.toString(),
      },
    );
  }
}
