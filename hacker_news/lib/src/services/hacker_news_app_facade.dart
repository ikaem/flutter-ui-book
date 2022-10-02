import 'dart:convert';
import 'dart:developer';

import 'package:hacker_news/src/models/item.dart';
import 'package:hacker_news/src/models/story.dart';
import 'package:hacker_news/src/utils/constants.dart';
import 'package:hacker_news/src/utils/enums.dart';
import 'package:hacker_news/src/utils/exceptions.dart';
import 'package:http/http.dart';

class HackerNewsApiFacade {
  // ok, so this crteates actuall object
  // we can now extract elements from it - duathority, path, params...
  final Uri endpoint = Uri.parse(hackerNewsUrl);

  final Client _client = Client();

  Future<List<Story>> getStories(
      {int storyCount = 10,
      StoryType storiesType = StoryType.newStories}) async {
    try {
      List<Story> stories = await getItems<Story>(fromMap: Story.fromMap);

      return stories;
    } catch (e) {
      log("HackerNews.getTopStories $e");
      rethrow;
    }
  }

  Future<List<T>> getItems<T extends Item>({
    int count = 10,
    StoryType storiesType = StoryType.newStories,
    // note this
    // it is a function that accepts json of map string dynamic, that returns t
    required T Function(Map<String, dynamic> json) fromMap,
  }) async {
// parsing url
    final Uri url =
        Uri.parse("$endpoint/${storiesType.name.toLowerCase()}.json");

    try {
      Response response = await _client.get(url);

      if (response.statusCode != 200) {
        throw HackerNewsApiException(
          statusCode: response.statusCode,
          message: response.body,
        );
      }

      // this is a big assumption - that response body is a map of strings ad values
      List<int> ids = List<int>.from(jsonDecode(response.body));
      ids.removeRange(count, ids.length);

      // now we create promises, and then we wait for it to resolve

      final items = ids.map((id) async {
        final item = await getItem<T>(id.toString(), fromMap);
        return item;
      }).toList();

      return Future.wait(items);
    } catch (e) {
      log("HackerNewsClient.getTopStories $e");
      rethrow;
    }
  }

  Future<T> getItem<T>(
      String id, T Function(Map<String, dynamic> json) fromMap) async {
    try {
      final url = Uri.parse("$endpoint/item/$id.json");

      final response = await _client.get(url);

      if (response.statusCode != 200) {
        throw HackerNewsApiException(
          statusCode: response.statusCode,
          message: response.body,
        );
      }

      // now we decode data again
      Map<String, dynamic> json = jsonDecode(response.body);

      // ok, now he will only return if type is story tyope of json

      if (json["type"] != "story") {
        throw HackerNewsApiException(
          statusCode: response.statusCode,
          message: response.body,
        );
      }

      return fromMap(json);
    } catch (e) {
      log("HackerNewsClient.getTopStories $e");
      rethrow;
    }
  }
}
