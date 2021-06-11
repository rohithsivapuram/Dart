import 'dart:async';
import 'package:dropdown_search/dropdown_search.dart';
import "package:flutter/material.dart";
import "package:flutter/services.dart" show rootBundle;

class Commodity extends StatefulWidget {
  final Function _handle;

  Commodity(this._handle);

  @override
  State<StatefulWidget> createState() {
    return CommodityState(_handle);
  }
}

class CommodityState extends State<Commodity> {
  final Function _handle;
  String _value;
  List<String> _commodity;
  var _content = "";

  CommodityState(this._handle) {
    _loadData();
  }

  Future<void> _loadData() async {
    String _content =
        await rootBundle.loadString("assets/Commodities/Commodities.txt");
    _commodity = _content.split('\n');
    print(_content);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: DropdownSearch<String>(
          dropDownButton: Icon(Icons.arrow_drop_down, size: 30),
          showClearButton: true,
          showSearchBox: true,
          mode: Mode.BOTTOM_SHEET,
          showSelectedItem: true,
          items: _commodity,
          label: "Select Commodity",
          hint: "Choose a Commodity",
          searchBoxDecoration: InputDecoration(
              helperText: "Select One Commodity From The Following",
              helperStyle: TextStyle(fontWeight: FontWeight.w700),),
          onChanged: (String value) => _handle(value),
        ));
  }
}
