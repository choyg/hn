import 'dart:async';
import 'dart:convert';
import '../entities/item.dart';

import 'package:http/http.dart' as http;

const host = 'https://hacker-news.firebaseio.com/v0';

Future<List<Item>> getTopStories() async {
  var client = new http.Client();
  var url = "$host/topstories.json";
  client.get(url).then((response) => json.decode(response.body))
}

Future<Item> getItem(id, {http.Client client}) async {
  var url = "$host/item/$id";
  var response = client==null ? await http.get(url) : await client.get(url);
  return Item.fromJson(json.decode(response.body));
}
