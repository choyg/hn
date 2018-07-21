import 'package:flutter/material.dart';
import 'dart:async';
import './entities/story.dart';

// Comments screen for a particular story
class CommentsPage extends StatefulWidget {
  CommentsPage({Key key, this.story}) : super(key: key);

  final Story story;

  @override
  _CommentsState createState() => new _CommentsState();
}

class _CommentsState extends State<CommentsPage> {
  @override
  void initState() {
    super.initState();
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
            new SliverFixedExtentList(
              itemExtent: 50.0,
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (index % 9)],
                    child: new Text('list item $index'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Null> _loadComments() {}
  Widget _getCommentsBody() {}
}
