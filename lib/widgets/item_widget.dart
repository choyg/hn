import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';
import '../entities/story.dart';
import '../api/hn_api.dart';
import '../comments.dart';

class ItemWidget extends StatefulWidget {
  ItemWidget({Key key, this.itemId}) : super(key: key);
  final int itemId;

  @override
  _ItemState createState() => new _ItemState();
}

class _ItemState extends State<ItemWidget> {
  Story story;

  @override
  void initState() {
    super.initState();
    loadStory();
  }

  @override
  Widget build(BuildContext context) {
    return new InkWell(
        onTap: () => _launchURL(),
        child: new Container(
            decoration: const BoxDecoration(
                border: const Border(bottom: const BorderSide(color: Colors.grey, width: 0.5))),
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  margin: const EdgeInsets.only(top: 12.0),
                  child: new Text(story?.title ?? "...",
                      overflow: TextOverflow.fade, //TODO customize story text theme
                      style: Theme.of(context).textTheme.title),
                ),
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
                      new Text(
                        story?.domain() ?? "...",
                        overflow: TextOverflow.clip,
                        style: Theme.of(context).textTheme.body1,
                      )
                    ]),
                  ),
                  new InkWell(
                      onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CommentsPage(story: this.story)),
                          ),
                      child: Container(
                          padding: const EdgeInsets.only(top: 18.0, bottom: 6.0, left: 32.0),
                          child: new Row(children: <Widget>[
                            const Icon(
                              Icons.comment,
                              color: Colors.deepOrangeAccent,
                            ),
                            new Container(
                              constraints: new BoxConstraints(minWidth: 30.0),
                              margin: const EdgeInsets.only(left: 4.0, right: 24.0),
                              child: new Text(
                                story?.descendants?.toString() ?? "",
                                style: TextStyle(
                                    color: Colors.deepOrangeAccent, fontWeight: FontWeight.w600),
                              ),
                            )
                          ])))
                ]),
              ],
            )));
  }

  loadStory() async {
    try {
      this.story = await getItem(widget.itemId);
      mounted ? setState(() => {}) : null;
    } catch (e) {
      print(e);
    }
  }

  String _getDetails() {
    if (story == null) return "...";
    return "${story.date()} - ${story.by}";
  }

  _launchURL() async {
    var url = story.url;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
