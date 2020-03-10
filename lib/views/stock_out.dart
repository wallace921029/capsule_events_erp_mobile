import 'package:flutter/material.dart';

class StockOut extends StatefulWidget {
  StockOut({Key key}) : super(key: key);

  @override
  _StockOutState createState() => _StockOutState();
}

class _StockOutState extends State<StockOut> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("出库")
      ),
      body: new Text("出库")
    );
  }
}