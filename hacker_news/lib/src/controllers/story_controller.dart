import 'dart:collection';

import 'package:flutter/cupertino.dart';

class StoryController with ChangeNotifier {
  StoryController(HackerNewsAppFacade? hackerNewsAppFacade)
      : _hackerNewsApiFacade = hackerNewsAppFacade ?? HackerNewsAppFacade();

  final HackerNewsApiFacade _hackerNewsApiFacade;

  List<Story> _stories = [];

  UnmodifiableListView<Story> get stories => UnmodifiableListView(_stories);
  Story? selectedStory;

  Future<void> getStories(
      {StoriesType storiesType = StoriesType.newStories}) async {
    final stories = await _hackerNewsApiFacade.getItems(
      storiesType: storiesType,
      fromMap: Story.fromMap,
    );

    _stories = stories;
    notifyListeners();
  }

  Future<void> getStoryById(int id) async {
    final story =
        await _hackerNewsApiFacade.getItem(id.toString(), Story.fromMap);

// note that here we dont return the story
// thisy should update the provider, so listener should get that data anyhow
    selectedStory = story;
    notifyListeners();
  }
}
