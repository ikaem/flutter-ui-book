import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hacker_news/src/utils/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StoryDetailsScreen extends StatelessWidget {
  const StoryDetailsScreen({
    super.key,
    required this.storyId,
  });

  final int storyId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: "$yCombinatorUrl/item?id=$storyId",
          gestureRecognizers: <Factory<VerticalDragGestureRecognizer>>{
            Factory<VerticalDragGestureRecognizer>(
                () => VerticalDragGestureRecognizer())
          },
          // gestureRecognizers: {
          //   Factory(() => VerticalDragGestureRecognizer()),
          //   Factory(() => VerticalDragGestureRecognizer()),
          // },
        )
        // body: Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: <Widget>[
        //       const Text("Story Details"),
        //       if (Navigator.canPop(context))
        //         TextButton(
        //           onPressed: () {
        //             Navigator.of(context).pop();
        //           },
        //           child: const Text("Go back"),
        //         )
        //     ],
        //   ),
        // ),
        );
  }
}

class StoryDetailsScreenArguments {
  const StoryDetailsScreenArguments(this.storyId);

  final int storyId;
}
