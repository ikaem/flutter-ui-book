import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:hacker_news/src/models/story.dart';
import 'package:hacker_news/src/services/hacker_news_app_facade.dart';
import 'package:hacker_news/src/utils/enums.dart';

class StoryController with ChangeNotifier {
  StoryController(HackerNewsApiFacade? hackerNewsApiFacade)
      : _hackerNewsApiFacade = hackerNewsApiFacade ?? HackerNewsApiFacade();

  final HackerNewsApiFacade _hackerNewsApiFacade;

  List<Story> _stories = [];

  UnmodifiableListView<Story> get stories => UnmodifiableListView(_stories);
  Story? selectedStory;

  Future<void> getStories({
    StoryType storiesType = StoryType.newStories,
  }) async {
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
