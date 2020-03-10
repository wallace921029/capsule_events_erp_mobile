import 'package:capsule_events_erp_mobile/theme/light_theme.dart';
import 'package:capsule_events_erp_mobile/utils/my_shared.dart';
import 'package:capsule_events_erp_mobile/views/login.dart';
import 'package:capsule_events_erp_mobile/views/view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Capsule Events ERP',
      theme: lightTheme,
      darkTheme: new ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: new FutureBuilder(
        future: getMyShared(),
        builder: (BuildContext context, AsyncSnapshot<SharedPreferences> asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.done) {
            var isLogin = asyncSnapshot.data.getBool("isLogin");
            if (isLogin) {
              return new View();
            }
          }
          return new Login();
        }
      ),
      routes: <String, WidgetBuilder>{
        'login': (context) => new Login(),
        'view': (context) => new View()
      },
    );
  }
}
