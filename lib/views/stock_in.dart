import 'package:capsule_events_erp_mobile/common_style/common_form_style.dart';
import 'package:capsule_events_erp_mobile/utils/my_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StockIn extends StatefulWidget {
  StockIn({Key key}) : super(key: key);

  @override
  _StockInState createState() => _StockInState();
}

class _StockInState extends State<StockIn> {

  GlobalKey<FormState> formState = new GlobalKey<FormState>();

  int brandId;
  int subclassId;
  int commodityId;
  TextEditingController numberController = new TextEditingController();
  TextEditingController remarkController = new TextEditingController();

  List<DropdownMenuItem> brandList = new List<DropdownMenuItem>();
  List<DropdownMenuItem> subclassList = new List<DropdownMenuItem>();
  List<DropdownMenuItem> commodityList = new List<DropdownMenuItem>();

  getBrand() async {
    Response response = await myDio().get('/brand-dic');
    Map<String, dynamic> result = response.data;  
    List<DropdownMenuItem> tempList = new List<DropdownMenuItem>();

    if (result["code"] == "success") {
      for(var i = 0; i < result["data"].length; i++) {
          tempList.add(new DropdownMenuItem(
            value: int.parse(result["data"][i]["id"].toString()),
            child: new Text("${result['data'][i]['brand_name']}"),
          ));
      }
      setState(() {
        brandList = tempList;
      });
    }
  }

  getSubclass(int brandId) async {
    Response response = await myDio().get('/subclass-dic', queryParameters: {
      "brandId": brandId
    });
    Map<String, dynamic> result = response.data;  
    List<DropdownMenuItem> tempList = new List<DropdownMenuItem>();

    if (result["code"] == "success") {
      for(var i = 0; i < result["data"].length; i++) {
          tempList.add(new DropdownMenuItem(
            value: int.parse(result["data"][i]["id"].toString()),
            child: new Text("${result['data'][i]['subclass_name']}"),
          ));
      }
      setState(() {
        subclassList = tempList;
      });
    }
  }

  getCommodity(int brandId, int subclassId) async {
    Response response = await myDio().get('/commodity-dic', queryParameters: {
      "brandId": brandId,
      "subclassId": subclassId
    });
    Map<String, dynamic> result = response.data;  
    List<DropdownMenuItem> tempList = new List<DropdownMenuItem>();

    if (result["code"] == "success") {
      for(var i = 0; i < result["data"].length; i++) {
          tempList.add(new DropdownMenuItem(
            value: int.parse(result["data"][i]["id"].toString()),
            child: new Text("${result['data'][i]['commodity_name']}"),
          ));
      }
      setState(() {
        commodityList = tempList;
      });
    }
  }

  @override
  void initState() {
    getBrand();
    super.initState();
  }

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
                  value: brandId,
                  items: brandList, 
                  onChanged: (value) {
                    setState(() {
                      brandId = value;
                      subclassId = null;
                      commodityId = null;
                    });
                    getSubclass(brandId);
                  },
                  isDense: true,
                  decoration: formInputDecoration("品牌", "请选择品牌")
                )
              ),
              new Padding(
                padding: new EdgeInsets.all(8.0),
                child: new DropdownButtonFormField(
                  value: subclassId,
                  items: subclassList, 
                  onChanged: (value) {
                    setState(() {
                      subclassId = value;
                      commodityId = null;
                    });
                    getCommodity(brandId, subclassId);
                  },
                  isDense: true,
                  decoration: formInputDecoration("子类", "请选择子类")
                )
              ),
              new Padding(
                padding: new EdgeInsets.all(8.0),
                child: new DropdownButtonFormField(
                  value: commodityId,
                  items: commodityList, 
                  onChanged: (value) {
                    setState(() {
                      commodityId = value;
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