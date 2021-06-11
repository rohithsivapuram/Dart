import 'package:dropdown_search/dropdown_search.dart';
import "package:flutter/material.dart";
class predPeriod extends StatefulWidget {

  Function _HANDLE;

  predPeriod(this._HANDLE);

  @override
  State<StatefulWidget> createState() {
    return predPeriodState(_HANDLE);
  }
}

class predPeriodState extends State<predPeriod> {
  String _value;
  Function _HANDLE;

  predPeriodState(this._HANDLE);

  List<String> _predLenList = [
    "1 week",
    "2 weeks",
    "3 weeks",
    "4 weeks",
    "1 month"
  ];

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
          items: _predLenList,
          label: "Select period",
          hint: "Choose period",
          onChanged: (String value) {
            _HANDLE(value);
            print(value);
          },
        ));
  }
}
