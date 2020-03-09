import 'package:capsule_events_erp_mobile/views/login.dart';
import 'package:capsule_events_erp_mobile/views/view.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Capsule Events ERP',
      theme: ThemeData(
        primaryColor: Colors.teal,
        primarySwatch: Colors.teal
      ),
      home: new View(),
      routes: <String, WidgetBuilder>{
        'login': (context) => new Login(),
        'view': (context) => new View()
      },
    );
  }
}
