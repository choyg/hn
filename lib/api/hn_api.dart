import 'dart:async';
import 'dart:convert';
import '../entities/story.dart';

import 'package:http/http.dart' as http;

const host = 'https://hacker-news.firebaseio.com/v0';

Future<List<int>> getTopStories() async {
  var client = new http.Client();
  var url = "$host/topstories.json";
  var response = await client.get(url);
  var itemIds = json.decode(response.body);
  return (itemIds as List).cast<int>();
}

Future<Story> getItem(id, {http.Client client}) async {
  var url = "$host/item/$id.json";
  var response = client == null ? await http.get(url) : await client.get(url);
  return Story.fromJson(json.decode(response.body));
}