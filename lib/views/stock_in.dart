import 'package:capsule_events_erp_mobile/common_style/common_form_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StockIn extends StatefulWidget {
  StockIn({Key key}) : super(key: key);

  @override
  _StockInState createState() => _StockInState();
}

class _StockInState extends State<StockIn> {

  GlobalKey<FormState> formState = new GlobalKey<FormState>();

  String brand;
  String subclass;
  String commodity;
  TextEditingController numberController = new TextEditingController();
  TextEditingController remarkController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("入库")
      ),
      body: new SingleChildScrollView(
        child: new Form(
          key: formState,
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.all(8.0),
                child: new DropdownButtonFormField(
                  value: brand,
                  items: [
                    new DropdownMenuItem(value: "123", child: new Text("Capsule Events")),
                    new DropdownMenuItem(value: "3dr", child: new Text("3DR")),
                    new DropdownMenuItem(value: "ddd", child: new Text("Nic")),
                  ], 
                  onChanged: (value) {
                    setState(() {
                      brand = value;
                    });
                  },
                  isDense: true,
                  decoration: formInputDecoration("品牌", "请选择品牌")
                )
              ),
              new Padding(
                padding: new EdgeInsets.all(8.0),
                child: new DropdownButtonFormField(
                  value: subclass,
                  items: [
                    new DropdownMenuItem(value: "123", child: new Text("Capsule Events")),
                    new DropdownMenuItem(value: "3dr", child: new Text("3DR")),
                    new DropdownMenuItem(value: "ddd", child: new Text("Nic")),
                  ], 
                  onChanged: (value) {
                    setState(() {
                      subclass = value;
                    });
                  },
                  isDense: true,
                  decoration: formInputDecoration("子类", "请选择子类")
                )
              ),
              new Padding(
                padding: new EdgeInsets.all(8.0),
                child: new DropdownButtonFormField(
                  value: commodity,
                  items: [
                    new DropdownMenuItem(value: "123", child: new Text("Capsule Events")),
                    new DropdownMenuItem(value: "3dr", child: new Text("3DR")),
                    new DropdownMenuItem(value: "ddd", child: new Text("Nic")),
                  ], 
                  onChanged: (value) {
                    setState(() {
                      commodity = value;
                    });
                  },
                  isDense: true,
                  decoration: formInputDecoration("商品", "请选择商品")
                )
              ),
              new Padding(
                padding: new EdgeInsets.all(8.0),
                child: new TextFormField(
                  controller: numberController,
                  decoration: formInputDecoration("数量", "请输入入库数量"),
                  inputFormatters: [
                    new WhitelistingTextInputFormatter(new RegExp("[0-9.]"))
                  ],
                  keyboardType: TextInputType.number,
                ),
              ),
              new Padding(
                padding: new EdgeInsets.all(8.0),
                child: new TextFormField(
                  controller: remarkController,
                  decoration: formInputDecoration("备注", "请输入备注")
                ),
              )
            ]
          )
        )
      )
    );
  }
}