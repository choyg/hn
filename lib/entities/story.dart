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
}
