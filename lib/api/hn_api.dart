import 'dart:async';
import 'dart:convert';
import '../entities/story.dart';
import '../entities/comment.dart';
import 'package:quiver/cache.dart';
import 'package:http/http.dart' as http;

const host = 'https://hacker-news.firebaseio.com/v0';
var storyCache = new MapCache<int, Story>();
var commentsCache = new MapCache<int, Comment>();

Future<List<int>> getTopStories() async {
  var client = new http.Client();
  var url = "$host/topstories.json";
  var response = await client.get(url);
  var itemIds = json.decode(response.body);
  client.close();
  return (itemIds as List).cast<int>();
}

Future<Story> getItem(id, {http.Client client}) async {
  var cached = await storyCache.get(id);
  if (cached != null) return cached;
  var url = "$host/item/$id.json";
  var response = client == null ? await http.get(url) : await client.get(url);
  var story = Story.fromJson(json.decode(response.body));
  storyCache.set(id, story);
  return story;
}

Future<Comment> getComment(id) async {
  var cached = await commentsCache.get(id);
  if (cached != null) return cached;
  var url = "$host/item/$id.json";
  var response = await http.get(url);
  var comment = Comment.fromJson(json.decode(response.body));
  commentsCache.set(id, comment);
  return comment;
}

clearStoriesCache() {
  storyCache = new MapCache<int, Story>();
}

clearCommentsCache() {
  commentsCache = new MapCache<int, Comment>();
}
