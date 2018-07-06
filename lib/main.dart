import 'package:flutter/material.dart';
import './entities/item.dart';
import './api/hn_api.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Hacker News',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.deepOrange,
      ),
      home: new MyHomePage(title: 'Top Stories'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Item> threads = [];

  @override
  void initState() {
    super.initState();
    getTopStories();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
        appBar: new AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: new Text(widget.title),
        ),
        body: getThreadsBody());
  }

  Widget getThreadsBody() {
    //if (threads.length == 0) return new Center(child: new CircularProgressIndicator());
    return new ListView.builder(
      padding: new EdgeInsets.all(8.0),
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return new InkWell(
            onTap: () => print("Retrieving article from row $index..."),
            child: new Container(
                margin: const EdgeInsets.symmetric(horizontal: 6.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      margin: const EdgeInsets.only(top: 12.0),
                      child: new Text("lol",
                          overflow: TextOverflow.fade, //TODO customize story text theme
                          style: Theme.of(context).textTheme.title),
                    ),
                    new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.symmetric(vertical: 2.0),
                        child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text(
                                "10h - danso",
                                overflow: TextOverflow.clip, //TODO customize story text theme
                                style: Theme.of(context).textTheme.body1,
                              ),
                              new Text(
                                "niemanlab.org",
                                overflow: TextOverflow.clip, //TODO customize story text theme
                                style: Theme.of(context).textTheme.body1,
                              )
                            ]),
                      ),
                      new InkWell(
                          onTap: () => print("Retrieving comments from row $index"),
                          child: Container(
                              padding: const EdgeInsets.only(top: 18.0, bottom: 6.0, left: 32.0),
                              child: new Row(children: <Widget>[
                                const Icon(
                                  Icons.comment,
                                  color: Colors.deepOrangeAccent,
                                ),
                                new Container(
                                  margin: const EdgeInsets.only(left: 4.0, right: 40.0),
                                  child: new Text(
                                    "227",
                                    style: TextStyle(
                                        color: Colors.deepOrangeAccent,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ])))
                    ]),
                  ],
                )));
      },
    );
  }
}
