import 'package:capsule_events_erp_mobile/views/stock_in.dart';
import 'package:capsule_events_erp_mobile/views/stock_out.dart';
import 'package:capsule_events_erp_mobile/views/stock_query.dart';
import 'package:flutter/material.dart';

import 'person.dart';

class View extends StatefulWidget {
  View({Key key}) : super(key: key);

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  int _currentIndex = 0;
  List<Widget> viewList = new List<Widget>();

  @override
  void initState() { 
    super.initState();
    viewList.addAll([new StockIn(), new StockOut(), new StockQuery(), new Person()]);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: viewList[_currentIndex],
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(icon: new Icon(Icons.input), title: new Text("入库")),
          new BottomNavigationBarItem(icon: new Icon(Icons.exit_to_app), title: new Text("出库")),
          new BottomNavigationBarItem(icon: new Icon(Icons.search), title: new Text("查询")),
          new BottomNavigationBarItem(icon: new Icon(Icons.person), title: new Text("我的")),
        ]
      ),
    );
  }
}