import 'package:json_annotation/json_annotation.dart';
part 'item.g.dart';

@JsonSerializable()
class Item extends Object with _$ItemSerializerMixin {
  Item(this.id, this.deleted, this.type, this.by, this.time, this.text, this.dead, this.parent,
      this.poll, this.kids, this.url, this.score, this.title, this.parts, this.descendants);

  int id;
  bool deleted;
  String type;
  String by;
  int time;
  String text;
  bool dead;
  int parent;
  int poll;
  List<int> kids;
  String url;
  int score;
  String title;
  List<int> parts;
  int descendants;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
