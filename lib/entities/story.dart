import 'dart:math';

class Story {
  Story(this.id, this.type, this.by, this.time, this.text, this.url, this.score, this.title,
      this.descendants);

  int id;
  String type;
  String by;
  int time;
  String text;
  String url;
  int score;
  String title;
  int descendants;

  Story.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        type = json['type'],
        by = json['by'],
        time = json['time'],
        text = json['text'],
        url = json['url'],
        score = json['score'],
        title = json['title'],
        descendants = json['descendants'];

  String domain() {
    if (url == null) return null;
    try {
      var domain = Uri.parse(url).host;
      var length = min(domain.length, 30);
      return domain.substring(0, length);
    } catch (e) {
      print("Could not parse item URL");
      return null;
    }
  }

  String date() {
    return ((DateTime.now().millisecondsSinceEpoch / 1000 - time) / 3600).round().toString() + "h";
  }
}
