import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hacker_news/src/models/story.dart';
import 'package:hacker_news/src/ui/controllers/story_controller.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StoryWebViewScreen extends StatefulWidget {
  const StoryWebViewScreen({
    super.key,
    required this.storyId,
  });

  final int storyId;

  @override
  State<StoryWebViewScreen> createState() => _StoryWebViewScreenState();
}

class _StoryWebViewScreenState extends State<StoryWebViewScreen> {
  late final StoryController _storyController;

  @override
  void initState() {
    super.initState();

    _storyController = StoryController(context.read())
      ..getStoryById(widget.storyId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _storyController,
      child: Scaffold(
        appBar: AppBar(),
        body: Selector<StoryController, Story?>(
          selector: (context, controller) => controller.selectedStory,
          builder: (context, value, child) {
            final story = value;
            if (story == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (story.url == null) {
              return const Center(
                child: Text("This story has no link"),
              );
            }

            return WebView(
              javascriptMode: JavascriptMode.unrestricted,
              // note that here, url is an object
              initialUrl: story.url.toString(),
              gestureRecognizers: <Factory<VerticalDragGestureRecognizer>>{
                Factory<VerticalDragGestureRecognizer>(
                    () => VerticalDragGestureRecognizer())
              },
            );
          },
        ),
      ),
    );
  }
}

class StoryWebViewScreenArguments {
  StoryWebViewScreenArguments(this.storyId);

  final int storyId;
}
