// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) {
  return new Item(
      json['id'] as int,
      json['deleted'] as bool,
      json['type'] as String,
      json['by'] as String,
      json['time'] as int,
      json['text'] as String,
      json['dead'] as bool,
      json['parent'] as int,
      json['poll'] as int,
      (json['kids'] as List)?.map((e) => e as int)?.toList(),
      json['url'] as String,
      json['score'] as int,
      json['title'] as String,
      (json['parts'] as List)?.map((e) => e as int)?.toList(),
      json['descendants'] as int);
}

abstract class _$ItemSerializerMixin {
  int get id;
  bool get deleted;
  String get type;
  String get by;
  int get time;
  String get text;
  bool get dead;
  int get parent;
  int get poll;
  List<int> get kids;
  String get url;
  int get score;
  String get title;
  List<int> get parts;
  int get descendants;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'deleted': deleted,
        'type': type,
        'by': by,
        'time': time,
        'text': text,
        'dead': dead,
        'parent': parent,
        'poll': poll,
        'kids': kids,
        'url': url,
        'score': score,
        'title': title,
        'parts': parts,
        'descendants': descendants
      };
}
