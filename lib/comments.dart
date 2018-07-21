import 'package:flutter/material.dart';
import 'dart:async';
import './entities/story.dart';
import './widgets/comment_widget.dart';
import './api/hn_api.dart';

// Comments screen for a particular story
class CommentsPage extends StatefulWidget {
  CommentsPage({Key key, this.story}) : super(key: key);

  final Story story;

  @override
  _CommentsState createState() => new _CommentsState();
}

class _CommentsState extends State<CommentsPage> {
  List<int> commentIds = [];

  @override
  void initState() {
    super.initState();
    _loadComments();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new RefreshIndicator(
        onRefresh: _loadComments,
        child: new CustomScrollView(
          slivers: <Widget>[
            new SliverAppBar(
              primary: true,
              title: new Text(widget.story.title),
              actions: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.bookmark_border),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert),
                ),
              ],
            ),
            new SliverList(
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return new CommentWidget(commentId: commentIds[index]);
                },
                childCount: commentIds.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Null> _loadComments() async {
    this.commentIds = [];
    clearCommentsCache();
    mounted ? setState(() => {}) : null;
    this.commentIds = widget.story.kids;
    mounted ? setState(() => {}) : null;
    return null;
  }
}
