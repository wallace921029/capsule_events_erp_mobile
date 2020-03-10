import 'package:flutter/material.dart';

class StockQuery extends StatefulWidget {
  StockQuery({Key key}) : super(key: key);

  @override
  _StockQueryState createState() => _StockQueryState();
}

class _StockQueryState extends State<StockQuery> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("库存查询")
      ),
      body: new Text("库存查询")
    );
  }
}