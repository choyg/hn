class Comment {
  Comment(this.by, this.id, this.kids, this.parent, this.text, this.time, this.type);

  String by;
  int id;
  List<int> kids;
  int parent;
  String text;
  int time;
  String type;

  Comment.fromJson(Map<String, dynamic> json)
      : by = json['by'],
        id = json['id'],
        kids = json['kids'],
        parent = json['parent'],
        text = json['text'],
        time = json['time'],
        type = json['type'];
}
