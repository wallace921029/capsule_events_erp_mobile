import 'package:capsule_events_erp_mobile/utils/my_dio.dart';
import 'package:capsule_events_erp_mobile/utils/my_shared.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  // 登录表单
  GlobalKey<FormState> formkey = new GlobalKey<FormState>();
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();

  login(username, password, context) async {
      Response reponse = await myDio().post('http://localhost:3000/login', data: {
        "username": username,
        "password": password
      });
      Map<String, dynamic> result = reponse.data;
      if (result['code'] == 'success') {
        SharedPreferences instance  = await getMyShared();
        instance.setBool('isLogin', true);
        instance.setString('nickname', result["data"]["nickname"]);
        instance.setInt('userId', result["data"]["id"]);

        Scaffold.of(context).showSnackBar(
          new SnackBar(
            content: new Text('登录成功')
          )
        );

        Navigator.of(context).pushReplacementNamed('view');
      } else {
        Scaffold.of(context).showSnackBar(
          new SnackBar(
            content: new Text("${result['message']}")
          )
        );
      }
    }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return new Scaffold(
      backgroundColor: new Color(0XFFF5F5F5),
      body: new Builder(builder: (BuildContext context){
        return new Container(
          width: screenWidth,
          padding: new EdgeInsets.all(8),
          child: new Form(
              key: formkey,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Text('Capsule Events ERP', style: new TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  new Padding(
                    padding: new EdgeInsets.all(8),
                    child: new TextFormField(
                      controller: username,
                      decoration: new InputDecoration(hintText: '账号'),
                      validator: (value) {
                        return value == "" ? "请输入账号" : null;
                      },
                      onSaved: (value) {
                        username.text = value;
                      },
                    ),
                  ),
                  new Padding(
                      padding: new EdgeInsets.all(8.0),
                      child: new TextFormField(
                        controller: password,
                        obscureText: true,
                        decoration: new InputDecoration(
                          hintText: '密码',
                        ),
                        validator: (value) {
                          return value == "" ? "请输入密码" : null;
                        },
                        onSaved: (value) {
                          password.text = value;
                        },
                      )
                  ),
                  new Container(
                    width: screenWidth / 2,
                    margin: new EdgeInsets.all(8.0),
                    child: new RaisedButton(
                        onPressed: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          if (formkey.currentState.validate()) {
                            formkey.currentState.save();
                            login(username.text, password.text, context); 
                          }
                        },
                        color: Colors.teal,
                        textColor: Colors.white,
                        child: new Text('登录')
                    ),
                  )
                ]
              )
          )
        );
      })
    );
  }
}
