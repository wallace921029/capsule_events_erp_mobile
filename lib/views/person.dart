import 'package:flutter/material.dart';

class Person extends StatefulWidget {
  Person({Key key}) : super(key: key);

  @override
  _PersonState createState() => _PersonState();
}

class _PersonState extends State<Person> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("个人信息")
      ),
      body: new ListView(
        children: <Widget>[
          new ListTile(
            title: new Text("昵称"),
            trailing: new Text("王由之"),
          ),
          new Divider(),
          new ListTile(
            title: new Text("用户id"),
            trailing: new Text("3"),
          ),
          new Container(
            padding: new EdgeInsets.all(8.0),
            child: new RaisedButton(
              onPressed: () {
                // 清空 share_preference 数据
                // 跳转到 login
              },
              color: Colors.teal,
              textColor: Colors.white,
              child: new Text("登出")
            )
          )
        ]
      )
    );
  }
}