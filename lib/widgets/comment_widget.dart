import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../entities/comment.dart';
import '../api/hn_api.dart';
import '../comments.dart';

class CommentWidget extends StatefulWidget {
  CommentWidget({Key key, this.commentId}) : super(key: key);
  final int commentId;

  @override
  _CommentState createState() => new _CommentState();
}

class _CommentState extends State<CommentWidget> {
  Comment comment;

  @override
  void initState() {
    super.initState();
    loadComment();
  }

  @override
  Widget build(BuildContext context) {
    return new InkWell(
        onTap: () => {},
        child: new Container(
            decoration: const BoxDecoration(
                border: const Border(bottom: const BorderSide(color: Colors.grey, width: 0.5))),
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                  new Container(
                    margin: const EdgeInsets.symmetric(vertical: 2.0),
                    child:
                        new Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                      new Text(
                        _getDetails(),
                        overflow: TextOverflow.clip,
                        style: Theme.of(context).textTheme.body1,
                      ),
                    ]),
                  ),
                ]),
                new Container(
                  margin: const EdgeInsets.only(top: 12.0),
                  child: new Text(comment?.text ?? "...",
                      overflow: TextOverflow.fade, //TODO customize story text theme
                      style: Theme.of(context).textTheme.body1),
                ),
              ],
            )));
  }

  loadComment() async {
    try {
      this.comment = await getComment(widget.commentId);
      mounted ? setState(() => {}) : null;
    } catch (e) {
      print(e);
    }
  }

  String _getDetails() {
    if (comment == null) return "...";
    return "${comment.date()} - ${comment.by}";
  }
}
