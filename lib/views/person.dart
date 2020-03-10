import 'package:capsule_events_erp_mobile/utils/my_shared.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Person extends StatefulWidget {
  Person({Key key}) : super(key: key);

  @override
  _PersonState createState() => _PersonState();
}

class _PersonState extends State<Person> {

  Future<bool> removeLoginInfo() async {
    var instance = await getMyShared();
    await instance.remove("isLogin");
    await instance.remove("nickname");
    await instance.remove("userId");
    return new Future(() => true);
  }
  
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
            trailing: new FutureBuilder(
              future: getMyShared(),
              builder: (context, asyncSnapshot) {
                if (asyncSnapshot.connectionState == ConnectionState.done) {
                  String nickname = asyncSnapshot.data.getString("nickname");
                  return new Text(nickname);
                }
                return new Text("waiting");
              }
            )
          ),
          new Divider(),
          new ListTile(
            title: new Text("用户id"),
            trailing: new FutureBuilder(
              future: getMyShared(),
              builder: (BuildContext context, AsyncSnapshot<SharedPreferences> asyncSnapshot) {
                if (asyncSnapshot.connectionState == ConnectionState.done) {
                  var userId = asyncSnapshot.data.getInt("userId");
                  return new Text("$userId");
                }
                return new Text("waiting");
              }
            )
          ),
          new Container(
            padding: new EdgeInsets.all(8.0),
            child: new RaisedButton(
              onPressed: () async {
                // 清空 share_preference 数据
                // 跳转到 login
                var done = await removeLoginInfo();
                if (done) {
                  Navigator.of(context).pushReplacementNamed("login");
                }
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